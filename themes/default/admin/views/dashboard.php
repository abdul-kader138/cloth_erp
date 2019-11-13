<style>
    .sales_modal_open {
        cursor: pointer;
    }

    .task_modal_open {
        cursor: pointer;
    }
</style>
<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<?php
function row_status($x)
{
    if ($x == null) {
        return '';
    } elseif ($x == 'pending') {
        return '<div class="text-center"><span class="label label-warning">' . lang($x) . '</span></div>';
    } elseif ($x == 'completed' || $x == 'paid' || $x == 'sent' || $x == 'received') {
        return '<div class="text-center"><span class="label label-success">' . lang($x) . '</span></div>';
    } elseif ($x == 'partial' || $x == 'transferring') {
        return '<div class="text-center"><span class="label label-info">' . lang($x) . '</span></div>';
    } elseif ($x == 'due') {
        return '<div class="text-center"><span class="label label-danger">' . lang($x) . '</span></div>';
    } else {
        return '<div class="text-center"><span class="label label-default">' . lang($x) . '</span></div>';
    }
}

?>
<div class="row" style="margin-bottom: 5px;">

    <div class="col-sm-12">

        <div class="col-sm-4">
            <div class="small-box padding1010" style="background-color: #FE9C96">
                <h2 class="bold" style="color: white"><?= lang('Total_Task') ?></h2>
                <i class="icon fa fa-heart"></i>
                <p class="bold">
                <h1 style="text-align: center;color: white;"><?= $total_cTask ? $total_cTask : 0 ?></h1></p>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="small-box padding1010" style="background-color: #4AA4EC">
                <h2 class="bold" style="color: white"><?= lang('Total_Pending_Task') ?></h2>
                <i class="icon fa fa-star"></i>
                <p class="bold">
                <h1 style="text-align: center;color: white;"><?= $total_pTask ? $total_pTask : 0 ?></h1></p>

            </div>
        </div>
        <div class="col-sm-4">
            <div class="small-box padding1010 " style="background-color: #38D2BC">
                <h2 class="bold" style="color: white"><?= lang('Total_Complete_Task') ?></h2>
                <i class="icon fa fa-plus-circle"></i>
                <p class="bold">
                <h1 style="text-align: center;color: white;"><?= $total_cTask ? ($total_cTask - $total_pTask) : 0 ?></h1></p>
            </div>
        </div>
    </div>
