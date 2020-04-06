From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 6 Apr 2020 20:45:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: fix typo
In-Reply-To: <20200406043826.10420-1-zhaojh329@gmail.com>
References: <20200406043826.10420-1-zhaojh329@gmail.com>
Message-ID: <20200406204552.24818d1b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jianhui,

On Mon,  6 Apr 2020 12:38:26 +0800, Jianhui Zhao <zhaojh329@gmail.com> wrote:

> dlopenx -> dlopen

Thanks for fixing..., but changing a already published release is not
a favored solution (gives problems with already downloaded/cached source
files)...

Regards,
Peter

>
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> ---
>  package/libuhttpd/libuhttpd.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
> index 5c3359fdd3..2ec19144b7 100644
> --- a/package/libuhttpd/libuhttpd.hash
> +++ b/package/libuhttpd/libuhttpd.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 272e64fab9932039366270efa49dd4df98f5ebe8c76e51ae578594b37bf6eef4  libuhttpd-3.1.3.tar.gz
> +sha256 f1b79a9cee1dcfec0f693768687999062ed95c2307ec597fc3f32bc23f082531  libuhttpd-3.1.3.tar.gz
>  sha256 99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
