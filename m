From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 12 Apr 2015 11:47:23 +0300
Subject: [Buildroot] [PATCH] giflib: fix description about compatibility
 with libungif
In-Reply-To: <1428828185-19869-1-git-send-email-fabio.porcedda@gmail.com>
References: <1428828185-19869-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150412084723.GH2279@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Sun, Apr 12, 2015 at 10:43:05AM +0200, Fabio Porcedda wrote:
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  package/giflib/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/giflib/Config.in b/package/giflib/Config.in
> index 70368dc..bb5741a 100644
> --- a/package/giflib/Config.in
> +++ b/package/giflib/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_GIFLIB
>  	bool "giflib"
>  	help
> -	  giflib is a library for reading and writing gif images. It is API and
> +	  giflib is a library for reading and writing gif images. It was API and
>  	  ABI compatible with libungif which was in wide use while the LZW
>  	  compression algorithm was patented.

So giflib is not compatible to libungif anymore?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
