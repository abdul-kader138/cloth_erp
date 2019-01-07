<style>
    .modal-dialog {
        width: 750px;
    }
</style>

<div class="modal-dialog" id="close_modal">
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
            <?php $attrib = array('data-toggle' => 'validator', 'role' => 'form', 'id' => 'close-register-form');
            echo admin_form_open("pos/close_register_new/" . $user_id, $attrib); ?>
            <input type="hidden"  name="cash_in_hand_cal" id="cash_in_hand_cal">
            <input type="hidden" name="cash_in_hand_cal" id="register_time" value="<?php echo $register_open_time; ?>">
            <input type="hidden" name="cash_payment_1"  id="cash_payment_1">
            <input type="hidden" name="credit_payment_1" id="credit_payment_1">
            <input type="hidden" name="credit_card_payment_1" id="credit_card_payment_1">
            <input type="hidden" name="cheque_payment_1" id="cheque_payment_1">
            <input type="hidden" name="gift_payment_1" id="gift_payment_1">
            <input type="hidden" name="refund_1" id="refund_1">
            <input type="hidden" name="expense_1" id="expense_1">
            <input type="hidden" name="return_1" id="return_1">
            <input type="hidden" name="total_sales_1" id="total_sales_1">
            <input type="hidden" name="current_cash_in_hand_1" id="current_cash_in_hand_1">
            <input type="hidden" name="grand_total_1" id="grand_total_1">
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
                                    <td width="30%" id="credit_card_payment"></td>
                                </tr>
                                <tr>
                                    <td width="70%"><?= lang("cheque_payment", "cheque_payment"); ?></td>
                                    <td width="30%" id="cheque_payment"></td>
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
                                    <td width="30%" id="return"></td>
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
                                    <td width="30%" id="grand_total"><b></b></td>
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
                                                    <button class="btn btn-info pull-right" type="submit"
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

                    <?php echo form_close(); ?>
                </div>
            </div>


        </div>


    </div>
</div>


<script>
    $(document).ready(function () {
        calculateTotal();
        $('#sched_cash').click(function () {
            $('#cash_in_hand').html("");
            $('#denomination').show();
            $('#step1').show();
            $('#step2').hide();
        });
        $('#sched_register').click(function () {
            $('#step1').hide();
            $('#step2').show();
            $('#denomination').hide();
            $('#cash_in_hand').html($('#cash_in_hand_cal').val());
        });

        $('#sched_register').click(function () {
            $('#step1').hide();
            $('#step2').show();
            $('#denomination').hide();
            $('#cash_in_hand').html($('#cash_in_hand_cal').val());
            $.post('<?php echo admin_url('pos/register_all_info'); ?>', {
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
                    var credit = parseFloat(respon.cc_sales);
                    var cheque = parseFloat(respon.ch_sales);
                    var gift = parseFloat(respon.gc_sales);
                    var total_credit_sales = parseFloat(respon.credit_sales);
                    var ch_slip = parseFloat(respon.ch_slip);
                    var cc_slip = parseFloat(respon.cc_slip);
                    var return_amount = parseFloat(respon.return_amount);
                    var result_expense = parseFloat(respon.result_expense);
                    var result_refund = parseFloat(respon.refund_amount);
                    var result_all_sales = parseFloat(respon.result_all_sales);
                    var total_cash_in_hand = $('#cash_in_hand_cal').val();
                    var total_cash_amount = 0;
                    var total_expense_amount = 0;
                    if (total_credit_sales) {
                        $('#credit_payment').html(total_credit_sales.toFixed(2));
                        $('#credit_payment_1').val(total_credit_sales.toFixed(2));
                        total_cash_amount += parseFloat(total_credit_sales.toFixed(2));
                    }
                    if (total_cash) {
                        $('#cash_payment').html(total_cash.toFixed(2));
                        $('#cash_payment_1').val(total_cash.toFixed(2));
                        total_cash_amount += parseFloat(total_cash.toFixed(2));
                    }
                    if (cheque) {
                        $('#cheque_payment').html(cheque.toFixed(2));
                        $('#cheque_payment_1').val(cheque.toFixed(2));
                        total_cash_amount += parseFloat(cheque.toFixed(2));
                    }
                    if (gift) {
                        $('#gift_payment').html(gift.toFixed(2));
                        $('#gift_payment_1').val(gift.toFixed(2));
                        total_cash_amount += parseFloat(gift.toFixed(2));
                    }
                    if (credit) {
                        $('#credit_card_payment').html(credit.toFixed(2));
                        $('#credit_card_payment_1').val(credit.toFixed(2));
                        total_cash_amount += parseFloat(credit.toFixed(2));
                    }
                    if (cc_slip) $('#total_credit_card_slip').val(cc_slip);
                    if (ch_slip) $('#total_cheque').val(ch_slip);
                    if (return_amount) {
                        $('#return_1').val(return_amount.toFixed(2));
                        $('#return').html(return_amount.toFixed(2));
                        total_expense_amount += parseFloat(return_amount.toFixed(2));
                    }
                    if (result_expense) {
                        $('#expense_1').val(result_expense.toFixed(2));
                        $('#expense').html(result_expense.toFixed(2));
                        total_expense_amount += parseFloat(result_expense.toFixed(2));
                    }
                    if (result_refund) {
                        $('#refund_1').val(result_refund.toFixed(2));
                        $('#refund').html(result_refund.toFixed(2));
                        total_expense_amount += parseFloat(result_refund.toFixed(2));
                    }
                    if (result_all_sales) {
                        $('#total_sales').html(result_all_sales.toFixed(2));
                        $('#total_sales_1').val(result_all_sales.toFixed(2));
                    }

                    var total_register_cash = ((total_cash_amount + parseFloat(total_cash_in_hand)) - total_expense_amount);
                    $('#grand_total').html(total_register_cash.toFixed(2));
                    $('#grand_total_1').val(total_register_cash.toFixed(2));
                    $('#current_cash_in_hand_1').val(total_cash_in_hand.toFixed(2));
                }
            });
        });
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


    // })(window.jQuery);
</script>
