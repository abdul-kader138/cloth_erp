<style>
    .modal-dialog {
        width: 750px;
        /*margin: auto;*/
    }
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
                                            <?php echo $default_currency->code . "(1)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_1_c', 'class' => 'form-control', 'onchange' => 'calculateTotal();', 'id' => 'r_1_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(5)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_5_c', 'class' => 'form-control', 'onchange' => 'calculateTotal();', 'id' => 'r_5_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(10)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_10_c', 'class' => 'form-control', 'onchange' => 'calculateTotal();', 'id' => 'r_10_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(20)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_20_c', 'class' => 'form-control', 'onchange' => 'calculateTotal();', 'id' => 'r_20_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(25)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_25_c', 'class' => 'form-control', 'onchange' => 'calculateTotal();', 'id' => 'r_25_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(50)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_50_c', 'class' => 'form-control', 'onchange' => 'calculateTotal();', 'id' => 'r_50_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">

                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(100)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_100_c', 'class' => 'form-control', 'onchange' => 'calculateTotal();', 'id' => 'r_100_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(200)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_200_c', 'class' => 'form-control', 'onchange' => 'calculateTotal();', 'id' => 'r_200_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(500)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_500_c', 'class' => 'form-control', 'onchange' => 'calculateTotal();', 'id' => 'r_500_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(1000)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_1000_c', 'class' => 'form-control', 'onchange' => 'calculateTotal();', 'id' => 'r_1000_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <?php echo $default_currency->code . "(2000)"; ?>
                                            <div class="controls">
                                                <?php echo form_input(array('name' => 'r_2000_c', 'class' => 'form-control', 'onchange' => 'calculateTotal();', 'id' => 'r_2000_c', 'type' => 'number')); ?>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group">
                                            <div class="controls">
                                                <div class="alert alert-success">
                                                    <strong><?= lang("total_cash_in_hand", "total_cash_in_hand"); ?>:
                                                    <br> <?php echo $default_currency->code;?>&nbsp;<span id="total_cash"></span></strong></p>
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
                                        <button class="btn btn-primary" type="button" id="sched_sales"
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
                            </p>
                            <table id="fileData" cellpadding="0" cellspacing="0" border="0"
                                   class="table table-bordered table-hover table-striped"
                                   style="margin-bottom: 5px;">
                                <tbody>
                                </tbody>
                            </table>

                            <table id="fileData" cellpadding="0" cellspacing="0" border="0"
                                   class="table table-bordered table-hover table-striped"
                                   style="margin-bottom: 5px;">
                                <tbody>
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

    $(document).ready(function () {
        calculateTotal();
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
    }
</script>
