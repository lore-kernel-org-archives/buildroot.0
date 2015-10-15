From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 15 Oct 2015 15:03:06 +0200 (CEST)
Subject: [Buildroot] Repair boot from SD card on i.MX6 Sabre boards
In-Reply-To: <1444831418-13483-1-git-send-email-vincent.stehle@freescale.com>
References: <1444831418-13483-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <864575831.1180005.1444914186930.JavaMail.zimbra@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I know that this patch is still under review and might change, but in it's present form,

usind a imx6sabreq and util-linux 2.26.2-9 from debian

Tested-by: J?r?my Rosen <jeremy.rosen@openwide.fr>

Cordialement 

J?r?my Rosen 
+33 (0)1 42 68 28 13

fight key loggers : write some perl using vim 


Open Wide Ingenierie

23, rue Daviel
75013 Paris - France
www.openwide.fr

----- Le 14 Oct 15, ? 16:03, Vincent Stehl? vincent.stehle at freescale.com a ?crit :

> Hi,
> 
> Here is a two-patches series, to repair the boot from SD card on
> Freescale Sabre boards.
> 
> The first patch adapts the SD card creation script to the new versions
> of sfdisk; a prerequisite to actually preparing an SD card and booting
> from it.
> 
> The second patch switches the defconfigs to building a zImage instead of
> an uImage, to reflect what u-boot in Freescale releases awaits nowadays.
> 
> This was build-tested for all the five touched defconfigs but I did only
> verify the boot on i.MX6 quad Sabre AI.
> 
> Feedbacks and testers welcome!
> 
> Best regards,
> 
> V.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
