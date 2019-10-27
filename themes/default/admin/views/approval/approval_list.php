<style>
    .sales_approval {
        cursor: pointer;
    }

</style>
<script>
    $(document).ready(function () {
        var oTable;
        'use strict';
        oTable = $('#UsrTable').dataTable({
            "aaSorting": [[2, "asc"], [3, "asc"]],
            "aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "<?= lang('all') ?>"]],
            "iDisplayLength": <?= $Settings->rows_per_page ?>,
            'bProcessing': true, 'bServerSide': true,
            'sAjaxSource': '<?= admin_url('approval/getApproval') ?>',
            'fnServerData': function (sSource, aoData, fnCallback) {
                aoData.push({
                    "name": "<?= $this->security->get_csrf_token_name() ?>",
                    "value": "<?= $this->security->get_csrf_hash() ?>"
                });
                $.ajax({'dataType': 'json', 'type': 'POST', 'url': sSource, 'data': aoData, 'success': fnCallback});
            }, 'fnRowCallback': function (nRow, aData, iDisplayIndex) {
                var oSettings = oTable.fnSettings();
                nRow.id = aData[0];
                // console.log(aData);
                // if (aData[1] === 'manpower_requisition') nRow.className = "manpower_requisition_approval";
                // else if (aData[1] === 'recruitment_approval') nRow.className = "recruitment_approval";
                nRow.className = 'sales_approval';
                return nRow;
            },
            "aoColumns": [{
                "bSortable": false,
                "mRender": checkbox
            }, {
                "bSortable": false,
                "mRender": approval_name
            }, null, null, null, null, null, null, null]
            // }, null, null,null,null,null]
        }).fnSetFilteringDelay().dtFilter([
            {column_number: 1, filter_default_label: "[<?=lang('Customer');?>]", filter_type: "text", data: []},
            {column_number: 2, filter_default_label: "[<?=lang('Sales_Ref');?>]", filter_type: "text", data: []},
            {column_number: 3, filter_default_label: "[<?=lang('Sales_Amount');?>]", filter_type: "text", data: []},
            {
                column_number: 4,
                filter_default_label: "[<?=lang('Order_Approve_Status');?>]",
                filter_type: "text",
                data: []
            },
            {column_number: 5, filter_default_label: "[<?=lang('Order_type');?>]", filter_type: "text", data: []},
            {column_number: 6, filter_default_label: "[<?=lang('Status');?>]", filter_type: "text", data: []},
            {column_number: 7, filter_default_label: "[<?=lang('Created_Date');?>]", filter_type: "text", data: []},
        ], "footer");
    });

    function approval_name(x) {
        // var y = x.split("_");
        // var status = y[0].toUpperCase() + ' ' + y[1].toUpperCase();
        // return status;
        return x;

    }
</script>
<?php echo form_open('approval/approval_actions', 'id="action-form"'); ?>
<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-user"></i><?= lang('Waiting_For_Order_Status_Approval'); ?></h2>

        <div class="box-icon">
            <ul class="btn-tasks">
<!--                <li class="dropdown">-->
<!--                    <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon fa fa-tasks tip"-->
<!--                                                                                  data-placement="left"-->
<!--                                                                                  title="--><?//= lang("actions") ?><!--"></i></a>-->
<!--                    <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">-->
<!--                        <li><a href="#" id="chuk_approval" data-action="chuk_approval"><i-->
<!--                                        class="fa fa-hand-o-right"></i> --><?//= lang('Bulk_Approval') ?><!--</a></li>-->
<!--                    </ul>-->
<!--                </li>-->
            </ul>
        </div>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">
                <p class="introtext"><?= lang('list_results'); ?></p>

                <div class="table-responsive">
                    <table id="UsrTable" cellpadding="0" cellspacing="0" border="0"
                           class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th style="min-width:30px; width: 30px; text-align: center;">
                                <input class="checkbox checkth" type="checkbox" name="check"/>
                            </th>
                            <th><?php echo lang('Customer'); ?></th>
                            <th><?php echo lang('Sales_Ref'); ?></th>
                            <th><?php echo lang('Sales_Amount'); ?></th>
                            <th style="width:15%"><?php echo lang('Order_Approve_Status'); ?></th>
                            <th style="width:15%"><?php echo lang('Order_type'); ?></th>
                            <th><?php echo lang('Status'); ?></th>
                            <th><?php echo lang('Created_Date'); ?></th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="6" class="dataTables_empty"><?= lang('loading_data_from_server') ?></td>
                        </tr>
                        </tbody>
                        <tfoot class="dtFilter">
                        <tr class="active">
                            <th style="min-width:30px; width: 30px; text-align: center;">
                                <input class="checkbox checkft" type="checkbox" name="check"/>
                            </th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th style="width:85px;"><?= lang("actions"); ?></th>
                        </tr>
                        </tfoot>
                    </table>
                </div>

            </div>

        </div>
    </div>
</div>
<div style="display: none;">
    <input type="hidden" name="form_action" value="" id="form_action"/>
    <?= form_submit('performAction', 'performAction', 'id="action-form-submit"') ?>
</div>
<?= form_close() ?>
<script language="javascript">
    $(document).ready(function () {

        $('#chuk_approval').click(function (e) {
            e.preventDefault();
            $('#form_action').val($(this).attr('data-action'));
            $('#action-form-submit').trigger('click');
        });

    });
</script>