<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<?php
$v = "";

if ($this->input->post('product')) {
    $v .= "&product=" . $this->input->post('product');
}
if ($this->input->post('category')) {
    $v .= "&category=" . $this->input->post('category');
}
if ($this->input->post('brand')) {
    $v .= "&brand=" . $this->input->post('brand');
}
if ($this->input->post('subcategory')) {
    $v .= "&subcategory=" . $this->input->post('subcategory');
}
if ($this->input->post('warehouse')) {
    $v .= "&warehouse=" . $this->input->post('warehouse');
}
?>
<script>
    $(document).ready(function () {
        function spb(x) {
//            v = x.split('__');
//            return '('+formatQuantity2(v[0])+') <strong>'+formatMoney(v[1])+'</strong>';
        }
        oTable = $('#PrRData').dataTable({
            "aaSorting": [[10, 'desc'],[0, "desc"]],
            "aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "<?= lang('all') ?>"]],
            "iDisplayLength": <?= $Settings->rows_per_page ?>,
            'bProcessing': true, 'bServerSide': true,
            'sAjaxSource': '<?= admin_url('products/getProductDetailsReport/?v=1'.$v) ?>',
            'fnServerData': function (sSource, aoData, fnCallback) {
                aoData.push({
                    "name": "<?= $this->security->get_csrf_token_name() ?>",
                    "value": "<?= $this->security->get_csrf_hash() ?>"
                });
                $.ajax({'dataType': 'json', 'type': 'POST', 'url': sSource, 'data': aoData, 'success': fnCallback});
            },
            'fnRowCallback': function (nRow, aData, iDisplayIndex) {
            },
            "aoColumns": [null, null, null, null,null,{"mRender": currencyFormat},{"mRender": currencyFormat},{"mRender": getNumber},{"mRender": getNumber}],
            "fnFooterCallback": function (nRow, aaData, iStart, iEnd, aiDisplay) {
            }
        }).fnSetFilteringDelay().dtFilter([
        ], "footer");
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#form').hide();
        $('.toggle_down').click(function () {
            $("#form").slideDown();
            return false;
        });
        $('.toggle_up').click(function () {
            $("#form").slideUp();
            return false;
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        // $('#category').select2({allowClear: true, placeholder: "<?= lang('select'); ?>", minimumResultsForSearch: 7}).select2('destroy');
        $("#subcategory").select2("destroy").empty().attr("placeholder", "<?= lang('select_category_to_load') ?>").select2({
            allowClear: true,
            placeholder: "<?= lang('select_category_to_load') ?>", data: [
                {id: '', text: '<?= lang('select_category_to_load') ?>'}
            ]
        });
        $('#category').change(function () {
            var v = $(this).val();
            if (v) {
                $.ajax({
                    type: "get",
                    async: false,
                    url: "<?= admin_url('products/getSubCategories') ?>/" + v,
                    dataType: "json",
                    success: function (scdata) {
                        if (scdata != null) {
                            $("#subcategory").select2("destroy").empty().attr("placeholder", "<?= lang('select_subcategory') ?>").select2({allowClear: true,
                                placeholder: "<?= lang('select_category_to_load') ?>",
                                data: scdata
                            });
                        } else {
                            $("#subcategory").select2("destroy").empty().attr("placeholder", "<?= lang('no_subcategory') ?>").select2({allowClear: true,
                                placeholder: "<?= lang('no_subcategory') ?>",
                                data: [{id: '', text: '<?= lang('no_subcategory') ?>'}]
                            });
                        }
                    },
                    error: function () {
                        bootbox.alert('<?= lang('ajax_error') ?>');
                    }
                });
            } else {
                $("#subcategory").select2("destroy").empty().attr("placeholder", "<?= lang('select_category_to_load') ?>").select2({allowClear: true,
                    placeholder: "<?= lang('select_category_to_load') ?>",
                    data: [{id: '', text: '<?= lang('select_category_to_load') ?>'}]
                });
            }
        });
        <?php if (isset($_POST['category']) && !empty($_POST['category'])) { ?>
        $.ajax({
            type: "get", async: false,
            url: "<?= admin_url('products/getSubCategories') ?>/" + <?= $_POST['category'] ?>,
            dataType: "json",
            success: function (scdata) {
                if (scdata != null) {
                    $("#subcategory").select2("destroy").empty().attr("placeholder", "<?= lang('select_subcategory') ?>").select2({allowClear: true,
                        placeholder: "<?= lang('no_subcategory') ?>",
                        data: scdata
                    });
                }
            }
        });
        <?php } ?>
    });
</script>

<div class="box">
<div class="box-header">
    <h2 class="blue"><i class="fa-fw fa fa-barcode"></i><?= lang('product_details_search'); ?> <?php
        ?></h2>

    <div class="box-icon">
        <ul class="btn-tasks">
            <li class="dropdown">
                <a href="#" class="toggle_up tip" title="<?= lang('hide_form') ?>">
                    <i class="icon fa fa-toggle-up"></i>
                </a>
            </li>
            <li class="dropdown">
                <a href="#" class="toggle_down tip" title="<?= lang('show_form') ?>">
                    <i class="icon fa fa-toggle-down"></i>
                </a>
            </li>
        </ul>
    </div>
    <div class="box-icon">
        <ul class="btn-tasks">
            <li class="dropdown">
                <a href="#" id="pdf" class="tip" title="<?= lang('download_pdf') ?>">
                    <i class="icon fa fa-file-pdf-o"></i>
                </a>
            </li>
            <li class="dropdown">
                <a href="#" id="xls" class="tip" title="<?= lang('download_xls') ?>">
                    <i class="icon fa fa-file-excel-o"></i>
                </a>
            </li>
            <li class="dropdown">
                <a href="#" id="image" class="tip" title="<?= lang('save_image') ?>">
                    <i class="icon fa fa-file-picture-o"></i>
                </a>
            </li>
        </ul>
    </div>
</div>
<div class="box-content">
    <div class="row">
        <div class="col-lg-12">

            <p class="introtext"><?= lang('customize_report'); ?></p>

            <div id="form">

                <?php echo admin_form_open("products/details_search"); ?>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <?= lang("product", "suggest_product"); ?>
                            <?php echo form_input('sproduct', (isset($_POST['sproduct']) ? $_POST['sproduct'] : ""), 'class="form-control" id="suggest_product"'); ?>
                            <input type="hidden" name="product" value="<?= isset($_POST['product']) ? $_POST['product'] : "" ?>" id="report_product_id"/>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <?= lang("category", "category") ?>
                            <?php
                            $cat[''] = lang('select').' '.lang('category');
                            foreach ($categories as $category) {
                                $cat[$category->id] = $category->name;
                            }
                            echo form_dropdown('category', $cat, (isset($_POST['category']) ? $_POST['category'] : ''), 'class="form-control select" id="category" placeholder="' . lang("select") . " " . lang("category") . '" style="width:100%"')
                            ?>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <?= lang("subcategory", "subcategory") ?>
                            <div class="controls" id="subcat_data"> <?php
                                echo form_input('subcategory', (isset($_POST['subcategory']) ? $_POST['subcategory'] : ''), 'class="form-control" id="subcategory"  placeholder="' . lang("select_category_to_load") . '"');
                                ?>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="form-group">
                            <?= lang("brand", "brand") ?>
                            <?php
                            $bt[''] = lang('select').' '.lang('brand');
                            foreach ($brands as $brand) {
                                $bt[$brand->id] = $brand->name;
                            }
                            echo form_dropdown('brand', $bt, (isset($_POST['brand']) ? $_POST['brand'] : ''), 'class="form-control select" id="brand" placeholder="' . lang("select") . " " . lang("brand") . '" style="width:100%"')
                            ?>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label" for="warehouse"><?= lang("warehouse"); ?></label>
                            <?php
                            $wh[""] = lang('select').' '.lang('warehouse');
                            foreach ($warehouses as $warehouse) {
                                $wh[$warehouse->id] = $warehouse->name;
                            }
                            echo form_dropdown('warehouse', $wh, (isset($_POST['warehouse']) ? $_POST['warehouse'] : ""), 'class="form-control" id="warehouse" data-placeholder="' . $this->lang->line("select") . " " . $this->lang->line("warehouse") . '"');
                            ?>
                        </div>
                    </div>

                </div>
                <div class="form-group">
                    <div
                        class="controls"> <?php echo form_submit('submit_report', $this->lang->line("submit"), 'class="btn btn-primary"'); ?> </div>
                </div>
                <?php echo form_close(); ?>

            </div>

            <div class="clearfix"></div>

            <div class="table-responsive">
                <table id="PrRData"
                       class="table table-striped table-bordered table-condensed table-hover dfTable reports-table"
                       style="margin-bottom:5px;">
                    <thead>
                    <tr class="active">
                        <th><?= lang("product_code"); ?></th>
                        <th><?= lang("product_name"); ?></th>
                        <th><?= lang("brand") ?></th>
                        <th><?= lang("category") ?></th>
                        <th><?= lang("um") ?></th>
                        <th><?= lang("cost"); ?></th>
                        <th><?= lang("price"); ?></th>
                        <th><?= lang("quantity") ?></th>
                        <th><?= lang("alert_quantity") ?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td colspan="9" class="dataTables_empty"><?= lang('loading_data_from_server') ?></td>
                    </tr>
                    </tbody>
                    <tfoot class="dtFilter">
                    <tr class="active">
                        <th><?= lang("product_code"); ?></th>
                        <th><?= lang("product_name"); ?></th>
                        <th><?= lang("brand") ?></th>
                        <th><?= lang("category") ?></th>
                        <th><?= lang("um") ?></th>
                        <th><?= lang("cost"); ?></th>
                        <th><?= lang("price"); ?></th>
                        <th><?= lang("quantity") ?></th>
                        <th><?= lang("alert_quantity") ?></th>
                    </tr>
                    </tfoot>
                </table>
            </div>

        </div>
    </div>
</div>
</div>

<script type="text/javascript" src="<?= $assets ?>js/html2canvas.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#pdf').click(function (event) {
            event.preventDefault();
            window.location.href = "<?=admin_url('products/getProductDetailsReport/pdf/?v=1'.$v)?>";
            return false;
        });
        $('#xls').click(function (event) {
            event.preventDefault();
            window.location.href = "<?=admin_url('products/getProductDetailsReport/0/xls/?v=1'.$v)?>";
            return false;
        });
        $('#image').click(function (event) {
            event.preventDefault();
            html2canvas($('.box'), {
                onrendered: function (canvas) {
                    var img = canvas.toDataURL();
                    window.open(img);
                }
            });
            return false;
        });
    });
</script>
