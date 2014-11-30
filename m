From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 30 Nov 2014 16:40:53 +0200
Subject: [Buildroot] [PATCH] bluez5_utils: bumped version number to 5.25
In-Reply-To: <1417358256-3782-1-git-send-email-jaap@jcz.nl>
References: <1417358256-3782-1-git-send-email-jaap@jcz.nl>
Message-ID: <20141130144053.GY2374@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jaap,

On Sun, Nov 30, 2014 at 03:37:36PM +0100, Jaap Crezee wrote:
> Signed-off-by: Jaap Crezee <jaap@jcz.nl>
> ---
>  package/bluez5_utils/bluez5_utils.hash | 2 ++
>  package/bluez5_utils/bluez5_utils.mk   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  create mode 100644 package/bluez5_utils/bluez5_utils.hash
> 
> diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
> new file mode 100644
> index 0000000..c8295f9
> --- /dev/null
> +++ b/package/bluez5_utils/bluez5_utils.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated:
> +sha256  5ca62f3f45e2638a0f7a81658d6c8813ee01487436ae8e53e9fe395e23d1fd30    bluez-5.25.tar.xz

Should be: "From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc".

baruch


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
