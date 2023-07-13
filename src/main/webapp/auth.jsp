<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <body>
    <section class="text-center m-5">
    <h1 class="text-center m-3">Bonjour !</h1>
    <div class="card  mx-auto shadow-5-strong" style="background: hsla(0, 0%, 100%, 0.8); backdrop-filter: blur(30px); max-width: 1000px;">
    <div class="card-body shadow shadow-lg">
          <div class="row justify-content-center">
            <div class="col-6" style="background-color:#3399FF; margin-left: -10px;margin-top: -20px;margin-bottom: -20px;">
            <div class="d-flex justify-content-center align-items-center" style="height:100%">
  				<button type="submit" class="btn btn-primary w-25 btn-block rounded-pill">signup</button>
				</div>
			</div>
            <div class="col-6">
              <h2 class="fw-bold mb-5">connexion</h2>
              <form method="POST" action="Login">
                <div class="form-outline mb-4">
                  <input type="text" id="form3Example3" name="username" class="form-control" placeholder="Username" style="background-color:#F0F0F0" required>
                </div>
                <div class="form-outline mb-4">
                  <input type="password" id="form3Example4" name="password" class="form-control" placeholder="Password" style="background-color:#F0F0F0" required>
                </div>
                <div class="d-flex justify-content-center">
                  <button type="submit" class="btn btn-primary w-25 btn-block  rounded-pill">Login</button>
                </div>
                <div>
                <p class="d-flex align-items-end pt-5 justify-content-center"> FCZ - MTSI - Solutions Universitaires </p>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
  </body>
</html>
