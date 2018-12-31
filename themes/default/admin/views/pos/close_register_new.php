<style>
    .modal-dialog {
        width: 750px;
        /*margin: auto;*/
    }
</style>

<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i>
            </button>
            <div class="row modal-title">
                <div><p class="pull-left" style="font-size: 18px; color: #31708f">
                        <b><?= lang("close_register", "close_register"); ?></b></p>
                    <p class="pull-right" style="font-size: 16px;  color: #31708f""><b><?= lang("date", "date"); ?>
                        : <?php echo date($register_open_time); ?></b></p></div>
                <br>
                <div style="font-size: 14px; color: #31708f">
                    <b><?php echo ucwords(lang('denominations_info', 'denominations_info')); ?></b></div>
            </div>
            <div class="row modal-title">
            </div>
        </div>
        <div class="modal-body">
            <div class="jumbotron <?php echo $status ? 'hidden' : ''; ?>" id="step1">
                <div class="container text-info">
                    <form action="#" method="post" role="form">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(.25)"; ?>
                                            <div class="controls">
                                                <?php echo form_input('f_25_c', '', 'class="form-control" id="f_25_c" type="number"'); ?>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(1)"; ?>
                                            <div class="controls">
                                                <?php echo form_input('r_1_c', '', 'class="form-control" id="r_1_c" type="number"'); ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(10)"; ?>
                                            <div class="controls">
                                                <?php echo form_input('r_10_c', '', 'class="form-control" id="r_10_c" type="number"'); ?>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(50)"; ?>
                                            <div class="controls">
                                                <?php echo form_input('r_50_c', '', 'class="form-control" id="r_50_c" type="number"'); ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(500)"; ?>
                                            <div class="controls">
                                                <?php echo form_input('r_500_c', '', 'class="form-control" id="r_500_c" type="number"'); ?>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-6">

                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(.50)"; ?>
                                            <div class="controls">
                                                <?php echo form_input('f_50_c', '', 'class="form-control" id="f_5_c" type="number"'); ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(5)"; ?>
                                            <div class="controls">
                                                <?php echo form_input('r_5_c', '', 'class="form-control" id="r_5_c" type="number"'); ?>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(20)"; ?>
                                            <div class="controls">
                                                <?php echo form_input('r_20_c', '', 'class="form-control" id="r_20_c" type="number"'); ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(100)"; ?>
                                            <div class="controls">
                                                <?php echo form_input('r_100_c', '', 'class="form-control" id="r_100_c" type="number"'); ?>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>

                                </div>
                            </div>
                        </div>
                </div>

                <div class="container text-info">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="controls">
                                        <button class="btn btn-primary"type="button" id="sched_sales"
                                                name="next"><?= lang("next", "next"); ?>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>

        <!-- STEP 2 -->
        <div class="jumbotron <?php echo $status ? '' : 'hidden'; ?>" id="step2">
            <div class="container text-info">
                <form action="" method="post" role="form">
                    <div class="form-group">
                        <div class="row">
                            <p><?= lang("report_of", "report_of"); ?> : <span
                                        id="sDate"></span> <?= lang("to", "to"); ?> <span
                                        id="eDate"></span>
                                <span> &nbsp;&nbsp;<button type="button"
                                                           class="btn btn-xs btn-default no-print pull-right"
                                                           onclick="window.print();">
                                        <i class="fa fa-print"></i> <?= lang('print'); ?>
                                    </button>&nbsp;
                                    <!--                                <button type="button"-->
                                    <!--                                        class="btn btn-xs btn-default no-print pull-right">-->
                                    <!--                                    <i class="fa fa-th"></i> <a id="receipt_url">-->
                                    <? //= lang("receipt_view", "receipt_view"); ?><!--</a>-->
                                    <!--                                </button></span>-->
                            </p>
                            <table id="fileData" cellpadding="0" cellspacing="0" border="0"
                                   class="table table-bordered table-hover table-striped"
                                   style="margin-bottom: 5px;">
                                <tbody>
                                <tr>
                                    <td width="70%"><b><?= lang("total_sale", "total_sale"); ?></b></td>
                                    <td width="30%" id="total_sale"></td>
                                </tr>
                                </tbody>
                            </table>

                            <table id="fileData" cellpadding="0" cellspacing="0" border="0"
                                   class="table table-bordered table-hover table-striped"
                                   style="margin-bottom: 5px;">
                                <tbody>
                                <tr>
                                    <td width="70%"><?= lang("cash_payment", "cash_payment"); ?></td>
                                    <td width="30%" id="total_cash"></td>
                                </tr>
                                <tr>
                                    <td width="70%"><?= lang("credit_sale_payment", "cash_payment"); ?></td>
                                    <td width="30%" id="total_credit_sale"></td>
                                </tr>
                                <tr>
                                    <td width="70%"><?= lang("credit_card_payment", "credit_card_payment"); ?></td>
                                    <td width="30%" id="total_credit"></td>
                                </tr>
                                <tr>
                                    <td width="70%"><?= lang("debit_card_payment", "debit_card_payment"); ?></td>
                                    <td width="30%" id="total_debit"></td>
                                </tr>
                                <tr>
                                    <td width="70%"><?= lang("visa_card_payment", "visa_card_payment"); ?></td>
                                    <td width="30%" id="total_visa"></td>
                                </tr>
                                <tr>
                                    <td width="70%"><?= lang("master_card_payment", "master_card_payment"); ?></td>
                                    <td width="30%" id="total_mc"></td>
                                </tr>
                                <tr>
                                    <td width="70%"> <?= lang("amex_payment", "amex_payment"); ?></td>
                                    <td width="30%" id="total_amex"></td>
                                </tr>
                                <tr>
                                    <td width="70%"><?= lang("cheque_payment", "cheque_payment"); ?></td>
                                    <td width="30%" id="total_cheque"></td>
                                </tr>
                                <tr>
                                    <td width="70%"><?= lang("gift_card_payment", "gift_card_payment"); ?></td>
                                    <td width="30%" id="total_gift"></td>
                                </tr>
                                <tr>
                                    <td width="70%"><?= lang("deposit_payment", "deposit_payment"); ?></td>
                                    <td width="30%" id="total_deposit"></td>
                                </tr>
                                <tr>
                                    <td width="70%"><b><?= lang("total_payment", "total_payment"); ?></b></td>
                                    <td width="30%" id="total_payment"></td>
                                </tr>
                                </tbody>
                            </table>
                            <table id="fileData" cellpadding="0" cellspacing="0" border="0"
                                   class="table table-bordered table-hover table-striped"
                                   style="margin-bottom: 5px;">
                                <tbody>
                                <tr>
                                    <td width="70%"><b><?= lang("total_dues", "total_dues"); ?> </b></td>
                                    <td width="30%" id="total_due"><b></b></td>
                                </tr>
                                </tbody>
                            </table>
                            <table id="fileData" cellpadding="0" cellspacing="0" border="0"
                                   class="table table-bordered table-hover table-striped"
                                   style="margin-bottom: 5px;">
                                <tbody>
                                <tr>
                                    <td width="70%"><b><?= lang("total_return", "total_return"); ?> </b></td>
                                    <td width="30%" id="total_return"><b></b></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <hr/>
                </form>
            </div>
        </div>

    </div>
