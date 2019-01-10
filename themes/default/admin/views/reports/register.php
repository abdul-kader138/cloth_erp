<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<?php

$v = "";
/* if($this->input->post('name')){
  $v .= "&product=".$this->input->post('product');
} */

if ($this->input->post('user')) {
    $v .= "&user=" . $this->input->post('user');
}
if ($this->input->post('start_date')) {
    $v .= "&start_date=" . $this->input->post('start_date');
}
if ($this->input->post('end_date')) {
    $v .= "&end_date=" . $this->input->post('end_date');
}

?>
<style type="text/css">
    .topborder div {
        border-top: 1px solid #CCC;
    }
</style>
<script>
    $(document).ready(function () {
        function total_cash(x) {
            debugger;
            if (x !== null) {
                var y = x.split(' (');
                var z = y[1].split(')');
                return currencyFormat(y[0]) + '<span class="text-success">' + currencyFormat(z[0]) + '</span><span class="text-danger topborder">' + currencyFormat(y[0] - z[0]) + '</span>';
            }
            return '';
        }

        function total_print(x) {
            if (x !== null) {
                return '<div style="text-align: center"><b>' + x + '</b></div>';
            }
            return '';
        }

        function total_sub(x) {
            if (x !== null) {
                var y = x.split(' (');
                var z = y[0].split(')');
                return y[0] + '<br><span class="text-success">' + z[0] + '</span><span class="text-danger topborder"><div>' + (y[0] - z[0]) + '</div></span>';
            }
            return '';
        }

        function total_sub_currency(x) {
            if (x !== null) {
                var y = x.split('_');
                var elem = "";
                var amount=0;
                y.forEach(function (element, i) {
                    // amount +=
                    if (i == 0 && element > 0)
                    {
                        elem += '<span class="text-success">(1)- ' + Math.round(element) + '</span><br>';
                        amount += ((parseFloat(element)) * 1);
                    }
                    if (i == 1 && element > 0)
                    {
                        elem += '<span class="text-success">(5)- ' + Math.round(element) + '</span><br>';
                        amount += ((parseFloat(element)) * 5);
                    }
                    if (i == 2 && element > 0)
                    {
                        elem += '<span class="text-success">(10)- ' + Math.round(element) + '</span><br>';
                        amount += ((parseFloat(element)) * 10);
                    }
                    if (i == 3 && element > 0)
                    {
                        elem += '<span class="text-success">(20)- ' + Math.round(element) + '</span><br>';
                        amount += ((parseFloat(element)) * 20);
                    }
                    if (i == 4 && element > 0)
                    {
                        elem += '<span class="text-success">(25)- ' + Math.round(element) + '</span><br>';
                        amount += ((parseFloat(element)) * 25);
                    }
                    if (i == 5 && element > 0)
                    {
                        elem += '<span class="text-success">(50)- ' + Math.round(element) + '</span><br>';
                        amount += ((parseFloat(element)) * 50);
                    }
                    if (i == 6 && element > 0)
                    {
                        elem += '<span class="text-success">(100)- ' + Math.round(element) + '</span><br>';
                        amount += ((parseFloat(element)) * 100);
                    }
                    if (i == 7 && element > 0)
                    {
                        elem += '<span class="text-success">(200)- ' + Math.round(element) + '</span><br>';
                        amount += ((parseFloat(element)) * 200);
                    }
                    if (i == 8 && element > 0)
                    {
                        elem += '<span class="text-success">(500)- ' + Math.round(element) + '</span><br>';
                        amount += ((parseFloat(element)) * 500);
                    }
                    if (i == 9 && element > 0)
                    {
                        elem += '<span class="text-success">(1000)- ' + Math.round(element) + '</span><br>';
                        amount += ((parseFloat(element)) * 1000);
                    }
                    if (i == 10 && element > 0)
                    {
                        elem += '<span class="text-success">(2000)- ' + Math.round(element) + '</span><br>';
                        amount += ((parseFloat(element)) * 2000);
                    }
                });
                if(amount > 0) elem+='<span class="text-danger topborder"><div>' + amount + '</div></span>';
                return elem;
            }
            return '';
        }

        function total_payment_receive(x) {
            if (x !== null) {
                var y = x.split('_');
                var elem_pay = "";
                var amount=0;
                y.forEach(function (element, i) {
                    amount +=parseFloat(element);
                    if (i == 0 && element > 0) elem_pay += '<span class="text-success" style=""><?=lang("cash_payment");?>-' + element + '</span><br>';
                    if (i == 1 && element > 0) elem_pay += '<span class="text-success"><?=lang("credit_payment");?>-' + element + '</span><br>';
                    if (i == 2 && element > 0) elem_pay += '<span class="text-success"><?=lang("credit_card_payment");?> - ' + element + '</span><br>';
                    if (i == 3 && element > 0) elem_pay += '<span class="text-success"><?=lang("cheque_payment");?>-' + element + '</span><br>';
                    if (i == 4 && element > 0) elem_pay += '<span class="text-success"><?=lang("gift_payment");?>-' + element + '</span><br>';
                });
                if(amount > 0)elem_pay+='<span class="text-danger topborder"><div>' + amount + '</div></span>';
                return elem_pay;
            }
            return '';
        }
        function total_expense(x) {
            if (x !== null) {
                var y = x.split('_');
                var elem_pay = "";
                var amount=0;
                y.forEach(function (element, i) {
                    amount +=parseFloat(element);
                    if (i == 0 && element > 0) elem_pay += '<span class="text-success" style="text-align: left"><?=lang("refund");?> - ' + element + '</span><br>';
                    if (i == 1 && element > 0) elem_pay += '<span class="text-success" style="text-align: left"><?=lang("return");?> - ' + element + '</span><br>';
                    if (i == 2 && element > 0) elem_pay += '<span class="text-success" style="text-align: left"><?=lang("expense");?> - ' + element + '</span><br>';
                });
                if(amount > 0)elem_pay+='<span class="text-danger topborder"><div>' + amount + '</div></span>';
                return elem_pay;
            }
            return '';
        }


        oTable = $('#registerTable').dataTable({
            "aaSorting": [[0, "desc"]],
            "aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "<?= lang('all') ?>"]],
            "iDisplayLength": <?= $Settings->rows_per_page ?>,
            'bProcessing': true, 'bServerSide': true,
            'sAjaxSource': '<?= admin_url('reports/getRrgisterlogs/?v=1' . $v) ?>',
            'fnServerData': function (sSource, aoData, fnCallback) {
                aoData.push({
                    "name": "<?= $this->security->get_csrf_token_name() ?>",
                    "value": "<?= $this->security->get_csrf_hash() ?>"
                });
                $.ajax({'dataType': 'json', 'type': 'POST', 'url': sSource, 'data': aoData, 'success': fnCallback});
            },
            // "aoColumns": [{"mRender": fld}, {"mRender": fld}, null, {"mRender": currencyFormat}, {"mRender": total_sub}, {"mRender": total_sub}, {"mRender": total_cash}, null,{"mRender":total_print}]
            "aoColumns": [{"mRender": fld}, {"mRender": fld}, null,null,null, {"mRender": currencyFormat}, {"mRender": total_sub_currency}, {"mRender": total_payment_receive}, {"mRender": total_expense}, null, {"mRender": total_print}]
        }).fnSetFilteringDelay().dtFilter([
            {column_number: 0, filter_default_label: "[ yyyy-mm-dd HH:mm:ss ]", filter_type: "text", data: []},
            {column_number: 1, filter_default_label: "[ yyyy-mm-dd HH:mm:ss ]", filter_type: "text", data: []},
            {column_number: 2, filter_default_label: "[<?=lang('user');?>]", filter_type: "text", data: []},
            {column_number: 3, filter_default_label: "[<?=lang('cash_in_hand');?>]", filter_type: "text", data: []},
            {column_number: 4, filter_default_label: "[<?=lang('cash_in_hand');?>]", filter_type: "text", data: []},
            {column_number: 5, filter_default_label: "[<?=lang('cash_in_hand');?>]", filter_type: "text", data: []},
            {column_number: 6, filter_default_label: "[<?=lang('cc_slips');?>]", filter_type: "text", data: []},
            {column_number: 7, filter_default_label: "[<?=lang('Cheques');?>]", filter_type: "text", data: []},
            {column_number: 8, filter_default_label: "[<?=lang('total_cash');?>]", filter_type: "text", data: []},
            {column_number: 9, filter_default_label: "[<?=lang('note');?>]", filter_type: "text", data: []},
            {column_number: 10, filter_default_label: "[<?=lang('Credit_Sale');?>]", filter_type: "text", data: []},
        ], "footer");

        $('#form').hide();
        $('.toggle_down').click(function () {
            $("#form").slideDown();
            return false;
        });
        $('.toggle_up').click(function () {
            $("#form").slideUp();
            return false;
        });

    });
