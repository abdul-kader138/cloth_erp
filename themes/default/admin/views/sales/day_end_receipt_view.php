<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<?php if ($modal) { ?>
<div class="modal-dialog no-modal-header" role="document"><div class="modal-content"><div class="modal-body">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i></button>
            <?php
            } else {
            ?><!doctype html>
            <html>
            <head>
                <meta charset="utf-8">
                <title><?=$page_title . "Day End Report"?></title>
                <base href="<?=base_url()?>"/>
                <meta http-equiv="cache-control" content="max-age=0"/>
                <meta http-equiv="cache-control" content="no-cache"/>
                <meta http-equiv="expires" content="0"/>
                <meta http-equiv="pragma" content="no-cache"/>
                <link rel="shortcut icon" href="<?=$assets?>images/icon.png"/>
                <link rel="stylesheet" href="<?=$assets?>styles/theme.css" type="text/css"/>
                <style type="text/css" media="all">
                    body { color: #000; }
                    #wrapper { max-width: 480px; margin: 0 auto; padding-top: 20px; }
                    .btn { border-radius: 0; margin-bottom: 5px; }
                    .left { width:50%; float:left; text-align:left; margin-bottom: 3px; }
                    .right { width:50%; float:right; text-align:right; margin-bottom: 3px; }
                    .bootbox .modal-footer { border-top: 0; text-align: center; }
                    h3 { margin: 5px 0; }
                    .order_barcodes img { float: none !important; margin-top: 5px; }
                    /*@media print {*/
                    /*.no-print { display: none; }*/
                    /*#wrapper { max-width: 480px; width: 100%; min-width: 350px; margin: 0 auto; }*/
                    /*.no-border { border: none !important; }*/
                    /*.border-bottom { border-bottom: 1px solid #ddd !important; }*/
                    /*}*/

                    @media print {
                        #buttons { display: none; }
                        #wrapper { max-width: 600px; width: 100%; margin: 0 auto; font-size:9px; margin-top::-100px; }
                        #wrapper img { max-width:250px; width: 80%; }
                    }
                </style>
            </head>

            <body>
            <?php
            } ?>
            <div id="wrapper">
                <div id="receiptData">
                    <div class="no-print">
                        <?php
                        if ($message) {
                            ?>
                            <div class="alert alert-success">
                                <button data-dismiss="alert" class="close" type="button">×</button>
                                <?=is_array($message) ? print_r($message, true) : $message;?>
                            </div>
                            <?php
                        } ?>
                    </div>
                    <div id="receipt-data">
                        <div class="text-center">
                            <?= !empty($biller->logo) ? '<img src="'.base_url('assets/uploads/logos/'.$biller->logo).'" alt="">' : ''; ?>
                            <h3 style="text-transform:uppercase;">Day End Report</h3>
                        </div>
                        <?php
                        echo "<b> Outlet Name" . " : " . $Settings->site_name . "</b></span>";
                        echo "<p><span class='left'>" .lang("date") . ": " . $result->s_date . " TO ".$result->e_date."</span><span class='right'>";
                        if (!empty($inv->return_sale_ref)) {
                            echo '<span class="left">'.lang("return_ref").': '.$inv->return_sale_ref.'</span>';
                            echo '<span class="right"></span>';
                        }
                        echo "</p>";
                        ?>

                        <div style="clear:both;"></div>
                        <table id="fileData" cellpadding="0" cellspacing="0" border="0"
                               class="table table-bordered table-hover table-striped"
                               style="margin-bottom: 5px;">
                            <tbody>
                            <tr>
                                <td width="70%"><b>Total Sale</b></td>
                                <td width="30%" id="total_sale"><b><?php echo number_format($result->grand_total,2);?></b></td>
                            </tr>
                            </tbody>
                        </table>
                        <table id="fileData" cellpadding="0" cellspacing="0" border="0"
                               class="table table-bordered table-hover table-striped"
                               style="margin-bottom: 5px;">
                            <tbody>
                            <tr>
                                <td width="70%">Cash Payment</td>
                                <td width="30%" id="total_cash"><?php echo $result->cash?></td>
                            </tr>
                            <tr>
                                <td width="70%">Credit Card Payment</td>
                                <td width="30%" id="total_debit"><?php echo $result->credit?></td>
                            </tr>
                            <tr>
                                <td width="70%">Credit Sale Payment</td>
                                <td width="30%" id="total_debit"><?php echo $result->credit_sales_paid?></td>
                            </tr>
                            <tr>
                                <td width="70%">Debit Card Payment</td>
                                <td width="30%" id="total_debit"><?php echo $result->debit?></td>
                            </tr>
                            <tr>
                                <td width="70%">Visa Card Payment</td>
                                <td width="30%" id="total_visa"><?php echo $result->visa?></td>
                            </tr>
                            <tr>
                                <td width="70%">Master Card Payment</td>
                                <td width="30%" id="total_mc"><?php echo $result->mc?></td>
                            </tr>
                            <tr>
                                <td width="70%"> Amex Payment</td>
                                <td width="30%" id="total_amex"><?php echo $result->amex?></td>
                            </tr>
                            <tr>
                                <td width="70%">Cheque Payment</td>
                                <td width="30%" id="total_cheque"><?php echo $result->cheque?></td>
                            </tr>
                            <tr>
                                <td width="70%">Gift Card Payment</td>
                                <td width="30%" id="total_gift"><?php echo $result->cheque?></td>
                            </tr>
                            <tr>
                                <td width="70%">Deposit Payment</td>
                                <td width="30%" id="total_deposit"><?php echo $result->cheque?></td>
                            </tr>
                            <tr>
                                <td width="70%"><b>Total Payment</b></td>
                                <td width="30%" id="total_payment"><b><?php echo $result->total?></b></td>
                            </tr>
                            </tbody>
                        </table>
                        <table id="fileData" cellpadding="0" cellspacing="0" border="0"
                               class="table table-bordered table-hover table-striped"
                               style="margin-bottom: 5px;">
                            <tbody>
                            <tr>
                                <td width="70%"><b>Total Dues </b></td>
                                <td width="30%" id="total_due"><b><?php echo $result->dues?></b></td>
                            </tr>
                            </tbody>
                        </table>
                        <table id="fileData" cellpadding="0" cellspacing="0" border="0"
                               class="table table-bordered table-hover table-striped"
                               style="margin-bottom: 5px;">
                            <tbody>
                            <tr>
                                <td width="70%"><b>Total Return </b></td>
                                <td width="30%" id="total_return"><b><?php echo $result->return?></b></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div id="buttons" style="padding-top:10px; text-transform:uppercase;" class="no-print">
                    <hr>
                    <?php
                    if ($message) {
                        ?>
                        <div class="alert alert-success">
                            <button data-dismiss="alert" class="close" type="button">×</button>
                            <?=is_array($message) ? print_r($message, true) : $message;?>
                        </div>
                        <?php
                    } ?>
                        <span class="pull-right col-xs-12">
                    <?php
                        echo '<button onclick="window.print();" class="btn btn-block btn-primary">'.lang("print").'</button>';
                    ?>
                </span>
                        <span class="col-xs-12">
                    <a class="btn btn-block btn-warning" href="<?= site_url('welcome'); ?>">Back To Dashboard</a>
                </span>
                    <div style="clear:both;"></div>
                </div>
            </div>

            <?php
            if( ! $modal) {
                ?>
                <script type="text/javascript" src="<?= $assets ?>js/jquery-2.0.3.min.js"></script>
                <script type="text/javascript" src="<?= $assets ?>js/bootstrap.min.js"></script>
                <script type="text/javascript" src="<?= $assets ?>js/jquery.dataTables.min.js"></script>
                <script type="text/javascript" src="<?= $assets ?>js/custom.js"></script>
                <?php
            }
            ?>
            <script type="text/javascript"></script>
            <?php /* include FCPATH.'themes'.DIRECTORY_SEPARATOR.$Settings->theme.DIRECTORY_SEPARATOR.'views'.DIRECTORY_SEPARATOR.'pos'.DIRECTORY_SEPARATOR.'remote_printing.php'; */ ?>
            <?php include 'remote_printing.php'; ?>
            <?php
            if($modal) {
            ?>
        </div>
    </div>
</div>
<?php
} else {
    ?>
    </body>
    </html>
    <?php
}
?>
