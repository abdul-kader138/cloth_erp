<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<script>
    $(document).ready(function () {
        oTable = $('#SLData').dataTable({
            "aaSorting": [[1, "desc"], [2, "desc"]],
            "aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "<?=lang('all')?>"]],
            "iDisplayLength": <?=$Settings->rows_per_page?>,
            'bProcessing': true, 'bServerSide': true,
            'sAjaxSource': '<?=admin_url('accounting/getDues' . ($warehouse_id ? '/' . $warehouse_id : '') . '?v=1' . ($this->input->get('shop') ? '&shop=' . $this->input->get('shop') : '') . ($this->input->get('attachment') ? '&attachment=' . $this->input->get('attachment') : '') . ($this->input->get('delivery') ? '&delivery=' . $this->input->get('delivery') : '')); ?>',
            'fnServerData': function (sSource, aoData, fnCallback) {
                aoData.push({
                    "name": "<?=$this->security->get_csrf_token_name()?>",
                    "value": "<?=$this->security->get_csrf_hash()?>"
                });
                $.ajax({'dataType': 'json', 'type': 'POST', 'url': sSource, 'data': aoData, 'success': fnCallback});
            },
            'fnRowCallback': function (nRow, aData, iDisplayIndex) {
                var oSettings = oTable.fnSettings();
                //$("td:first", nRow).html(oSettings._iDisplayStart+iDisplayIndex +1);
                nRow.id = aData[0];
                nRow.setAttribute('data-return-id', aData[11]);
                nRow.className = "invoice_link re" + aData[11];
                //if(aData[7] > aData[9]){ nRow.className = "product_link warning"; } else { nRow.className = "product_link"; }
                return nRow;
            },
            "aoColumns": [{
                "bSortable": false,
                "mRender": checkbox
            }, {"mRender": credit_days}, null, {"mRender": term_prefix}, {"mRender": tax_status}, null, null, {
                "bSearchable": false,
                "mRender": pqFormat
            }, {"mRender": currencyFormat}, {"mRender": currencyFormat}, {"mRender": currencyFormat}, {"mRender": credit_pay_status}],
            "fnFooterCallback": function (nRow, aaData, iStart, iEnd, aiDisplay) {
                var gtotal = 0, paid = 0, balance = 0;
                for (var i = 0; i < aaData.length; i++) {
                    gtotal += parseFloat(aaData[aiDisplay[i]][8]);
                    paid += parseFloat(aaData[aiDisplay[i]][9]);
                    balance += parseFloat(aaData[aiDisplay[i]][10]);
                }
                var nCells = nRow.getElementsByTagName('th');
                nCells[8].innerHTML = currencyFormat(parseFloat(gtotal));
                nCells[9].innerHTML = currencyFormat(parseFloat(paid));
                nCells[10].innerHTML = currencyFormat(parseFloat(balance));
            }
        }).fnSetFilteringDelay().dtFilter([
            {
                column_number: 1,
                filter_default_label: "[<?=lang('date');?> (yyyy-mm-dd)]",
                filter_type: "text",
                data: []
            },
            {
                column_number: 2,
                filter_default_label: "[<?=lang('reference_no');?>]",
                filter_type: "text",
                data: []
            },
            {column_number: 3, filter_default_label: "[<?=lang('fiscal_proof');?>]", filter_type: "text", data: []},
            {column_number: 4, filter_default_label: "[<?=lang('biller_type');?>]", filter_type: "text", data: []},
            {column_number: 5, filter_default_label: "[<?=lang('biller');?>]", filter_type: "text", data: []},
            {column_number: 6, filter_default_label: "[<?=lang('customer');?>]", filter_type: "text", data: []},
            {column_number: 7, filter_default_label: "[<?=lang('product_qty');?>]", filter_type: "text", data: []},
            {column_number: 11, filter_default_label: "[<?=lang('payment_status');?>]", filter_type: "text", data: []},
        ], "footer");


        function tax_status(x) {
            if (x == 'None') {
                return '';
            } else if (x == 'PROOF') {
                return '<div class="text-center"><span class="row_status label label-default"><?=lang('proof')?></span></div>';
            }
            else if (x == 'FINAL CONSUMER') {
                return '<div class="text-center"><span class="row_status label label-default"><?=lang('final_consumer')?></span></div>';
            }
            else if (x == 'CREDIT FISCAL') {
                return '<div class="text-center"><span class="row_status label label-default"><?=lang('credit_fiscal')?></span></div>';
            }
            else if (x == 'CREDIT NOTE') {
                return '<div class="text-center"><span class="row_status label label-default"><?=lang('credit_note')?></span></div>';
            }
            else if (x == 'SPECIAL REGIME') {
                return '<div class="text-center"><span class="row_status label label-default"><?=lang('special_regime')?></span></div>';
            }
            else if (x == 'GOVERNMENTAL') {
                return '<div class="text-center"><span class="row_status label label-default"><?=lang('governmental')?></span></div>';
            }
        }

        function credit_pay_status(x) {
            var vals=x;
            if(x == null) {
                return '';
            } else if(vals >= 0) {
                return '<div class="text-center"><span class="payment_status label label-warning">'+lang['due']+'</span></div>';
            }  else if(vals <= 0) {
                return '<div class="text-center"><span class="payment_status label label-danger">'+lang['due']+'</span></div>';
            }
        }

        function credit_days(x) {
            if(x == null) {
                return '';
            } else if(x >= 0) {
                return '<div class="text-center"><span class="payment_status label label-default">'+x+'</span></div>';
            }  else if(x <= 0) {
                return '<div class="text-center"><span class="payment_status label label-default">'+x+'</span></div>';
            }
        }

        function term_prefix(x) {
            if (x == '-00000000') {
                return '';
            } else {
                return x;
            }
        }
    });

