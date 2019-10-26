<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<script>
    $(document).ready(function () {
        $('#CategoryTable').dataTable({
            "aaSorting": [[3, "asc"]],
            "aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "<?= lang('all') ?>"]],
            "iDisplayLength": <?= $Settings->rows_per_page ?>,
            'bProcessing': true, 'bServerSide': true,
            'sAjaxSource': '<?= admin_url('system_settings/getOrderStatusHierarchy') ?>',
            'fnServerData': function (sSource, aoData, fnCallback) {
                aoData.push({
                    "name": "<?= $this->security->get_csrf_token_name() ?>",
                    "value": "<?= $this->security->get_csrf_hash() ?>"
                });
                $.ajax({'dataType': 'json', 'type': 'POST', 'url': sSource, 'data': aoData, 'success': fnCallback});
            },
            "aoColumns": [{"bSortable": false, "mRender": checkbox}, null,null, null,null,null,{"bSortable": false}]
        }).fnSetFilteringDelay().dtFilter([
            {column_number: 1, filter_default_label: "[<?=lang('Order_Type');?>]", filter_type: "text", data: []},
            {column_number: 2, filter_default_label: "[<?=lang('Approver_name');?>]", filter_type: "text", data: []},
            {column_number: 4, filter_default_label: "[<?=lang('Hierarchy_Type');?>]", filter_type: "text", data: []},
        ], "footer");
    });

</script>
<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa fa-user"></i><?= lang('Order_Status_Hierarchy'); ?></h2>

        <div class="box-icon">
            <ul class="btn-tasks">
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="icon fa fa-tasks tip" data-placement="left" title="<?= lang("actions") ?>"></i>
                    </a>
                    <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
                        <li>
                            <a href="<?php echo admin_url('system_settings/add_order_status_hierarchy'); ?>" data-toggle="modal" data-target="#myModal">
                                <i class="fa fa-plus"></i> <?= lang('Add_Hierarchy') ?>
                            </a>
                        </li>
                        <li class="divider"></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">
                <p class="introtext"><?= lang('list_results'); ?></p>
                <div class="table-responsive">
                    <table id="CategoryTable" class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th style="min-width:30px; width: 30px; text-align: center;">
                                <input class="checkbox checkth" type="checkbox" name="check"/>
                            </th>
                            <th  class="col-sm-3">
                                <?= lang("Order_Type"); ?>
                            </th>
                            <th  class="col-sm-3"><?= lang("Approver_Name"); ?></th>
                            <th  class="col-sm-1"><?= lang("Hierarchy_SL"); ?></th>
                            <th  class="col-sm-2"><?= lang("Hierarchy_Type"); ?></th>
                            <th  class="col-sm-1"><?= lang("Next_Hierarchy_SL"); ?></th>
                            <th  class="col-sm-1"><?= lang("actions"); ?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="7" class="dataTables_empty">
                                <?= lang('loading_data_from_server') ?>
                            </td>
                        </tr>
                        </tbody>
                        <tfoot class="dtFilter">
                        <tr class="active">
                            <th></th>
                            <th></th>
                            <th></th>
                            <th ></th>
                            <th ></th>
                            <th ></th>
                            <th style="width:85px;"><?= lang("actions"); ?></th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

