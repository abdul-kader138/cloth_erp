<style>
    .modal-dialog {
        width: 750px;
        /*margin: auto;*/
    }

    /* General Buttons */

</style>

<div class="modal-dialog">
    <div class="modal-content">
        <div style="background-color: #eee" class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i>
            </button>
            <div class="row modal-title">
                <div><p class="pull-left" style="font-size: 18px; color: #31708f">
                        <b><?= lang("close_register", "close_register"); ?></b></p>
                    <p class="pull-right" style="font-size: 16px;  color: #31708f""><b><?= lang("date", "date"); ?>
                        : <?php echo date($register_open_time); ?></b></p></div>
                <br>
                <div id="denomination" style="font-size: 14px; color: #31708f">
                    <b><?php echo ucwords(lang('denominations_info', 'denominations_info')); ?></b></div>
            </div>
            <div class="row modal-title">
            </div>
        </div>
        <div class="modal-body">
            <form action="#" method="post" role="form">
                <input type="hidden" id="cash_in_hand_cal">
                <input type="hidden" id="register_time" value="<?php echo $register_open_time; ?>">
                <div class="jumbotron <?php echo $status ? 'hidden' : ''; ?>" id="step1">

                    <div class="container text-info">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(1)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_1_c', 'class' => 'form-control', 'onblur' => 'calculateTotal();', 'id' => 'r_1_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(5)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_5_c', 'class' => 'form-control', 'onblur' => 'calculateTotal();', 'id' => 'r_5_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(10)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_10_c', 'class' => 'form-control', 'onblur' => 'calculateTotal();', 'id' => 'r_10_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(20)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_20_c', 'class' => 'form-control', 'onblur' => 'calculateTotal();', 'id' => 'r_20_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(25)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_25_c', 'class' => 'form-control', 'onblur' => 'calculateTotal();', 'id' => 'r_25_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(50)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_50_c', 'class' => 'form-control', 'onblur' => 'calculateTotal();', 'id' => 'r_50_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">

                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(100)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_100_c', 'class' => 'form-control', 'onblur' => 'calculateTotal();', 'id' => 'r_100_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(200)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_200_c', 'class' => 'form-control', 'onblur' => 'calculateTotal();', 'id' => 'r_200_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(500)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_500_c', 'class' => 'form-control', 'onblur' => 'calculateTotal();', 'id' => 'r_500_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(1000)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_1000_c', 'class' => 'form-control', 'onblur' => 'calculateTotal();', 'id' => 'r_1000_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(2000)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_2000_c', 'class' => 'form-control', 'onblur' => 'calculateTotal();', 'id' => 'r_2000_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group">
                                            <div class="controls">
                                                <div class="alert alert-success">
                                                    <strong><?= lang("total_cash_in_hand", "total_cash_in_hand"); ?>:
                                                        <br> <?php echo $default_currency->code; ?>&nbsp;<span
                                                                id="total_cash"></span></strong></p>
                                                </div>
                                            </div>
                                        </div>
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
                                            <button class="btn btn-info" type="button" id="sched_register"
                                                    name="next">&nbsp;&nbsp;<?= lang("next", "next"); ?>&nbsp;&nbsp;
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--                </form>-->
                </div>


                <!-- STEP 2 -->
                <div class="jumbotron" id="step2" style="display: none">
                    <div class="container text-info">
                        <!--                <form action="" method="post" role="form">-->
                        <div class="form-group">
                            <div class="row">
                                <p><span><button type="button"
                                                 class="btn btn-xs btn-default no-print pull-right"
                                                 onclick="window.print();">
                                        <i class="fa fa-print"></i> <?= lang('print'); ?>
                                        </button>&nbsp;</span>
                                </p>
                                <table id="fileData" cellpadding="0" cellspacing="0" border="0"
                                       class="table table-bordered table-hover table-striped"
                                       style="margin-bottom: 5px;">
                                    <tbody>
                                    <tr>
                                        <td width="70%"><?= lang("cash_payment", "cash_payment"); ?></td>
                                        <td width="30%" id="cash_payment"></td>
                                    </tr>
                                    <tr>
                                        <td width="70%"><?= lang("credit_payment", "credit_payment"); ?></td>
                                        <td width="30%" id="credit_payment"></td>
                                    </tr>
                                    <tr>
                                        <td width="70%"><?= lang("credit_card_payment", "credit_card_payment"); ?></td>
                                        <td width="30%" id="total_credit"></td>
                                    </tr>
                                    <tr>
                                        <td width="70%"><?= lang("cheque_payment", "cheque_payment"); ?></td>
                                        <td width="30%" id="credit_card_payment"></td>
                                    </tr>
                                    <tr>
                                        <td width="70%"><?= lang("gift_payment", "gift_payment"); ?></td>
                                        <td width="30%" id="gift_payment"></td>
                                    </tr>
                                    <tr>
                                        <td width="70%"><?= lang("refund", "refund"); ?></td>
                                        <td width="30%" id="refund"></td>
                                    </tr>
                                    <tr>
                                        <td width="70%"> <?= lang("return", "return"); ?></td>
                                        <td width="30%" id="total_amex"></td>
                                    </tr>
                                    <tr>
                                        <td width="70%"><?= lang("expense", "expense"); ?></td>
                                        <td width="30%" id="expense"></td>
                                    </tr>
                                    </tbody>
                                </table>
                                <table id="fileData" cellpadding="0" cellspacing="0" border="0"
                                       class="table table-bordered table-hover table-striped"
                                       style="margin-bottom: 5px;">
                                    <tbody>
                                    <tr>
                                        <td width="70%"><b><?= lang("total_sales", "total_sales"); ?> </b></td>
                                        <td width="30%" id="total_sales"><b></b></td>
                                    </tr>
                                    <tr>
                                        <td width="70%"><b><?= lang("cash_in_hand", "cash_in_hand"); ?> </b></td>
                                        <td width="30%" id="cash_in_hand"><b></b></td>
                                    </tr>
                                    <tr>
                                        <td width="70%"><b><?= lang("total_cash", "total_cash"); ?> </b></td>
                                        <td width="30%" id="total_cash"><b></b></td>
                                    </tr>
                                    <tr>
                                        <td width="70%">
                                            <b><?= lang("total_credit_card_slip", "total_credit_card_slip"); ?> </b>
                                        </td>
                                        <td width="30%"
                                            id="total_cash"><?php echo form_input(array('name' => 'total_credit_card_slip', 'class' => 'form-control', 'id' => 'total_credit_card_slip', 'type' => 'number')); ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="70%"><b><?= lang("total_cheque", "total_cheque"); ?> </b></td>
                                        <td width="30%"
                                            id="total_cash"><?php echo form_input(array('name' => 'total_cheque', 'class' => 'form-control', 'required' => 'required', 'id' => 'total_cheque', 'type' => 'number')); ?>
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                                <div class="form-group no-print">
                                    <strong><label for="note"><?= lang("note"); ?></label></strong>

                                    <div class="controls"> <?= form_textarea('note', (isset($_POST['note']) ? $_POST['note'] : ""), 'class="form-control" id="note" style="margin-top: 10px; height: 100px;"'); ?> </div>
                                </div>
                            <hr/>
                            <div class="container text-info">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div class="controls">
                                                    <button class="btn btn-info pull-left" type="button" id="sched_cash"
                                                            name="next"><?= lang("previous", "previous"); ?>
                                                    </button>
                                                    <button class="btn btn-info pull-right" type="button"
                                                            id="sched_close"
                                                            name="next"><?= lang("close_register", "close_register"); ?>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

            </form>
        </div>
    </div>


