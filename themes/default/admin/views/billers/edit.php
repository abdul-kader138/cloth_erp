<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i>
            </button>
            <h4 class="modal-title" id="myModalLabel"><?php echo lang('edit_biller'); ?></h4>
        </div>
        <?php $attrib = array('data-toggle' => 'validator', 'role' => 'form');
        echo admin_form_open_multipart("billers/edit/" . $biller->id, $attrib); ?>
        <div class="modal-body">
            <p><?= lang('enter_info'); ?></p>

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <?= lang("logo", "biller_logo"); ?>
                        <?php
                        $biller_logos[''] = '';
                        foreach ($logos as $key => $value) {
                            $biller_logos[$value] = $value;
                        }
                        echo form_dropdown('logo', $biller_logos, $biller->logo, 'class="form-control select" id="biller_logo" required="required" '); ?>
                    </div>
                </div>

                <div class="col-md-6">
                    <div id="logo-con" class="text-center"><img
                            src="<?= base_url('assets/uploads/logos/' . $biller->logo) ?>" alt=""></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group company">
                        <?= lang("company", "company"); ?>
                        <?php echo form_input('company', $biller->company, 'class="form-control tip" id="company" required="required"'); ?>
                    </div>
                    <div class="form-group person">
                        <?= lang("name", "name"); ?>
                        <?php echo form_input('name', $biller->name, 'class="form-control tip" id="name" required="required"'); ?>
                    </div>
                    <div class="form-group">
                        <?= lang("vat_no", "vat_no"); ?>
                        <?php echo form_input('vat_no', $biller->vat_no, 'class="form-control" id="vat_no"'); ?>
                    </div>
                    <div class="form-group">
                        <?= lang("gst_no", "gst_no"); ?>
                        <?php echo form_input('gst_no', $biller->gst_no, 'class="form-control" id="gst_no"'); ?>
                    </div>
                    <!--<div class="form-group company">
                    <?= lang("contact_person", "contact_person"); ?>
                    <?php //echo form_input('contact_person', $biller->contact_person, 'class="form-control" id="contact_person" required="required"'); ?>
                </div> -->
                    <div class="form-group">
                        <?= lang("email_address", "email_address"); ?>
                        <input type="email" name="email" class="form-control" required="required" id="email_address"
                               value="<?= $biller->email ?>"/>
                    </div>
                    <div class="form-group">
                        <?= lang("phone", "phone"); ?>
                        <input type="tel" name="phone" class="form-control" required="required" id="phone"
                               value="<?= $biller->phone ?>"/>
                    </div>
                    <div class="form-group">
                        <?= lang("address", "address"); ?>
                        <?php echo form_input('address', $biller->address, 'class="form-control" id="address" required="required"'); ?>
                    </div>

                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <?= lang("postal_code", "postal_code"); ?>
                        <?php echo form_input('postal_code', $biller->postal_code, 'class="form-control" id="postal_code"'); ?>
                    </div>
                    <div class="form-group">
                        <?= lang("country", "country"); ?>
                        <?php echo form_input('country', $biller->country, 'class="form-control" id="country"'); ?>
                    </div>
                    <div class="form-group">
                        <?= lang("bcf1", "cf1"); ?>
                        <?php echo form_input('cf1', $biller->cf1, 'class="form-control" id="cf1"'); ?>
                    </div>
                    <div class="form-group">
                        <?= lang("bcf2", "cf2"); ?>
                        <?php echo form_input('cf2', $biller->cf2, 'class="form-control" id="cf2"'); ?>

                    </div>

                    <div class="form-group">
                        <?= lang("city", "city"); ?>
                        <?php echo form_input('city', $biller->city, 'class="form-control" id="city" required="required"'); ?>
                    </div>
                    <div class="form-group">
                        <?= lang("state", "state"); ?>
                        <?php
                        if ($Settings->indian_gst) {
                            $states = $this->gst->getIndianStates();
                            echo form_dropdown('state', $states, $biller->state, 'class="form-control select" id="state" required="required"');
                        } else {
                            echo form_input('state', $biller->state, 'class="form-control" id="state"');
                        }
                        ?>
                    </div>

                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <?= lang("invoice_footer", "invoice_footer"); ?>
                        <?php echo form_textarea('invoice_footer', $biller->invoice_footer, 'class="form-control skip" id="invoice_footer" style="height:100px;"'); ?>
                    </div>
                </div>
            </div>
                <fieldset>
                    <legend align="middle"><b> <?= lang("proof", "proof"); ?></b></legend>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <?= lang("prefix", "prefix"); ?>
                                <?php echo form_input('prefix_proof',  (isset($_POST['prefix_proof']) ? $_POST['prefix_proof'] :  $biller->prefix_proof), 'class="form-control" id="prefix_proof"'); ?>
                            </div>
                            <div class="form-group">
                                <?= lang("authorization_number", "authorization_number"); ?>
                                <?php echo form_input('authorization_number_proof', (isset($_POST['authorization_number_proof']) ? $_POST['authorization_number_proof'] :  $biller->authorization_number_proof), 'class="form-control" id="authorization_number_proof"'); ?>
                            </div>
                            <div class="form-group">
                                <?= lang("expire_date", "expire_date"); ?>
                                <?php echo form_input('expire_date_proof', (isset($_POST['expire_date_proof']) ? $_POST['expire_date_proof'] :  $this->sma->hrsd($biller->expire_date_proof)), 'class="form-control date" id="expire_date_proof"'); ?>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <?= lang("sequence", "sequence"); ?>
                                <?php echo form_input(array('name'=>'sequence_proof','type'=>'number'), (isset($_POST['sequence_proof']) ? $_POST['sequence_proof'] :  $biller->sequence_proof), 'class="form-control"  id="sequence_proof"'); ?>
                            </div>
                            <div class="form-group">
                                <?= lang("sequence_limit", "sequence_limit"); ?>
                                <?php echo form_input(array('name'=>'sequence_limit_proof','type'=>'number'),(isset($_POST['sequence_limit_proof']) ? $_POST['sequence_limit_proof'] :  $biller->sequence_limit_proof), 'class="form-control" id="sequence_limit_proof"'); ?>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend align="middle"><b> <?= lang("final_consumer", "final_consumer"); ?></b></legend>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <?= lang("prefix", "prefix"); ?>
                                <?php echo form_input('prefix_fc', (isset($_POST['prefix_fc']) ? $_POST['prefix_fc'] :  $biller->prefix_fc), 'class="form-control" id="prefix_fc"'); ?>
                            </div>
                            <div class="form-group">
                                <?= lang("authorization_number", "authorization_number"); ?>
                                <?php echo form_input('authorization_number_fc', (isset($_POST['authorization_number_fc']) ? $_POST['authorization_number_fc'] :  $biller->authorization_number_fc), 'class="form-control" id="authorization_number_fc"'); ?>
                            </div>
                            <div class="form-group">
                                <?= lang("expire_date", "expire_date"); ?>
                                <?php echo form_input('expire_date_fc', (isset($_POST['expire_date_fc']) ? $_POST['expire_date_fc'] :  $this->sma->hrsd($biller->expire_date_fc)), 'class="form-control date" id="expire_date_fc"'); ?>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <?= lang("sequence", "sequence"); ?>
                                <?php echo form_input(array('name'=>'sequence_fc','type'=>'number'),(isset($_POST['sequence_fc']) ? $_POST['sequence_fc'] :  $biller->sequence_fc), 'class="form-control" id="sequence_fc"'); ?>
                            </div>
                            <div class="form-group">
                                <?= lang("sequence_limit", "sequence_limit"); ?>
                                <?php echo form_input(array('name'=>'sequence_limit_fc','type'=>'number'), (isset($_POST['sequence_limit_fc']) ? $_POST['sequence_limit_fc'] :  $biller->sequence_limit_fc), 'class="form-control" id="sequence_limit_fc"'); ?>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend align="middle"><b><?= lang("credit_fiscal", "credit_fiscal"); ?></b></legend>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <?= lang("prefix", "prefix"); ?>
                                <?php echo form_input('prefix_cf', (isset($_POST['prefix_cf']) ? $_POST['prefix_cf'] :  $biller->prefix_cf), 'class="form-control" id="prefix_cf"'); ?>
                            </div>
                            <div class="form-group">
                                <?= lang("authorization_number", "authorization_number"); ?>
                                <?php echo form_input('authorization_number_cf', (isset($_POST['authorization_number_cf']) ? $_POST['authorization_number_cf'] :  $biller->authorization_number_cf), 'class="form-control" id="authorization_number_cf"'); ?>
                            </div>
                            <div class="form-group">
                                <?= lang("expire_date", "expire_date"); ?>
                                <?php echo form_input('expire_date_cf', (isset($_POST['expire_date_cf']) ? $_POST['expire_date_cf'] :  $this->sma->hrsd($biller->expire_date_cf)), 'class="form-control date" id="expire_date_cf"'); ?>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <?= lang("sequence", "sequence"); ?>
                                <?php echo form_input(array('name'=>'sequence_cf','type'=>'number'), (isset($_POST['sequence_cf']) ? $_POST['sequence_cf'] :  $biller->sequence_cf), 'class="form-control" id="sequence_cf"'); ?>
                            </div>
                            <div class="form-group">
                                <?= lang("sequence_limit", "sequence_limit"); ?>
                                <?php echo form_input(array('name'=>'sequence_limit_cf','type'=>'number'), (isset($_POST['sequence_limit_cf']) ? $_POST['sequence_limit_cf'] :  $biller->sequence_limit_cf), 'class="form-control" id="sequence_limit_cf"'); ?>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend align="middle"><b><?= lang("credit_note", "credit_note"); ?></b></legend>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <?= lang("prefix", "prefix"); ?>
                                <?php echo form_input('prefix_cn', (isset($_POST['prefix_cn']) ? $_POST['prefix_cn'] :  $biller->prefix_cn),  'class="form-control" id="prefix_cn"'); ?>
                            </div>
                            <div class="form-group">
                                <?= lang("authorization_number", "authorization_number"); ?>
                                <?php echo form_input('authorization_number_cn', (isset($_POST['authorization_number_cn']) ? $_POST['authorization_number_cn'] :  $biller->authorization_number_cn),  'class="form-control" id="authorization_number_cn"'); ?>
                            </div>
                            <div class="form-group">
                                <?= lang("expire_date", "expire_date"); ?>
                                <?php echo form_input('expire_date_cn', (isset($_POST['expire_date_cn']) ? $_POST['expire_date_cn'] :  $this->sma->hrsd($biller->expire_date_cn)), 'class="form-control date" id="expire_date_cn"'); ?>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <?= lang("sequence", "sequence"); ?>
                                <?php echo form_input(array('name'=>'sequence_cn','type'=>'number'),  (isset($_POST['sequence_cn']) ? $_POST['sequence_cn'] :  $biller->sequence_cn),  'class="form-control" id="sequence_cn"'); ?>
                            </div>
                            <div class="form-group">
                                <?= lang("sequence_limit", "sequence_limit"); ?>
                                <?php echo form_input(array('name'=>'sequence_limit_cn','type'=>'number'),  (isset($_POST['sequence_limit_cn']) ? $_POST['sequence_limit_cn'] :  $biller->sequence_limit_cn),  'class="form-control" id="sequence_limit_cn"'); ?>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend align="middle"><b><?= lang("special_regime", "special_regime"); ?></b></legend>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <?= lang("prefix", "prefix"); ?>
                                <?php echo form_input('prefix_sr', (isset($_POST['prefix_sr']) ? $_POST['prefix_sr'] :  $biller->prefix_sr),  'class="form-control" id="prefix_sr"'); ?>
                            </div>
                            <div class="form-group">
                                <?= lang("authorization_number", "authorization_number"); ?>
                                <?php echo form_input('authorization_number_sr', (isset($_POST['authorization_number_sr']) ? $_POST['authorization_number_sr'] :  $biller->authorization_number_sr),  'class="form-control" id="authorization_number_sr"'); ?>
                            </div>
                            <div class="form-group">
                                <?= lang("expire_date", "expire_date"); ?>
                                <?php echo form_input('expire_date_sr', (isset($_POST['expire_date_sr']) ? $_POST['expire_date_sr'] :  $this->sma->hrsd($biller->expire_date_sr)),  'class="form-control date" id="expire_date_sr"'); ?>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <?= lang("sequence", "sequence"); ?>
                                <?php echo form_input(array('name'=>'sequence_sr','type'=>'number'),  (isset($_POST['sequence_sr']) ? $_POST['sequence_sr'] :  $biller->sequence_sr),  'class="form-control" id="sequence_sr"'); ?>
                            </div>
                            <div class="form-group">
                                <?= lang("sequence_limit", "sequence_limit"); ?>
                                <?php echo form_input(array('name'=>'sequence_limit_sr','type'=>'number'),  (isset($_POST['sequence_limit_sr']) ? $_POST['sequence_limit_sr'] :  $biller->sequence_limit_sr),  'class="form-control" id="sequence_limit_sr"'); ?>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend align="middle"><b><?= lang("governmental", "governmental"); ?></b></legend>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <?= lang("prefix", "prefix"); ?>
                                <?php echo form_input('prefix_gov',  (isset($_POST['prefix_gov']) ? $_POST['prefix_gov'] :  $biller->prefix_gov), 'class="form-control" id="prefix_gov"'); ?>
                            </div>
                            <div class="form-group">
                                <?= lang("authorization_number", "authorization_number"); ?>
                                <?php echo form_input('authorization_number_gov', (isset($_POST['authorization_number_gov']) ? $_POST['authorization_number_gov'] :  $biller->authorization_number_gov), 'class="form-control" id="authorization_number_gov"'); ?>
                            </div>
                            <div class="form-group">
                                <?= lang("expire_date", "expire_date"); ?>
                                <?php echo form_input('expire_date_gov', (isset($_POST['expire_date_gov']) ? $_POST['expire_date_gov'] :  $this->sma->hrsd($biller->expire_date_gov)), 'class="form-control date" id="expire_date_gov"'); ?>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <?= lang("sequence", "sequence"); ?>
                                <?php echo form_input(array('name'=>'sequence_gov','type'=>'number'), (isset($_POST['sequence_gov']) ? $_POST['sequence_gov'] :  $biller->sequence_gov), 'class="form-control" id="sequence_gov"'); ?>
                            </div>
                            <div class="form-group">
                                <?= lang("sequence_limit", "sequence_limit"); ?>
                                <?php echo form_input(array('name'=>'sequence_limit_gov','type'=>'number'), (isset($_POST['sequence_limit_gov']) ? $_POST['sequence_limit_gov'] :  $biller->sequence_limit_gov), 'class="form-control" id="sequence_limit_gov"'); ?>
                            </div>
                        </div>
                    </div>
                </fieldset>
        </div>
        <div class="modal-footer">
            <?php echo form_submit('edit_biller', lang('edit_biller'), 'class="btn btn-primary"'); ?>
        </div>
    </div>
    <?php echo form_close(); ?>
</div>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#biller_logo').change(function (event) {
            var biller_logo = $(this).val();
            $('#logo-con').html('<img src="<?=base_url('assets/uploads/logos')?>/' + biller_logo + '" alt="">');
        });
    });
</script>
<?= $modal_js ?>