</script>
<style>.table td:nth-child(8) {
        /*text-align: center;*/
    }</style>

<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-th-large"></i><?= lang('register_report'); ?><?php
            if ($this->input->post('start_date')) {
                echo "From " . $this->input->post('start_date') . " to " . $this->input->post('end_date');
            }
            ?></h2>

        <div class="box-icon">
            <ul class="btn-tasks">
                <li class="dropdown"><a href="#" class="toggle_up tip" title="<?= lang('hide_form') ?>"><i
                                class="icon fa fa-toggle-up"></i></a></li>
                <li class="dropdown"><a href="#" class="toggle_down tip" title="<?= lang('show_form') ?>"><i
                                class="icon fa fa-toggle-down"></i></a></li>
            </ul>
        </div>
        <div class="box-icon">
            <ul class="btn-tasks">
                <li class="dropdown"><a href="#" id="xls" class="tip" title="<?= lang('download_xls') ?>"><i
                                class="icon fa fa-file-excel-o"></i></a></li>
                <li class="dropdown"><a href="#" id="image" class="tip" title="<?= lang('save_image') ?>"><i
                                class="icon fa fa-file-picture-o"></i></a></li>
            </ul>
        </div>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">

                <p class="introtext"><?= lang('customize_report'); ?></p>

                <div id="form">

                    <?php echo admin_form_open("reports/register"); ?>
                    <div class="row">

                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="control-label" for="user"><?= lang("user"); ?></label>
                                <?php
                                $us[""] = lang('select') . ' ' . lang('user');
                                foreach ($users as $user) {
                                    $us[$user->id] = $user->first_name . " " . $user->last_name;
                                }
                                echo form_dropdown('user', $us, (isset($_POST['user']) ? $_POST['user'] : ""), 'class="form-control" id="user" data-placeholder="' . $this->lang->line("select") . " " . $this->lang->line("user") . '"');
                                ?>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <?= lang("start_date", "start_date"); ?>
                                <?php echo form_input('start_date', (isset($_POST['start_date']) ? $_POST['start_date'] : ""), 'class="form-control datetime" id="start_date"'); ?>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <?= lang("end_date", "end_date"); ?>
                                <?php echo form_input('end_date', (isset($_POST['end_date']) ? $_POST['end_date'] : ""), 'class="form-control datetime" id="end_date"'); ?>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div
                                class="controls"> <?php echo form_submit('submit_report', $this->lang->line("submit"), 'class="btn btn-primary"'); ?> </div>
                    </div>
                    <?php echo form_close(); ?>

                </div>
                <div class="clearfix"></div>

                <div class="table-responsive">
                    <table id="registerTable" cellpadding="0" cellspacing="0" border="0"
                           class="table table-bordered table-hover table-striped reports-table">
                        <thead>
                        <tr>
                            <th><?= lang('open_time'); ?></th>
                            <th><?= lang('close_time'); ?></th>
                            <th width="3%"><?= lang('user'); ?></th>
                            <th width="3%"><?= lang('Cheques'); ?></th>
                            <th width="3%"><?= lang('cc_slips'); ?></th>
                            <th><?= lang('open_amount'); ?></th>
                            <th width="5%"><?= lang('denominations'); ?></th>
                            <th width="10%"><?= lang('payments_received'); ?></th>
                            <th width="10%" style="text-align: left"><?= lang('total_expense'); ?></th>
                            <th style="text-align: left"><?= lang('total_sales'); ?></th>
                            <th><?= lang('cash_in_hand'); ?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="11" class="dataTables_empty"><?= lang('loading_data_from_server') ?></td>
                        </tr>
                        </tbody>
                        <tfoot class="dtFilter">
                        <tr class="active">
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th width="3%"></th>
                            <th></th>
                            <th width="5%"></th>
                            <th width="10%"></th>
                            <th width="10%"></th>
                            <th style="text-align: left"></th>
                            <th></th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<?= $assets ?>js/html2canvas.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#pdf').click(function (event) {
            event.preventDefault();
            window.location.href = "<?=admin_url('reports/getRrgisterlogs/pdf/?v=1' . $v)?>";
            return false;
        });
        $('#xls').click(function (event) {
            event.preventDefault();
            window.location.href = "<?=admin_url('reports/getRrgisterlogs/0/xls/?v=1' . $v)?>";
            return false;
        });
        $('#image').click(function (event) {
            event.preventDefault();
            html2canvas($('.box'), {
                onrendered: function (canvas) {
                    openImg(canvas.toDataURL());
                }
            });
            return false;
        });
    });
</script>