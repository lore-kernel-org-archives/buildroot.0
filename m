From: Thomas Huth <huth@tuxfamily.org>
Date: Wed, 29 May 2019 17:18:58 +0200
Subject: [Buildroot] [PATCH 05/19] package/dbus-glib: add hash for
 license file
In-Reply-To: <20190529033537.128311-6-aduskett@gmail.com>
References: <20190529033537.128311-1-aduskett@gmail.com>
 <20190529033537.128311-6-aduskett@gmail.com>
Message-ID: <b0c2449f-6afa-365f-0c0f-ce23b05c3f5e@tuxfamily.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/05/2019 05.35, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/dbus-glib/dbus-glib.hash | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/dbus-glib/dbus-glib.hash b/package/dbus-glib/dbus-glib.hash
> index 8a80b71b45..098832431e 100644
> --- a/package/dbus-glib/dbus-glib.hash
> +++ b/package/dbus-glib/dbus-glib.hash
> @@ -1,2 +1,5 @@
>  # Locally calculated after checking pgp signature
>  sha256 7ce4760cf66c69148f6bd6c92feaabb8812dee30846b24cd0f7395c436d7e825  dbus-glib-0.110.tar.gz
> +
> +# Locally calculated
> +sha256 ef1634fc21d9112dca08f2557313584719d534d05213cf14f3c77938506266b4  COPYING
> 

Reviewed-by: Thomas Huth <huth@tuxfamily.org>
