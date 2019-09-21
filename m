From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:12:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-flask-login: add hash
 for the license file
In-Reply-To: <20190917121624.13287-1-sebastien.szymanski@armadeus.com>
References: <20190917121624.13287-1-sebastien.szymanski@armadeus.com>
Message-ID: <5bc97189-827d-1c6b-698b-f74e4bcff106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/09/2019 14:16, S?bastien Szymanski wrote:
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/python-flask-login/python-flask-login.hash | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/python-flask-login/python-flask-login.hash b/package/python-flask-login/python-flask-login.hash
> index 909c3079cc..75dbe30c7a 100644
> --- a/package/python-flask-login/python-flask-login.hash
> +++ b/package/python-flask-login/python-flask-login.hash
> @@ -1,3 +1,6 @@
>  # from https://pypi.python.org/pypi/flask_login/json
>  md5 25b34c74bd509792f291c16e184225df Flask-Login-0.4.1.tar.gz
>  sha256 c815c1ac7b3e35e2081685e389a665f2c74d7e077cb93cecabaea352da4752ec Flask-Login-0.4.1.tar.gz
> +
> +# Locally computed
> +sha256 7a9dfb9c5da204ed1370f3b62c13e2992a12da1da707f47e156897eeb4344e5b LICENSE
> 
