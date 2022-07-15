<html dir="ltr" lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Tell the browser to be responsive to screen width -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- Favicon icon -->
	<link rel="icon" type="image/png" sizes="16x16" href="<?=
															base_url('assets/xtreme_admin_lite/assets/images/favicon.png') ?>">
	<title>Login</title>
	<!-- Custom CSS -->
	<link href="<?= base_url('assets/xtreme_admin_lite/css/style.min.css') ?>" rel="stylesheet">
	<script src="<?= base_url('assets/xtreme_admin_lite/assets/libs/jquery/dist/jquery.min.js') ?>"></script>
</head>

<body>
	<div class="row" style="display:flex;justify-content:center;margin: 0;position: absolute;top: 30%;-ms-transform: translateY(-30%);transform: translateY(-30%);width:100%">
		<div class="col-lg-6">
			<div class="card" style="border:1px solid #ddd; border-radius:20px">
				<div class="card-header" style="background: none">
					<div class="card-title text-center">
						<h4>Login To Your Account</h4>
					</div>
				</div>
				<div class="card-body">
					<form class="form-horizontal form-material" id="formLogin">
						<div class="form-group">
							<label for="example-email" class="col-md-12">Email</label>
							<div class="col-md-12">
								<input type="email" placeholder="johnathan@admin.com" class="form-control form-control-line form-user-input" name="email" id="example-email">
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-12">Password</label>
							<div class="col-md-12">
								<input type="password" value="" name="password" class="form-control form-control-line form-user-input">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-12">
								<button class="btn btn-success">LOGIN</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$("#formLogin").on('submit', function(e) {
			e.preventDefault();
			checkLogin();
		});

		function checkLogin() {
			var link = "http://localhost/backend_inventory/user/check_login/";
			var dataForm = {};
			var allInput = $('.form-user-input');
			$.each(allInput, function(i, val) {
				dataForm[val['name']] = val['value'];
			});
			console.log(dataForm);
			$.ajax(link, {
				type: 'POST',
				data: dataForm,
				success: function(data, status, xhr) {
					var data_str = JSON.parse(data);
					alert(data_str['pesan']);
					if (data_str['sukses'] == 'Ya') {
						setSession(data_str['user']);
					}
				},
				error: function(jqXHR, textStatus, errorMsg) {
					alert('Error : ' + errorMsg);
				}
			});
		}

		function setSession(user) {
			var link = "http://localhost/client_inventory/login/setSession";
			var dataForm = {};
			dataForm['id_user'] = user['id_admin'];
			dataForm['email'] = user['email'];
			dataForm['level'] = user['level'];
			dataForm['nama'] = user['nama'];
			$.ajax(link, {
				type: 'POST',
				data: dataForm,
				success: function(data, status, xhr) {
					location.replace('http://localhost/client_inventory/home');
				},
				error: function(jqXHR, textStatus, errorMsg) {
					alert('Error : ' + errorMsg);
				}
			});
		}
	</script>

	<script src="<?= base_url('assets/xtreme_admin_lite/') ?>assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="<?= base_url('assets/xtreme_admin_lite/assets/libs/popper.js/dist/umd/popper.min.js') ?>"></script>
	<script src="<?= base_url('assets/xtreme_admin_lite/assets/libs/bootstrap/dist/js/bootstrap.min.js') ?>"></script>
	<script src="<?= base_url('assets/xtreme_admin_lite/dist/js/app-style-switcher.js') ?>"></script>
	<!--Wave Effects -->
	<script src="<?= base_url('assets/xtreme_admin_lite/dist/js/waves.js') ?>"></script>
	<!--Menu sidebar -->
	<script src="<?= base_url('assets/xtreme_admin_lite/dist/js/sidebarmenu.js') ?>"></script>
	<!--Custom JavaScript -->
	<script src="<?= base_url('assets/xtreme_admin_lite/dist/js/custom.js') ?>"></script>
</body>

</html>
