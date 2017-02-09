From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 9 Feb 2017 15:31:53 +0200
Subject: [Buildroot] [PATCH] tslib: bump to 1.5
In-Reply-To: <1486646889-19742-1-git-send-email-martin.kepplinger@ginzinger.com>
References: <1486646889-19742-1-git-send-email-martin.kepplinger@ginzinger.com>
Message-ID: <20170209133153.7itfwf35md5hbf3f@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Martin,

On Thu, Feb 09, 2017 at 02:28:09PM +0100, Martin Kepplinger wrote:
> Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
> ---
> By the way, thank you for your help with backwards compatibity testing!
> tslib got better because of buildroot.
> 
> 
>  package/tslib/tslib.hash | 4 +---
>  package/tslib/tslib.mk   | 3 +--
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
> index b731df2..6597401 100644
> --- a/package/tslib/tslib.hash
> +++ b/package/tslib/tslib.hash
> @@ -1,4 +1,2 @@
>  # taken from https://github.com/kergoth/tslib/releases/tag/1.4

Should be 

  https://github.com/kergoth/tslib/releases/download/1.5/tslib-1.5.tar.xz.sha256

> -sha256  ad0373f1dbfda27caec92cb10421227f226c79d160488f1ac915585ba947741f  tslib-1.4.tar.xz
> -# Locally computed
> -sha256	b76d25358d1e2bbcc88b0b225e8d71cd00a4795f6d17020bae270940b17d0825  02795c4fa8b842c6fc017e86b5e036466bd4d3ef.patch
> +sha256  94874fe72c5af5c9be642a2ce524f014eb1d59d15cf852f2d3b2cf380f04252d  tslib-1.5.tar.xz

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