</script>

<div class="box">
    <div class="box-header">
        <h2 class="blue"><i
                    class="fa-fw fa fa-heart"></i><?= lang('report_due') . ' (' . ($warehouse_id ? $warehouse->name : lang('all_warehouses')) . ')'; ?>
        </h2>

        <div class="box-icon">
            <ul class="btn-tasks">
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="icon fa fa-tasks tip" data-placement="left" title="<?= lang("actions") ?>"></i>
                    </a>
                    <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
                        <li>
                            <a href="#" id="excel" data-action="export_excel">
                                <i class="fa fa-file-excel-o"></i> <?= lang('export_to_excel') ?>
                            </a>
                        </li>
                    </ul>
                </li>
                <?php if (!empty($warehouses)) {
                    ?>
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon fa fa-building-o tip"
                                                                                      data-placement="left"
                                                                                      title="<?= lang("warehouses") ?>"></i></a>
                        <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
                            <li><a href="<?= admin_url('accounting/report_607') ?>"><i
                                            class="fa fa-building-o"></i> <?= lang('all_warehouses') ?></a></li>
                            <li class="divider"></li>
                            <?php
                            foreach ($warehouses as $warehouse) {
                                echo '<li><a href="' . admin_url('accounting/report_due/' . $warehouse->id) . '"><i class="fa fa-building"></i>' . $warehouse->name . '</a></li>';
                            }
                            ?>
                        </ul>
                    </li>
                <?php }
                ?>
            </ul>
        </div>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">

                <p class="introtext"><?= lang('list_results'); ?></p>

                <div class="table-responsive">
                    <table id="SLData" class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th style="min-width:30px; width: 30px; text-align: center;">
                                <input class="checkbox checkft" type="checkbox" name="check"/>
                            </th>
                            <th><?= lang("credit_enjoyed_days"); ?></th>
                            <th><?= lang("reference_no"); ?></th>
                            <th><?= lang("fiscal_proof"); ?></th>
                            <th><?= lang("biller_type"); ?></th>
                            <th><?= lang("biller"); ?></th>
                            <th><?= lang("customer"); ?></th>
                            <th><?= lang("product_qty"); ?></th>
                            <th><?= lang("grand_total"); ?></th>
                            <th><?= lang("paid_amount"); ?></th>
                            <th><?= lang("balance"); ?></th>
                            <th><?= lang("payment_status"); ?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="11" class="dataTables_empty"><?= lang("loading_data"); ?></td>
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
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
