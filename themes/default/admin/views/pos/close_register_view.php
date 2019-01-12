<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<?php if ($modal) { ?>
<div class="modal-dialog no-modal-header" role="document">
    <div class="modal-content">
        <div class="modal-body">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i>
            </button>
            <?php
            } else {
            ?><!doctype html>
            <html>
            <head>
                <meta charset="utf-8">
                <title><?= $page_title . " " . lang("no") . " " . $inv->id; ?></title>
                <base href="<?= base_url() ?>"/>
                <meta http-equiv="cache-control" content="max-age=0"/>
                <meta http-equiv="cache-control" content="no-cache"/>
                <meta http-equiv="expires" content="0"/>
                <meta http-equiv="pragma" content="no-cache"/>
                <link rel="shortcut icon" href="<?= $assets ?>images/icon.png"/>
                <link rel="stylesheet" href="<?= $assets ?>styles/theme.css" type="text/css"/>
                <style type="text/css" media="all">
                    body {
                        color: #000;
                    }

                    #wrapper {
                        max-width: 480px;
                        margin: 0 auto;
                        padding-top: 20px;
                    }

                    .btn {
                        border-radius: 0;
                        margin-bottom: 5px;
                    }

                    .left {
                        width: 50%;
                        float: left;
                        text-align: left;
                        margin-bottom: 3px;
                    }

                    .right {
                        width: 50%;
                        float: right;
                        text-align: right;
                        margin-bottom: 3px;
                    }

                    .bootbox .modal-footer {
                        border-top: 0;
                        text-align: center;
                    }

                    h3 {
                        margin: 5px 0;
                    }

                    .order_barcodes img {
                        float: none !important;
                        margin-top: 5px;
                    }

                    @media print {
                        #buttons {
                            display: none;
                        }

                        #wrapper {
                            max-width: 600px;
                            width: 100%;
                            margin: 0 auto;
                            font-size: 9px;
                            margin-top:: -100px;
                        }

                        #wrapper img {
                            max-width: 250px;
                            width: 80%;
                        }
                    }
                </style>
            </head>

            <body>
            <?php
            $variance=($inv->current_cash_in_hand - $inv->total_amount);

            } ?>
            <div id="wrapper">
                <div id="receiptData">
                    <div class="no-print">
                        <?php
                        if ($message) {
                            ?>
                            <div class="alert alert-success">
                                <button data-dismiss="alert" class="close" type="button">×</button>
                                <?= is_array($message) ? print_r($message, true) : $message; ?>
                            </div>
                            <?php
                        } ?>
                    </div>
                    <div id="receipt-data">
                        <div class="text-center">
                            <h3 style="border-bottom: 1px solid;"><?php echo lang("close_register"); ?></h3>
                            &nbsp;
                        </div>
                        <?php
                        echo "<p><span class='left'>" . lang("open_time") . ": " . $this->sma->hrld($inv->date) . "</span><span class='right'>";
                        echo lang("open_register") . ": " . $user->username . "</span>";
                        echo '<span class="left">' . lang("close_time") . ': ' . $this->sma->hrld($inv->closed_at) . '</span>';
                        echo '<span class="right">' . lang("close_register") . ": " . $user->username . "</span>";
                        echo "</p>";
                        echo "&nbsp";
                        ?>
                        <div style="clear:both;"></div>
                        <table class="table table-condensed" cellspacing="0" border-spacing="0" border="0">
                            <tbody>
                            <tr>
                                <td width="70%"><?= lang("cash_in_hand", "cash_in_hand"); ?></td>
                                <td>|</td>
                                <td width="30%" id="opening_cash"
                                    style="text-align: right"><?php echo sprintf("%.1f", $inv->cash_in_hand); ?>0
                                </td>
                            </tr>
                            <tr>
                                <td width="70%"><?= lang("cash_payment", "cash_payment"); ?></td>
                                <td>|</td>
                                <td width="30%" id="cash_payment"
                                    style="text-align: right"><?php echo $inv->cash_payment; ?></td>
                            </tr>
                            <tr>
                                <td width="70%"><b><?= lang("credit_sales", "credit_sales"); ?> </b></td>
                                <td>|</td>
                                <td width="30%" id="total_sales_credit"
                                    style="text-align: right"><?php echo $inv->total_sales_credit; ?></td>
                            </tr>
                            <tr>
                                <td width="70%"><?= lang("credit_payment", "credit_payment"); ?></td>
                                <td>|</td>
                                <td width="30%" id="credit_payment"
                                    style="text-align: right"><?php echo $inv->credit_payment; ?></td>
                            </tr>
                            <tr>
                                <td width="70%"><?= lang("cheque_payment", "cheque_payment"); ?></td>
                                <td>|</td>
                                <td width="30%" id="cheque_payment"
                                    style="text-align: right"><?php echo $inv->cheque_payment; ?></td>
                            </tr>
                            <tr>
                                <td width="70%"><?= lang("credit_card_payment", "credit_card_payment"); ?></td>
                                <td>|</td>
                                <td width="30%" id="credit_card_payment"
                                    style="text-align: right"><?php echo $inv->credit_card_payment; ?></td>
                            </tr>
                            <tr>
                                <td width="70%"><?= lang("gift_payment", "gift_payment"); ?></td>
                                <td>|</td>
                                <td width="30%" id="gift_payment"
                                    style="text-align: right"><?php echo $inv->gift_payment; ?></td>
                            </tr>
                            <tr>
                                <td width="70%"><b><?= lang("total_sales", "total_sales"); ?> </b></td>
                                <td>|</td>
                                <td width="30%" id="total_sales"
                                    style="text-align: right"><?php echo $inv->total_sales; ?></td>
                            </tr>
                            <tr>
                                <td width="70%"><?= lang("refund", "refund"); ?></td>
                                <td>|</td>
                                <td width="30%" id="refund" style="text-align: right"><?php echo $inv->refund; ?></td>
                            </tr>
                            <tr>
                                <td width="70%"> <?= lang("return", "return"); ?></td>
                                <td>|</td>
                                <td width="30%" id="return"
                                    style="text-align: right"><?php echo $inv->return_amount; ?></td>
                            </tr>
                            <tr>
                                <td width="70%"><?= lang("expense", "expense"); ?></td>
                                <td>|</td>
                                <td width="30%" id="expense" style="text-align: right"><?php echo $inv->expense; ?></td>
                            </tr>
                            <tr>
                                <td width="70%"><b><?= lang("total_cash", "total_cash"); ?> </b></td>
                                <td>|</td>
                                <td width="30%" id="grand_total"
                                    style="text-align: right"><?php echo $inv->total_amount; ?></td>
                            </tr>

                            <tr>
                                <td width="70%"><b><?= lang("counted_cash", "counted_cash"); ?> </b></td>
                                <td>|</td>
                                <td width="30%" id="cash_in_hand"
                                    style="text-align: right"><?php echo $inv->current_cash_in_hand; ?></td>
                            </tr>

                            <tr>
                                <td width="70%"><b><?= lang("varience", "varience"); ?> </b></td>
                                <td>|</td>
                                <td width="30%" id="varience"
                                    style='color: <?php echo ($variance > 0) ? "red" : "" ?>; text-align: right;'><?php echo ($variance > 0) ? " + " : "" ?><?php echo sprintf("%.2f",($inv->current_cash_in_hand - $inv->total_amount ),2); ?></td>
                            </tr>
                            <tr>
                                <td width="70%">
                                    <b><?= lang("total_credit_card_slip", "total_credit_card_slip"); ?> </b>
                                </td>
                                <td>|</td>
                                <td width="30%" id="varience"
                                    style="text-align: right"><?php echo $inv->total_credit_card_slip; ?></td>
                            </tr>
                            <tr>
                                <td width="70%"><b><?= lang("total_cheque", "total_cheque"); ?> </b></td>
                                <td>|</td>
                                <td width="30%" id="varience"
                                    style="text-align: right"><?php echo $inv->total_cheque; ?></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="clear:both;"></div>
                    <div class="text-center">
                        <h5 style="border-bottom: 1px solid;"><?php echo lang("print_date"); ?> : <?php echo date("d-m-Y h:i:sa"); ?></h5>
                        &nbsp;
                    </div>
                </div>

                <div id="buttons" style="padding-top:10px; text-transform:uppercase;" class="no-print">
                    <span class="pull-left col-xs-12"><?php echo '<button onclick="window.print()" class="btn btn-block btn-primary">' . lang("print") . '</button>'; ?></span>
                    <span class="col-xs-12">
                    <a class="btn btn-block btn-warning" href="<?= admin_url('pos'); ?>"><?= lang("back_to_pos"); ?></a>
                    </span>
                </div>

                <?php
                if (!$modal) {
                    ?>
                    <script type="text/javascript" src="<?= $assets ?>js/jquery-2.0.3.min.js"></script>
                    <script type="text/javascript" src="<?= $assets ?>js/bootstrap.min.js"></script>
                    <script type="text/javascript" src="<?= $assets ?>js/jquery.dataTables.min.js"></script>
                    <script type="text/javascript" src="<?= $assets ?>js/custom.js"></script>
                    <?php
                }
                ?>
                <?php include 'remote_printing.php'; ?>
            </body>
            </html>

