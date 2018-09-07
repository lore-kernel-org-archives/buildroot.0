From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 07 Sep 2018 06:35:21 +0300
Subject: [Buildroot] [PATCH 1/1] mongoose: fix hash
In-Reply-To: <20180906214220.854-1-fontaine.fabrice@gmail.com>
References: <20180906214220.854-1-fontaine.fabrice@gmail.com>
Message-ID: <87musu3rpi.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Fabrice Fontaine writes:
> When bumping to version 6.7, hash was not updated

Commit 965c5ca57d3 (mongoose: bump to version 6.7) from April 2017, did
update the hash to its current value. You can find a tarball with this
hash at

  http://sources.buildroot.net/mongoose-6.7.tar.gz

But the current github download is indeed different. Not sure what went
wrong here, but this description is not correct.

baruch

> Fixes:
>  - http://autobuild.buildroot.org/results/599920bc0a5821fd3fb0a028574a25a22e12430f
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mongoose/mongoose.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
> index d5252eb687..049cd74885 100644
> --- a/package/mongoose/mongoose.hash
> +++ b/package/mongoose/mongoose.hash
> @@ -1,2 +1,2 @@
>  # Locally computed:
> -sha256	ccc971298db70963d3f13766c3246a3c36ae7e388acfab7ba2180149d9c8c64f  mongoose-6.7.tar.gz
> +sha256	7033c4c9ad0aac2aaa53864ff0bee5468a327a78a3218fb753d55a426a791189  mongoose-6.7.tar.gz

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