</div>


</div>
</div>

</div>
<script src="<?= $assets ?>js/jquery-dateformat.min.js"></script>
<script>

    $(document).ready(function () {
        calculateTotal();
        $('#sched_cash').click(function () {
            $('#cash_in_hand').html("");
            $('#denomination').show();
            $('#step1').show();
            $('#step2').hide();
        })
        $('#sched_register').click(function () {
            $('#step1').hide();
            $('#step2').show();
            $('#denomination').hide();
            $('#cash_in_hand').html( $('#cash_in_hand_cal').val());
        })

    });

    function calculateTotal() {
        var r_1_c = (($('#r_1_c').val() != 'undefined') ? ($('#r_1_c').val() * 1) : 0);
        var r_5_c = (($('#r_5_c').val() != 'undefined') ? ($('#r_5_c').val() * 5) : 0);
        var r_10_c = (($('#r_10_c').val() != 'undefined') ? ($('#r_10_c').val() * 10) : 0);
        var r_20_c = (($('#r_20_c').val() != 'undefined') ? ($('#r_20_c').val() * 20) : 0);
        var r_25_c = (($('#r_25_c').val() != 'undefined') ? ($('#r_25_c').val() * 25) : 0);
        var r_50_c = (($('#r_50_c').val() != 'undefined') ? ($('#r_50_c').val() * 50) : 0);
        var r_100_c = (($('#r_100_c').val() != 'undefined') ? ($('#r_100_c').val() * 100) : 0);
        var r_200_c = (($('#r_200_c').val() != 'undefined') ? ($('#r_200_c').val() * 200) : 0);
        var r_500_c = (($('#r_500_c').val() != 'undefined') ? ($('#r_500_c').val() * 500) : 0);
        var r_1000_c = (($('#r_1000_c').val() != 'undefined') ? ($('#r_1000_c').val() * 1000) : 0);
        var r_2000_c = (($('#r_2000_c').val() != 'undefined') ? ($('#r_2000_c').val() * 2000) : 0);
        var total_sale = (r_1_c + r_5_c + r_10_c + r_20_c + r_25_c + r_50_c + r_100_c + r_200_c + r_500_c + r_1000_c + r_2000_c);
        $('#total_cash').html("");
        $('#total_cash').html(total_sale);
        $('#cash_in_hand_cal').val(total_sale);
    }

    (function ($) {
        if ($) {
            $('#sched_register').click(function () {
                $('#step1').hide();
                $('#step2').show();
                $('#denomination').hide();
                $('#cash_in_hand').html( $('#cash_in_hand_cal').val());
                $.post('<?php echo  admin_url('pos/register_all_info'); ?>', {
                    start_date: $('#register_time').val(),
                    '<?php echo $this->security->get_csrf_token_name(); ?>': '<?php echo $this->security->get_csrf_hash(); ?>'
                }, function (response) {
                    if (response == '0') {
                        $('#time_scheduler_error').removeClass('hidden');
                    } else {
                        var respon = JSON.parse(response);
                        $('#time_scheduler_error').addClass('hidden');
                        //
                        var total_cash = parseFloat(respon.cash_sales);
                        // var credit = parseFloat(respon.credit);
                        // var debit = parseFloat(respon.debit);
                        // var cheque = parseFloat(respon.cheque);
                        // var amex = parseFloat(respon.amex);
                        // var visa = parseFloat(respon.visa);
                        // var mc = parseFloat(respon.mc);
                        // var gift = parseFloat(respon.gift);
                        // var deposit = parseFloat(respon.deposit);
                        // var total_sale = parseFloat(respon.grand_total);
                        // var total_return = parseFloat(respon.return);
                        var total_credit_sales = parseFloat(respon.credit_sales);
                        // var total_credit_sales_paid = parseFloat(respon.credit_sales_paid);
                        // var total_payment = 0.0;
                        // if (total_sale) $('#total_sale').html(total_sale.toFixed(2));
                        // if (cash) {
                        //     $('#total_cash').html(cash.toFixed(2));
                        //     total_payment = total_payment + parseFloat(cash.toFixed(2))
                        // }
                        // if (total_credit_sales) {
                        //     $('#total_credit_sale').html(total_credit_sales_paid.toFixed(2));
                        //     total_payment = total_payment + parseFloat(total_credit_sales_paid.toFixed(2))
                        // }
                        if (total_credit_sales) $('#credit_payment').html(total_credit_sales.toFixed(2));
                        if (total_cash) $('#cash_payment').html(total_cash.toFixed(2));

                        // if (debit) {
                        //     $('#total_debit').html(debit.toFixed(2));
                        //     total_payment = total_payment + parseFloat(debit.toFixed(2))
                        // }
                        // if (cheque) {
                        //     $('#total_cheque').html(cheque.toFixed(2));
                        //     total_payment = total_payment + parseFloat(cheque.toFixed(2))
                        //     console.log('go to cheque' + total_payment);
                        // }
                        // if (amex) {
                        //     $('#total_amex').html(amex.toFixed(2));
                        //     total_payment = total_payment + parseFloat(amex.toFixed(2))
                        // }
                        // if (visa) {
                        //     $('#total_visa').html(visa.toFixed(2));
                        //     total_payment = total_payment + parseFloat(visa.toFixed(2))
                        // }
                        // if (mc) {
                        //     $('#total_mc').html(mc.toFixed(2));
                        //     total_payment = total_payment + parseFloat(mc.toFixed(2))
                        //     console.log('go to mc' + total_payment);
                        // }
                        // if (gift) {
                        //     $('#total_gift').html(gift.toFixed(2));
                        //     total_payment = total_payment + parseFloat(gift.toFixed(2))
                        // }
                        // if (deposit) {
                        //     $('#total_deposit').html(deposit.toFixed(2));
                        //     total_payment = total_payment + parseFloat(deposit.toFixed(2))
                        // }
                        // if (total_return) {
                        //     var return_amount = total_return.toFixed(2);
                        //     $('#total_return').html(return_amount.substring(1));
                        // }
                        // if (total_payment) {
                        //     var total = total_payment.toFixed(2);
                        //     $('#total_payment').html(total);
                        // }
                        // var total_dues = (parseFloat(total_sale) - parseFloat(total_payment));
                        // if (total_dues) $('#total_due').text(total_dues.toFixed(2));
                        // if (sDate) $('#sDate').html(sDate);
                        // if (eDate) $('#eDate').html(eDate);
                    }
                });
            });
        }
    })(window.jQuery);
</script>
