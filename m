From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 May 2014 22:43:31 +0200
Subject: [Buildroot] [PATCH 1/1] matchbox-keyboard: Fix dependencies
In-Reply-To: <87sio4gpso.fsf@dell.be.48ers.dk>
References: <1400601515-29764-1-git-send-email-bernd.kuhls@t-online.de>
 <87sio4gpso.fsf@dell.be.48ers.dk>
Message-ID: <20140520224331.74d22bcd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 20 May 2014 22:26:15 +0200, Peter Korsgaard wrote:

>  > -################################################################################
>  > -
>  > -ifeq ($(BR2_PACKAGE_PANGO),y)
>  > -  MATCHBOX_PKEYBOARD_CONF_OPT += --enable-pango
>  > -else
>  > -  MATCHBOX_KEYBOARD_DEPENDENCIES += xlib_libXft
>  > -endif
> 
> No?
> 
> ./configure --help|grep cairo
>   --enable-cairo    enable experimental Cairo support default=no

Hum cairo != pango ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
