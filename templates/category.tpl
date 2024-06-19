<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <title><?=$page_title?></title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/album/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="<?=$base_url?>assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            width: 100%;
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }

        .btn-bd-primary {
            --bd-violet-bg: #712cf9;
            --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

            --bs-btn-font-weight: 600;
            --bs-btn-color: var(--bs-white);
            --bs-btn-bg: var(--bd-violet-bg);
            --bs-btn-border-color: var(--bd-violet-bg);
            --bs-btn-hover-color: var(--bs-white);
            --bs-btn-hover-bg: #6528e0;
            --bs-btn-hover-border-color: #6528e0;
            --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
            --bs-btn-active-color: var(--bs-btn-hover-color);
            --bs-btn-active-bg: #5a23c8;
            --bs-btn-active-border-color: #5a23c8;
        }

        .bd-mode-toggle {
            z-index: 1500;
        }

        .bd-mode-toggle .dropdown-menu .active .bi {
            display: block !important;
        }

        main {
            display: grid;
            grid-template-rows: auto;
            grid-template-columns: 1fr 4fr;
            gap: 1rem;
        }

        select.form-select {
            display: inline;
            width: auto;
        }
    </style>
</head>
<body>

<div class="container">
    <header class="d-flex justify-content-center py-3 mb-4 border-bottom">
        <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
            <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
            <span class="fs-4">Choose your product</span>
        </a>
        <select class="form-select" id="sort_order">
            <?php foreach ($sort_list as $sort) { ?>
            <option value="<?=$sort['value']?>"<?php if ($sort['active']) { ?> selected="selected"<?php } ?>><?=$sort['title']?></option>
            <?php } ?>
        </select>
    </header>
</div>

<div class="container">
    <main>
        <aside>
            <div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary">
                <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
                    <span class="fs-4">Categories</span>
                </a>
                <hr>
                <ul class="nav nav-pills flex-column mb-auto">
                    <?php foreach ($categories as $category) { ?>
                    <li class="nav-item">
                        <a href="#" class="nav-link d-flex justify-content-between<?php if ($category['category_id'] == $active_category) { ?> active<?php } ?>" data-id="<?=$category['category_id']?>">
                            <?=$category['name']?>
                            <span class="badge text-bg-dark"><?=$category['total']?></span>
                        </a>
                    </li>
                    <?php } ?>
                </ul>
                <hr>
            </div>
        </aside>
        <div class="album py-5 bg-body-tertiary">
            <div class="container">
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="product_list">
                    <?php include('templates/product_list.tpl'); ?>
                </div>
            </div>
        </div>
    </main>
</div>
<?php include('templates/partials/footer.tpl'); ?>

<div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" class="productModalTitle"></h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h3 class="productModalTitle"></h3>
                <p class="productModalDescription"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="<?=$base_url?>assets/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        $('aside .nav-link').on('click', function(e) {
            e.preventDefault();
            e.stopPropagation();

            $('aside .nav-link.active').each(function() {
                $(this).removeClass('active');
            });

            $(this).addClass('active');

            if (history.pushState) {
                let current_url = new URL(window.location.href);
                let pathname = current_url.pathname.replace(/category(\/\d)?/, '');
                pathname = pathname.replace(/\/$/, '');
                current_url.pathname = pathname + '/category/' + $(this).data('id');
                history.pushState(null, null, current_url);
            } else {
                console.log('###Browser does not support History API.')
            }

            getProducts();
        });

        $('#sort_order').on('change', function() {
            const sort_order = $(this).val();

            if (history.pushState) {
                let current_url = new URL(window.location.href);
                let search = current_url.search.substring(1).split('&');
                let has_sort = false;

                for (let i in search) {
                    if (search[i].includes('sort')) {
                        search[i] = 'sort=' + sort_order;
                        has_sort = true;
                    }
                }

                if (!has_sort) {
                    search.push('sort=' + sort_order);
                }

                current_url.search = '?' + search.join('&');
                history.pushState(null, null, current_url);
            } else {
                console.log('###Browser does not support History API.')
            }

            getProducts()
        });

        function getProducts() {
            $('#product_list').html('');

            $.ajax({
                url: window.location.href,
                method: 'get',
                dataType: 'json',
                success: function(json) {
                    if (json.html)
                        $('#product_list').html(json.html);
                }
            });
        }

        $('body').on('click', '.btn_cart', function() {
            $.ajax({
                url: '<?=$base_url?>product/' + $(this).data('id'),
                'method': 'get',
                dataType: 'json',
                success: function(json) {
                    if (json.product) {
                        $('.productModalTitle').html(json.product.name);
                        $('.productModalDescription').html(json.product.formatted_price);
                        $('#productModal').modal('show');
                    }
                }
            });
        });
    });
</script>

</body>
</html>
