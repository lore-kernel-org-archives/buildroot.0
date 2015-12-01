From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 1 Dec 2015 12:10:20 +0200
Subject: [Buildroot] [PATCH 1/1] Update the libhttpparser package
In-Reply-To: <1448958904-12009-1-git-send-email-root@renaud.io>
References: <1448958904-12009-1-git-send-email-root@renaud.io>
Message-ID: <20151201101020.GD2193@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Renaud AUBIN,

On Tue, Dec 01, 2015 at 09:35:04AM +0100, Renaud AUBIN wrote:
> The http-parser repository has been transfered from joyent to nodejs.
> Bump version to 2.6.0.
> 
> Signed-off-by: Renaud AUBIN <root@renaud.io>

[...]

> -From d9dfeca8736318eaad5cd4554cbae059469decde Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Date: Fri, 28 Aug 2015 19:02:11 +0200
> +From fb2d2803bdad4847b3116a325a9ae0a56f906a08 Mon Sep 17 00:00:00 2001
> +From: Renaud AUBIN <root@renaud.io>
> +Date: Tue, 1 Dec 2015 09:24:41 +0100

Please do not change the patch authorship.

>  Subject: [PATCH] Use -f option when calling ln at install time
>  
>  This allows "make install; make install" to work properly.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Also, please don't remove existing sign-off. You may add your sign-off here 
when you update the patch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
