<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i>
                </button>
                <h4 class="modal-title" id="myModalLabel"><?php echo lang('Edit_Order_Status_Hierarchy'); ?></h4>
            </div>
            <?php $attrib = array('data-toggle' => 'validator', 'role' => 'form');
            echo admin_form_open("system_settings/edit_order_status_hierarchy/".$id, $attrib); ?>
            <div class="modal-body">
                <p><?= lang('update_info'); ?></p>

                <div class="form-group">
                    <?= lang("Order_type", "Order_type")."<b> *</b>"; ?>
                    <?php
                    $cat2[''] = lang('select') . ' ' . lang('category');
                    foreach ($types as $pcat) {
                        $cat2[$pcat->id] = $pcat->name;
                    }
                    echo form_dropdown('category_id', $cat2, $aprrover->category_id, 'class="form-control select"  required="required" id="category_id" style="width:100%"')
                    ?>
                </div>

                <div class="form-group">
                    <?= lang("Approver_Name", "Approver_Name")."<b> *</b>"; ?>
                    <?php
                    $cat[''] = lang('select') . ' ' . lang('Approver_Name');
                    foreach ($users as $user) {
                        $cat[$user->id] = $user->first_name." ".$user->last_name." (".$user->username.")";
                    }
                    echo form_dropdown('approver_id', $cat, $aprrover->approver_id, 'class="form-control select" required="required" id="approver_id" style="width:100%"')
                    ?>
                </div>

                <div class="form-group">
                    <?= lang('Hierarchy_SL', 'Hierarchy_SL'); ?>
                    <?= form_input('approver_seq', set_value('approver_seq',$aprrover->approver_seq), 'class="form-control" id="approver_seq" required="required"'); ?>
                </div>

                <div class="form-group">
                    <?= lang('Hierarchy_Type', 'Hierarchy_Type'); ?>
                    <?= form_input('approver_seq_name', set_value('approver_seq_name',$aprrover->approver_seq_name), 'class="form-control" id="approver_seq_name" required="required"'); ?>
                </div>
                <div class="form-group">
                    <?= lang('status', 'status'); ?>
                    <?php
                    $opts = array('Active' => lang('Active'),'Inactive' => lang('Inactive'));
                    ?>
                    <?= form_dropdown('is_active', $opts, (isset($_POST['is_active']) ? $_POST['is_active'] : $aprrover->is_active), 'class="form-control" id="is_active" required="required" style="width:100%;"'); ?>
                </div>
            </div>
            <div class="modal-footer">
                <?php echo form_submit('edit_approver', lang('Edit_Hierarchy'), 'class="btn btn-primary"'); ?>
            </div>
        </div>
        <?php echo form_close(); ?>
    </div>
    <script type="text/javascript" src="<?= $assets ?>js/custom.js"></script>
<?= $modal_js ?>