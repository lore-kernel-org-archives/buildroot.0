From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 9 Mar 2015 17:29:52 +0200
Subject: [Buildroot] [PATCH 1/1] network-manager: add hash file
In-Reply-To: <1425911414-31038-1-git-send-email-petr.vorel@gmail.com>
References: <1425911414-31038-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <20150309152952.GJ2518@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr,

On Mon, Mar 09, 2015 at 03:30:14PM +0100, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/network-manager/network-manager.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/network-manager/network-manager.hash
> 
> diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
> new file mode 100644
> index 0000000..07513a9
> --- /dev/null
> +++ b/package/network-manager/network-manager.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:

No need. It is at 
http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.0/NetworkManager-1.0.0.sha256sum.

> +sha256  3a66afec670c975edd9832e620b725a5f16ed267a1b9e1b2d51ef27250d85947  NetworkManager-1.0.0.tar.xz

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
