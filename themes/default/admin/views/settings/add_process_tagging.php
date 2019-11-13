<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
    <style>
        .modal-dialog{
            width: 650px;
        }
    </style>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel"><?php echo lang('Add_Tagging'); ?></h4>
            </div>
            <?php $attrib = array('data-toggle' => 'validator', 'role' => 'form');
            echo admin_form_open("system_settings/add_process_tagging", $attrib); ?>
            <div class="modal-body">
                <p><?= lang('enter_info'); ?></p>
                <div class="form-group">
                    <?= lang("Order_Types", "Order_Types")."<b> *</b>"; ?>
                    <?php
                    $cat1[''] = lang('select') . ' ' . lang('Order_Types');
                    foreach ($types as $type) {
                        $cat1[$type->id] = $type->name;
                    }
                    echo form_dropdown('type_id', $cat1, (isset($_POST['type_id']) ? $_POST['type_id'] : ''), 'class="form-control select"  required="required" id="type_id" style="width:100%"')
                    ?>
                </div>


                <div class="form-group">
                    <?= lang("Process", "Process")."<b> *</b>"; ?>
                    <?php
                    $cat2[''] = lang('select') . ' ' . lang('Process');
                    foreach ($process as $pro) {
                        $cat2[$pro->id] = $pro->name;
                    }
                    echo form_dropdown('process_id', $cat2, (isset($_POST['process_id']) ? $_POST['process_id'] : ''), 'class="form-control select"  required="required" id="process_id" style="width:100%"')
                    ?>
                </div>

            </div>
            <div class="modal-footer">
                <?php echo form_submit('add_process_tagging', lang('Add_Tagging'), 'class="btn btn-primary"'); ?>
            </div>
        </div>
        <?php echo form_close(); ?>
    </div>
    <script type="text/javascript" src="<?= $assets ?>js/custom.js"></script>
<?= $modal_js ?>