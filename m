From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Oct 2014 20:53:57 +0300
Subject: [Buildroot] [PATCH 2/2] package/mesa3d: Add hash file
In-Reply-To: <1413222259-8240-2-git-send-email-bernd.kuhls@t-online.de>
References: <1413222259-8240-1-git-send-email-bernd.kuhls@t-online.de>
 <1413222259-8240-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141013175357.GG3500@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Mon, Oct 13, 2014 at 07:44:19PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/mesa3d.hash |    2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/mesa3d/mesa3d.hash
> 
> diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
> new file mode 100644
> index 0000000..b7b905e
> --- /dev/null
> +++ b/package/mesa3d/mesa3d.hash
> @@ -0,0 +1,2 @@
> +# From http://cgit.freedesktop.org/mesa/mesa/commit/?h=10.3&id=fa98c74692634de4f87694a40a299b59c4716ee5

A better URL would be http://www.mesa3d.org/relnotes/10.3.1.html, I believe.

> +sha256	b081d077d717e5d56f2d59677490856052c41573e50378ff86d6c72456714add	MesaLib-10.3.1.tar.bz2

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
