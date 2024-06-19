<?php foreach ($products as $product) { ?>
<div class="col">
    <div class="card shadow-sm">
        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
        <div class="card-body">
            <h3><?=$product['name']?></h3>
            <p class="card-text"><?php echo number_format($product['price'] / 100, 2, '.', ''); ?></p>
            <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                    <button type="button" class="btn btn-sm btn-outline-secondary btn_cart" data-id="<?=$product['product_id']?>">Add to cart</button>
                </div>
            </div>
        </div>
    </div>
</div>
<?php } ?>