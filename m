From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Mar 2011 10:17:10 +0100
Subject: [Buildroot] BR: unable to patch u-boot
In-Reply-To: <20110312004418.ed0f21fc085cea67a12906c6b8e6fb44.de35470e4e.wbe@email10.secureserver.net>
References: <20110312004418.ed0f21fc085cea67a12906c6b8e6fb44.de35470e4e.wbe@email10.secureserver.net>
Message-ID: <20110314101710.103d9566@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 12 Mar 2011 00:44:18 -0700
<nataraj@vaaraahi.com> wrote:

> |diff --git board/atmel/at91sam9263ek/at91sam9263ek.c board/atmel/at91sam9263ek/at91sam9263ek.c
> |index 5cd7aa7..94b80b4 100644
> |--- board/atmel/at91sam9263ek/at91sam9263ek.c
> |+++ board/atmel/at91sam9263ek/at91sam9263ek.c
> --------------------------

Patches should be generated to be apply with "patch -p1", i.e the paths
in the patch must have an useless training component path. Instead of :

 board/atmel/at91sam9263ek/at91sam9263ek.c

you should have

 a/board/atmel/at91sam9263ek/at91sam9263ek.c

or

 whateveryouwant/board/atmel/at91sam9263ek/at91sam9263ek.c

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
