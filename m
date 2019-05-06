From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 6 May 2019 12:14:23 +0300
Subject: [Buildroot] [PATCH 3/3] package/strace: add patch for nds32
 support
In-Reply-To: <20190506090411.9453-3-nylon7@andestech.com>
References: <20190506090411.9453-1-nylon7@andestech.com>
 <20190506090411.9453-3-nylon7@andestech.com>
Message-ID: <20190506091423.l5ndcdgan6y7hs2m@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nylon,

On Mon, May 06, 2019 at 05:04:11PM +0800, Nylon Chen wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/05ec776548c9bede4878d4c3c43040c5b0aac182
>   http://autobuild.buildroot.net/results/24023f2fa3dbf7c281726abdbfd4322badaffbfb
> 
> Signed-off-by:vincentc <vincentc@andestech.com>
> Signed-off-by: Nylon Chen <nylon7@andestech.com>
> ---
>  package/strace/0001-Add-nds32-porting.patch | 490 ++++++++++++++++++++
>  package/strace/Config.in                    |   1 -
>  2 files changed, 490 insertions(+), 1 deletion(-)
>  create mode 100644 package/strace/0001-Add-nds32-porting.patch
> 
> diff --git a/package/strace/0001-Add-nds32-porting.patch b/package/strace/0001-Add-nds32-porting.patch
> new file mode 100644
> index 0000000000..f0e7085880
> --- /dev/null
> +++ b/package/strace/0001-Add-nds32-porting.patch
> @@ -0,0 +1,490 @@
> +From df64eebd778a46065e28b13053b1b68f125888a1 Mon Sep 17 00:00:00 2001
> +From: Nylon Chen <nylon7@andestech.com>
> +Date: Mon, 6 May 2019 14:41:32 +0800
> +Subject: [PATCH] Add nds32 porting
> +
> +Signed-off-by:vincentc <vincentc@andestech.com>

Your own sign off is missing here.

What is the upstream status of this patch?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
