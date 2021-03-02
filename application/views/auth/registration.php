<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5 col-lg-6 mx-auto">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Buat Akun</h1>
                        </div>
                        <form class="user" method="post" action="<?php echo base_url() . 'auth/registration' ?>">
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="name" name="name" placeholder="Nama Lengkap" value="<?= set_value('id_user') ?>">
                                <?= form_error('name', '<small class="text-danger pl-3">', '</small>'); ?>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" id="email" name="email" placeholder="Alamat Email" value=" <?= set_value('email') ?>">
                                <?= form_error('email', '<small class="text-danger pl-3">', '</small>'); ?>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control form-control-user" id="password1" name="password1" placeholder="Kata Sandi" value="<?= set_value('password1') ?>">
                                <?= form_error('password1', '<small class="text-danger pl-3">', '</small>'); ?>

                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control form-control-user" id="password2" name="password2" placeholder="Ulangi Kata Sandi">
                            </div>
                            <button type="submit" class="btn btn-info btn-user btn-block">Registrasi Akun</button>
                            <!-- <a href="login.html" class="btn btn-primary btn-user btn-block">
                                Register Account
                            </a> -->
                        </form>
                        <hr>
                        <div class="text-center">
                            <a class="small" href="forgot-password.html">Lupa Kata Sandi?</a>
                        </div>
                        <div class="text-center">
                            <a class="small" href="<?php echo base_url() ?>">Sudah Punya Akun? Silahkan Masuk!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>