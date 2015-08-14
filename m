From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 14 Aug 2015 17:15:16 +0300
Subject: [Buildroot] [PATCH] [autobuild] package/bwm-ng: fix build
 failures with gcc-5
In-Reply-To: <1439500078-22674-1-git-send-email-yann.morin.1998@free.fr>
References: <1439500078-22674-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150814141516.GC25261@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thu, Aug 13, 2015 at 11:07:58PM +0200, Yann E. MORIN wrote:
> diff --git a/package/bwm-ng/bwm-ng.hash b/package/bwm-ng/bwm-ng.hash
> index 6bb8355..44272b1 100644
> --- a/package/bwm-ng/bwm-ng.hash
> +++ b/package/bwm-ng/bwm-ng.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  c1134358e268329d438b0996399003b0f0b966034fb4b5b138761c2f3c62ffdd  bwm-ng-0.6.tar.gz
> +sha1  9445885d05e2430ca174739e3aba343afce94076  bwm-ng-0.6.1.tar.gz

Why sha1?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
