From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Jul 2020 22:00:58 +0200
Subject: [Buildroot] [PATCH v2] package/dvb-apps: add hash file
In-Reply-To: <20200707211947.3886-1-sergio.prado@e-labworks.com>
References: <20200707211947.3886-1-sergio.prado@e-labworks.com>
Message-ID: <20200709200058.GB2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergio, All,

On 2020-07-07 18:19 -0300, Sergio Prado spake thusly:
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - fix source code hash (it will only build if the archive available on
>     sources.buildroot.net is removed, see discussion in [1]).
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2020-July/285982.html
> 
> ---
>  package/dvb-apps/dvb-apps.hash | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 package/dvb-apps/dvb-apps.hash
> 
> diff --git a/package/dvb-apps/dvb-apps.hash b/package/dvb-apps/dvb-apps.hash
> new file mode 100644
> index 000000000000..d394ced131df
> --- /dev/null
> +++ b/package/dvb-apps/dvb-apps.hash
> @@ -0,0 +1,6 @@
> +# Locally computed:
> +sha256  926208b7e711b4bab1a909ff9bf4e6ae54acdd30a46f5d5bd700ecb088fe1f57  dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz
> +
> +# Hash for license files:
> +sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> +sha256  4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
> -- 
> 2.17.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
