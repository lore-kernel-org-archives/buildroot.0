From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jun 2009 09:59:00 +0200
Subject: [Buildroot] ssh
In-Reply-To: <49282.172.16.221.250.1246225016.squirrel@www.xtale.biz>
References: <49282.172.16.221.250.1246225016.squirrel@www.xtale.biz>
Message-ID: <20090629095900.18579e55@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 28 Jun 2009 21:36:56 -0000 (Europe/London),
nfrench at xtale.biz a ?crit :

> just booted and have a problem with ssh (dropbear) that it needs
> libgcc_s.so and this is not int the image

Which Buildroot mode are you using ? Buildroot toolchain or external
binary toolchain ?

> I could copy the one from the build of gcc but thats >300k do I need
> to change some thing in the build options.

Here on ARM, my libgcc_s.so.1 unstripped is ~175K, and stripped, it is
~42K.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