</div>

</div>
<script src="<?= $assets ?>js/jquery-dateformat.min.js"></script>
<script>
    (function ($) {
        if ($) {

            $('#sched_sales').click(function () {
                $.post('<?php echo admin_url('sales/day_end_sales'); ?>', {
                    start_date: $('#start_date').val(),
                    end_date: $('#end_date').val(),
                    '<?php echo $this->security->get_csrf_token_name(); ?>': '<?php echo $this->security->get_csrf_hash(); ?>'
                }, function (response) {
                    if (response == '0') {
                        $('#time_scheduler_error').removeClass('hidden');
                    } else {
                        var respon = JSON.parse(response);
                        $('#time_scheduler_error').addClass('hidden');
                        $('#step1').addClass('hidden');
                        $('#step2').removeClass('hidden');
                        //
                        var end_date = $('#end_date').val();
                        var start_date = $('#start_date').val();
                        var str = $('#end_date').val();
                        if (start_date) var sDate = start_date.substring(0, 11);
                        if (end_date) var eDate = end_date.substring(0, 11);

                        var base_url = window.location.pathname.substr(0, window.location.pathname.lastIndexOf('/'));
                        base_url = window.location.origin + base_url + '/admin/sales/day_end_receipt_view?start_date=' + start_date + '&end_date=' + end_date;
                        $("#receipt_url").attr("href", base_url);
                        //
                        console.log(respon);
                        var cash = parseFloat(respon.cash);
                        var credit = parseFloat(respon.credit);
                        var debit = parseFloat(respon.debit);
                        var cheque = parseFloat(respon.cheque);
                        var amex = parseFloat(respon.amex);
                        var visa = parseFloat(respon.visa);
                        var mc = parseFloat(respon.mc);
                        var gift = parseFloat(respon.gift);
                        var deposit = parseFloat(respon.deposit);
                        var total_sale = parseFloat(respon.grand_total);
                        var total_return = parseFloat(respon.return);
                        var total_credit_sales = parseFloat(respon.credit_sales);
                        var total_credit_sales_paid = parseFloat(respon.credit_sales_paid);
                        var total_payment = 0.0;
                        if (total_sale) $('#total_sale').html(total_sale.toFixed(2));
                        if (cash) {
                            $('#total_cash').html(cash.toFixed(2));
                            total_payment = total_payment + parseFloat(cash.toFixed(2))
                        }
                        if (total_credit_sales) {
                            $('#total_credit_sale').html(total_credit_sales_paid.toFixed(2));
                            total_payment = total_payment + parseFloat(total_credit_sales_paid.toFixed(2))
                        }
                        if (credit) {
                            $('#total_credit').html(credit.toFixed(2));
                            total_payment = total_payment + parseFloat(credit.toFixed(2))
                        }
                        if (debit) {
                            $('#total_debit').html(debit.toFixed(2));
                            total_payment = total_payment + parseFloat(debit.toFixed(2))
                        }
                        if (cheque) {
                            $('#total_cheque').html(cheque.toFixed(2));
                            total_payment = total_payment + parseFloat(cheque.toFixed(2))
                            console.log('go to cheque' + total_payment);
                        }
                        if (amex) {
                            $('#total_amex').html(amex.toFixed(2));
                            total_payment = total_payment + parseFloat(amex.toFixed(2))
                        }
                        if (visa) {
                            $('#total_visa').html(visa.toFixed(2));
                            total_payment = total_payment + parseFloat(visa.toFixed(2))
                        }
                        if (mc) {
                            $('#total_mc').html(mc.toFixed(2));
                            total_payment = total_payment + parseFloat(mc.toFixed(2))
                            console.log('go to mc' + total_payment);
                        }
                        if (gift) {
                            $('#total_gift').html(gift.toFixed(2));
                            total_payment = total_payment + parseFloat(gift.toFixed(2))
                        }
                        if (deposit) {
                            $('#total_deposit').html(deposit.toFixed(2));
                            total_payment = total_payment + parseFloat(deposit.toFixed(2))
                        }
                        if (total_return) {
                            var return_amount = total_return.toFixed(2);
                            $('#total_return').html(return_amount.substring(1));
                        }
                        if (total_payment) {
                            var total = total_payment.toFixed(2);
                            $('#total_payment').html(total);
                        }
                        var total_dues = (parseFloat(total_sale) - parseFloat(total_payment));
                        if (total_dues) $('#total_due').text(total_dues.toFixed(2));
                        if (sDate) $('#sDate').html(sDate);
                        if (eDate) $('#eDate').html(eDate);
                    }
                });
            });
        }
        $("#dayReportModal").on("hidden.bs.modal", function () {
            $('#step2').addClass('hidden');
            $('#step1').removeClass('hidden');
        });

    })(window.jQuery);
</script>