</div>
<?php if ($Owner || $Admin || $GP['approval_sales_status_approve']) { ?>
    <div class="box" style="margin-bottom: 15px;">
        <div class="box-header">
            <h2 class="blue"><i class="fa-fw fa fa-bar-chart-o"></i><?= lang('Waiting_For_Approval'); ?></h2>
        </div>
        <div class="box-content">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-sm-12">
                            <?php if ($Owner || $Admin || $GP['approval_sales_status_approve']) { ?>
                                <div class="col-sm-3">
                                    <div class="small-box padding1010" style="background-color: #B079FF">
                                        <h4 class="bold" style="color: #ffffff"><?= lang('Task_Approval') ?></h4>
                                        <!--                                        <i class="fa fa-star"></i>-->
                                        <div style="cursor: pointer;">
                                            <a href="<?= admin_url('approval/approval_list'); ?>"
                                               style="text-align: center;font-size: 20px;"><?php echo(($total_st->total < 10 && $total_st->total > 0) ? '0' . $total_st->total : $total_st->total); ?></a>
                                        </div>
                                    </div>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
<?php } ?>


<?php if (($Owner || $Admin || $GP['sales_type_status_view']) && $getAllSales) { ?>
    <div class="row" style="margin-bottom: 15px;">
        <div class="col-lg-12">
            <div class="box">
                <div class="box-header">
                    <h2 class="blue"><i class="fa fa-th"></i><span
                                class="break"></span><?= lang('Task_Approval_Status') ?></h2>
                </div>
                <div class="box-content" style="text-align: center;height: 500px;overflow:auto;">
                    <?php
                    $value = "";
                    $sales_order = "";
                    foreach ($getAllSales as $key => $values) {
                        $value = '<ul class="progress-indicator">';
                        $sales_order = $key;
                        foreach ($values as $lst) {
                            $class_name = "";
                            if (($Owner || $Admin) && $lst["c_status"] == 0) $class_name = " task_modal_open";
                            if (($lst["aprrover_id"] == $lst["user_id"]) && $lst["c_status"] == 0) $class_name = " task_modal_open";
                            $value .= '<li id="' . $lst["id"] . '" class="' . strtolower($lst["status"]) . $class_name . '"> <span  class="' . strtolower($lst["status1"]) . '"></span>' . $lst["pname"] ."," . $lst["step"] . " (" . $lst["status2"] . ")" . '<br>' . $lst["f_name"] . ' ' . $lst["l_name"] .
                                '<br>' . $lst["updated_date"] . '</li>';
                        }
                        $value .= '</ul>';
                        echo($value);
                        echo '<span class="sales_modal_open" id="' . $lst["application_id"] . '" style="text-align: center">Sales Reference No: ' . $sales_order . '</span><hr>';
                    }

                    if (strlen($pagination)) {
                        echo $pagination;
                    } ?>
                </div>

            </div>
        </div>
    </div>
<?php } ?>

<?php if ($Owner || $Admin) { ?>
    <div class="row" style="margin-bottom: 15px;">
        <div class="col-lg-12">
            <div class="box">
                <div class="box-header">
                    <h2 class="blue"><i class="fa fa-th"></i><span class="break"></span><?= lang('quick_links') ?></h2>
                </div>
                <div class="box-content">
                    <div class="col-lg-1 col-md-2 col-xs-6">
                        <a class="bblue white quick-button small" href="<?= admin_url('products') ?>">
                            <i class="fa fa-barcode"></i>

                            <p><?= lang('products') ?></p>
                        </a>
                    </div>
                    <div class="col-lg-1 col-md-2 col-xs-6">
                        <a class="bdarkGreen white quick-button small" href="<?= admin_url('sales') ?>">
                            <i class="fa fa-heart"></i>

                            <p><?= lang('sales') ?></p>
                        </a>
                    </div>

                    <div class="col-lg-1 col-md-2 col-xs-6">
                        <a class="blightOrange white quick-button small" href="<?= admin_url('quotes') ?>">
                            <i class="fa fa-heart-o"></i>

                            <p><?= lang('quotes') ?></p>
                        </a>
                    </div>

                    <div class="col-lg-1 col-md-2 col-xs-6">
                        <a class="bred white quick-button small" href="<?= admin_url('purchases') ?>">
                            <i class="fa fa-star"></i>

                            <p><?= lang('purchases') ?></p>
                        </a>
                    </div>

                    <div class="col-lg-1 col-md-2 col-xs-6">
                        <a class="bpink white quick-button small" href="<?= admin_url('transfers') ?>">
                            <i class="fa fa-star-o"></i>

                            <p><?= lang('transfers') ?></p>
                        </a>
                    </div>

                    <div class="col-lg-1 col-md-2 col-xs-6">
                        <a class="bgrey white quick-button small" href="<?= admin_url('customers') ?>">
                            <i class="fa fa-users"></i>

                            <p><?= lang('customers') ?></p>
                        </a>
                    </div>

                    <div class="col-lg-1 col-md-2 col-xs-6">
                        <a class="bgrey white quick-button small" href="<?= admin_url('suppliers') ?>">
                            <i class="fa fa-users"></i>

                            <p><?= lang('suppliers') ?></p>
                        </a>
                    </div>

                    <div class="col-lg-1 col-md-2 col-xs-6">
                        <a class="blightBlue white quick-button small" href="<?= admin_url('notifications') ?>">
                            <i class="fa fa-comments"></i>

                            <p><?= lang('notifications') ?></p>
                            <!--<span class="notification green">4</span>-->
                        </a>
                    </div>

                    <?php if ($Owner) { ?>
                        <div class="col-lg-1 col-md-2 col-xs-6">
                            <a class="bblue white quick-button small" href="<?= admin_url('auth/users') ?>">
                                <i class="fa fa-group"></i>
                                <p><?= lang('users') ?></p>
                            </a>
                        </div>
                        <div class="col-lg-1 col-md-2 col-xs-6">
                            <a class="bblue white quick-button small" href="<?= admin_url('system_settings') ?>">
                                <i class="fa fa-cogs"></i>

                                <p><?= lang('settings') ?></p>
                            </a>
                        </div>
                    <?php } ?>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
<?php } else { ?>
    <div class="row" style="margin-bottom: 15px;">
        <div class="col-lg-12">
            <div class="box">
                <div class="box-header">
                    <h2 class="blue"><i class="fa fa-th"></i><span class="break"></span><?= lang('quick_links') ?></h2>
                </div>
                <div class="box-content">
                    <?php if ($GP['products-index']) { ?>
                        <div class="col-lg-1 col-md-2 col-xs-6">
                            <a class="bblue white quick-button small" href="<?= admin_url('products') ?>">
                                <i class="fa fa-barcode"></i>
                                <p><?= lang('products') ?></p>
                            </a>
                        </div>
                    <?php }
                    if ($GP['sales-index']) { ?>
                        <div class="col-lg-1 col-md-2 col-xs-6">
                            <a class="bdarkGreen white quick-button small" href="<?= admin_url('sales') ?>">
                                <i class="fa fa-heart"></i>
                                <p><?= lang('sales') ?></p>
                            </a>
                        </div>
                    <?php }
                    if ($GP['quotes-index']) { ?>
                        <div class="col-lg-1 col-md-2 col-xs-6">
                            <a class="blightOrange white quick-button small" href="<?= admin_url('quotes') ?>">
                                <i class="fa fa-heart-o"></i>
                                <p><?= lang('quotes') ?></p>
                            </a>
                        </div>
                    <?php }
                    if ($GP['purchases-index']) { ?>
                        <div class="col-lg-1 col-md-2 col-xs-6">
                            <a class="bred white quick-button small" href="<?= admin_url('purchases') ?>">
                                <i class="fa fa-star"></i>
                                <p><?= lang('purchases') ?></p>
                            </a>
                        </div>
                    <?php }
                    if ($GP['transfers-index']) { ?>
                        <div class="col-lg-1 col-md-2 col-xs-6">
                            <a class="bpink white quick-button small" href="<?= admin_url('transfers') ?>">
                                <i class="fa fa-star-o"></i>
                                <p><?= lang('transfers') ?></p>
                            </a>
                        </div>
                    <?php }
                    if ($GP['customers-index']) { ?>
                        <div class="col-lg-1 col-md-2 col-xs-6">
                            <a class="bgrey white quick-button small" href="<?= admin_url('customers') ?>">
                                <i class="fa fa-users"></i>
                                <p><?= lang('customers') ?></p>
                            </a>
                        </div>
                    <?php }
                    if ($GP['suppliers-index']) { ?>
                        <div class="col-lg-1 col-md-2 col-xs-6">
                            <a class="bgrey white quick-button small" href="<?= admin_url('suppliers') ?>">
                                <i class="fa fa-users"></i>

                                <p><?= lang('suppliers') ?></p>
                            </a>
                        </div>
                    <?php } ?>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
<?php } ?>

<div class="row" style="margin-bottom: 15px;">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header">
                <h2 class="blue"><i class="fa-fw fa fa-tasks"></i> <?= lang('latest_five') ?></h2>
            </div>
            <div class="box-content">
                <div class="row">
                    <div class="col-md-12">

                        <ul id="dbTab" class="nav nav-tabs">
                            <?php if ($Owner || $Admin || $GP['sales-index']) { ?>
                                <li class=""><a href="#sales"><?= lang('sales') ?></a></li>
                            <?php }
                            if ($Owner || $Admin || $GP['quotes-index']) { ?>
                                <li class=""><a href="#quotes"><?= lang('quotes') ?></a></li>
                            <?php }
                            if ($Owner || $Admin || $GP['purchases-index']) { ?>
                                <li class=""><a href="#purchases"><?= lang('purchases') ?></a></li>
                            <?php }
                            if ($Owner || $Admin || $GP['transfers-index']) { ?>
                                <li class=""><a href="#transfers"><?= lang('transfers') ?></a></li>
                            <?php }
                            if ($Owner || $Admin || $GP['customers-index']) { ?>
                                <li class=""><a href="#customers"><?= lang('customers') ?></a></li>
                            <?php }
                            if ($Owner || $Admin || $GP['suppliers-index']) { ?>
                                <li class=""><a href="#suppliers"><?= lang('suppliers') ?></a></li>
                            <?php } ?>
                        </ul>

                        <div class="tab-content">
                            <?php if ($Owner || $Admin || $GP['sales-index']) { ?>

                                <div id="sales" class="tab-pane fade in">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="table-responsive">
                                                <table id="sales-tbl" cellpadding="0" cellspacing="0" border="0"
                                                       class="table table-bordered table-hover table-striped"
                                                       style="margin-bottom: 0;">
                                                    <thead>
                                                    <tr>
                                                        <th style="width:30px !important;">#</th>
                                                        <th><?= $this->lang->line("date"); ?></th>
                                                        <th><?= $this->lang->line("reference_no"); ?></th>
                                                        <th><?= $this->lang->line("customer"); ?></th>
                                                        <th><?= $this->lang->line("status"); ?></th>
                                                        <th><?= $this->lang->line("total"); ?></th>
                                                        <th><?= $this->lang->line("payment_status"); ?></th>
                                                        <th><?= $this->lang->line("paid"); ?></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <?php if (!empty($sales)) {
                                                        $r = 1;
                                                        foreach ($sales as $order) {
                                                            echo '<tr id="' . $order->id . '" class="' . ($order->pos ? "receipt_link" : "invoice_link") . '"><td>' . $r . '</td>
                                                            <td>' . $this->sma->hrld($order->date) . '</td>
                                                            <td>' . $order->reference_no . '</td>
                                                            <td>' . $order->customer . '</td>
                                                            <td>' . row_status($order->sale_status) . '</td>
                                                            <td class="text-right">' . $this->sma->formatMoney($order->grand_total) . '</td>
                                                            <td>' . row_status($order->payment_status) . '</td>
                                                            <td class="text-right">' . $this->sma->formatMoney($order->paid) . '</td>
                                                        </tr>';
                                                            $r++;
                                                        }
                                                    } else { ?>
                                                        <tr>
                                                            <td colspan="7"
                                                                class="dataTables_empty"><?= lang('no_data_available') ?></td>
                                                        </tr>
                                                    <?php } ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            <?php }
                            if ($Owner || $Admin || $GP['quotes-index']) { ?>

                                <div id="quotes" class="tab-pane fade">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="table-responsive">
                                                <table id="quotes-tbl" cellpadding="0" cellspacing="0" border="0"
                                                       class="table table-bordered table-hover table-striped"
                                                       style="margin-bottom: 0;">
                                                    <thead>
                                                    <tr>
                                                        <th style="width:30px !important;">#</th>
                                                        <th><?= $this->lang->line("date"); ?></th>
                                                        <th><?= $this->lang->line("reference_no"); ?></th>
                                                        <th><?= $this->lang->line("customer"); ?></th>
                                                        <th><?= $this->lang->line("status"); ?></th>
                                                        <th><?= $this->lang->line("amount"); ?></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <?php if (!empty($quotes)) {
                                                        $r = 1;
                                                        foreach ($quotes as $quote) {
                                                            echo '<tr id="' . $quote->id . '" class="quote_link"><td>' . $r . '</td>
                                                        <td>' . $this->sma->hrld($quote->date) . '</td>
                                                        <td>' . $quote->reference_no . '</td>
                                                        <td>' . $quote->customer . '</td>
                                                        <td>' . row_status($quote->status) . '</td>
                                                        <td class="text-right">' . $this->sma->formatMoney($quote->grand_total) . '</td>
                                                    </tr>';
                                                            $r++;
                                                        }
                                                    } else { ?>
                                                        <tr>
                                                            <td colspan="6"
                                                                class="dataTables_empty"><?= lang('no_data_available') ?></td>
                                                        </tr>
                                                    <?php } ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            <?php }
                            if ($Owner || $Admin || $GP['purchases-index']) { ?>

                                <div id="purchases" class="tab-pane fade in">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="table-responsive">
                                                <table id="purchases-tbl" cellpadding="0" cellspacing="0" border="0"
                                                       class="table table-bordered table-hover table-striped"
                                                       style="margin-bottom: 0;">
                                                    <thead>
                                                    <tr>
                                                        <th style="width:30px !important;">#</th>
                                                        <th><?= $this->lang->line("date"); ?></th>
                                                        <th><?= $this->lang->line("reference_no"); ?></th>
                                                        <th><?= $this->lang->line("supplier"); ?></th>
                                                        <th><?= $this->lang->line("status"); ?></th>
                                                        <th><?= $this->lang->line("amount"); ?></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <?php if (!empty($purchases)) {
                                                        $r = 1;
                                                        foreach ($purchases as $purchase) {
                                                            echo '<tr id="' . $purchase->id . '" class="purchase_link"><td>' . $r . '</td>
                                                    <td>' . $this->sma->hrld($purchase->date) . '</td>
                                                    <td>' . $purchase->reference_no . '</td>
                                                    <td>' . $purchase->supplier . '</td>
                                                    <td>' . row_status($purchase->status) . '</td>
                                                    <td class="text-right">' . $this->sma->formatMoney($purchase->grand_total) . '</td>
                                                </tr>';
                                                            $r++;
                                                        }
                                                    } else { ?>
                                                        <tr>
                                                            <td colspan="6"
                                                                class="dataTables_empty"><?= lang('no_data_available') ?></td>
                                                        </tr>
                                                    <?php } ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            <?php }
                            if ($Owner || $Admin || $GP['transfers-index']) { ?>

                                <div id="transfers" class="tab-pane fade">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="table-responsive">
                                                <table id="transfers-tbl" cellpadding="0" cellspacing="0" border="0"
                                                       class="table table-bordered table-hover table-striped"
                                                       style="margin-bottom: 0;">
                                                    <thead>
                                                    <tr>
                                                        <th style="width:30px !important;">#</th>
                                                        <th><?= $this->lang->line("date"); ?></th>
                                                        <th><?= $this->lang->line("reference_no"); ?></th>
                                                        <th><?= $this->lang->line("from"); ?></th>
                                                        <th><?= $this->lang->line("to"); ?></th>
                                                        <th><?= $this->lang->line("status"); ?></th>
                                                        <th><?= $this->lang->line("amount"); ?></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <?php if (!empty($transfers)) {
                                                        $r = 1;
                                                        foreach ($transfers as $transfer) {
                                                            echo '<tr id="' . $transfer->id . '" class="transfer_link"><td>' . $r . '</td>
                                                <td>' . $this->sma->hrld($transfer->date) . '</td>
                                                <td>' . $transfer->transfer_no . '</td>
                                                <td>' . $transfer->from_warehouse_name . '</td>
                                                <td>' . $transfer->to_warehouse_name . '</td>
                                                <td>' . row_status($transfer->status) . '</td>
                                                <td class="text-right">' . $this->sma->formatMoney($transfer->grand_total) . '</td>
                                            </tr>';
                                                            $r++;
                                                        }
                                                    } else { ?>
                                                        <tr>
                                                            <td colspan="7"
                                                                class="dataTables_empty"><?= lang('no_data_available') ?></td>
                                                        </tr>
                                                    <?php } ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            <?php }
                            if ($Owner || $Admin || $GP['customers-index']) { ?>

                                <div id="customers" class="tab-pane fade in">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="table-responsive">
                                                <table id="customers-tbl" cellpadding="0" cellspacing="0" border="0"
                                                       class="table table-bordered table-hover table-striped"
                                                       style="margin-bottom: 0;">
                                                    <thead>
                                                    <tr>
                                                        <th style="width:30px !important;">#</th>
                                                        <th><?= $this->lang->line("company"); ?></th>
                                                        <th><?= $this->lang->line("name"); ?></th>
                                                        <th><?= $this->lang->line("email"); ?></th>
                                                        <th><?= $this->lang->line("phone"); ?></th>
                                                        <th><?= $this->lang->line("address"); ?></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <?php if (!empty($customers)) {
                                                        $r = 1;
                                                        foreach ($customers as $customer) {
                                                            echo '<tr id="' . $customer->id . '" class="customer_link pointer"><td>' . $r . '</td>
                                            <td>' . $customer->company . '</td>
                                            <td>' . $customer->name . '</td>
                                            <td>' . $customer->email . '</td>
                                            <td>' . $customer->phone . '</td>
                                            <td>' . $customer->address . '</td>
                                        </tr>';
                                                            $r++;
                                                        }
                                                    } else { ?>
                                                        <tr>
                                                            <td colspan="6"
                                                                class="dataTables_empty"><?= lang('no_data_available') ?></td>
                                                        </tr>
                                                    <?php } ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            <?php }
                            if ($Owner || $Admin || $GP['suppliers-index']) { ?>

                                <div id="suppliers" class="tab-pane fade">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="table-responsive">
                                                <table id="suppliers-tbl" cellpadding="0" cellspacing="0" border="0"
                                                       class="table table-bordered table-hover table-striped"
                                                       style="margin-bottom: 0;">
                                                    <thead>
                                                    <tr>
                                                        <th style="width:30px !important;">#</th>
                                                        <th><?= $this->lang->line("company"); ?></th>
                                                        <th><?= $this->lang->line("name"); ?></th>
                                                        <th><?= $this->lang->line("email"); ?></th>
                                                        <th><?= $this->lang->line("phone"); ?></th>
                                                        <th><?= $this->lang->line("address"); ?></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <?php if (!empty($suppliers)) {
                                                        $r = 1;
                                                        foreach ($suppliers as $supplier) {
                                                            echo '<tr id="' . $supplier->id . '" class="supplier_link pointer"><td>' . $r . '</td>
                                        <td>' . $supplier->company . '</td>
                                        <td>' . $supplier->name . '</td>
                                        <td>' . $supplier->email . '</td>
                                        <td>' . $supplier->phone . '</td>
                                        <td>' . $supplier->address . '</td>
                                    </tr>';
                                                            $r++;
                                                        }
                                                    } else { ?>
                                                        <tr>
                                                            <td colspan="6"
                                                                class="dataTables_empty"><?= lang('no_data_available') ?></td>
                                                        </tr>
                                                    <?php } ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            <?php } ?>

                        </div>


                    </div>

                </div>

            </div>
        </div>
    </div>

</div>

<script type="text/javascript">
    $(document).ready(function () {
        $('.order').click(function () {
            window.location.href = '<?=admin_url()?>orders/view/' + $(this).attr('id') + '#comments';
        });
        $('.invoice').click(function () {
            window.location.href = '<?=admin_url()?>orders/view/' + $(this).attr('id');
        });
        $('.quote').click(function () {
            window.location.href = '<?=admin_url()?>quotes/view/' + $(this).attr('id');
        });
    });
</script>
