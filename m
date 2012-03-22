From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 22 Mar 2012 11:50:19 +0100
Subject: [Buildroot] bluez-utils 4.98 Configuring: error: D-Bus library
 is required
In-Reply-To: <CABpopuEqL7s31pZj9Qfj0v7pp1hYzfxYX8NazSKkOew6JK6NDw@mail.gmail.com>
References: <CABpopuEqL7s31pZj9Qfj0v7pp1hYzfxYX8NazSKkOew6JK6NDw@mail.gmail.com>
Message-ID: <4F6B03EB.1010502@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 21.03.2012 21:23, schrieb alex n:
> Hi,
> 
> I'm trying to compile bluez-utils but I get "error: D-Bus library is
> required" while it configure. D-Bus checked in menuconfig and compiled
> into /output/build/dbus-1.4.16 succesfully.
> So how can I fix this error?
> 
> Buildroot - 2012.02.

Have no problems with compiling bluez-utils. Have you tried make clean; make? What architecture you're compiling for? What toolchain?

Best regards,
Yegor
