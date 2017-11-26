From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 10:34:08 +0100
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4, 9,
 13}.x series
In-Reply-To: <1509632292-30822-2-git-send-email-festevam@gmail.com> (Fabio
 Estevam's message of "Thu, 2 Nov 2017 12:18:12 -0200")
References: <1509632292-30822-1-git-send-email-festevam@gmail.com>
 <1509632292-30822-2-git-send-email-festevam@gmail.com>
Message-ID: <87r2slidtb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > From: Fabio Estevam <fabio.estevam@nxp.com>
 > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Committed to 2017.02.x and 2017.08.x after dropping the 4.13.x change,
thanks.

> ---
 >  package/linux-headers/Config.in.host | 6 +++---
 >  1 file changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
 > index 23393f4..cb915cc 100644
 > --- a/package/linux-headers/Config.in.host
 > +++ b/package/linux-headers/Config.in.host
 > @@ -244,10 +244,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 >  	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
 >  	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 >  	default "4.1.45"	if BR2_KERNEL_HEADERS_4_1
 > -	default "4.4.95"	if BR2_KERNEL_HEADERS_4_4
 > -	default "4.9.59"	if BR2_KERNEL_HEADERS_4_9
 > +	default "4.4.96"	if BR2_KERNEL_HEADERS_4_4
 > +	default "4.9.60"	if BR2_KERNEL_HEADERS_4_9
 >  	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 >  	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 >  	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 > -	default "4.13.10"	if BR2_KERNEL_HEADERS_4_13
 > +	default "4.13.11"	if BR2_KERNEL_HEADERS_4_13
 >  	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 > -- 
 > 2.7.4

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
