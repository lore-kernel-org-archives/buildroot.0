From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 16:25:14 +0100
Subject: [Buildroot] Make error with Builroot
In-Reply-To: <1450364297578-120495.post@n4.nabble.com>
References: <1450364297578-120495.post@n4.nabble.com>
Message-ID: <20151217162514.751e3cc3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Thu, 17 Dec 2015 06:58:17 -0800 (PST), yann12 wrote:

> When I execute the make command, I have a strange error, I reproduce the log
> here  : 
> 
> Configuring NCURSES 5.9 ABI 5 (Thu Dec 17 16:08:00 CET 2015)
> checking build system type... x86_64-unknown-linux-gnu
> checking host system type... arm-buildroot-linux-gnueabihf
> checking target system type... arm-buildroot-linux-gnueabihf
> Configuring for linux-gnueabihf
> checking for prefix... /usr
> checking for arm-buildroot-linux-gnueabihf-gcc...
> /home/novtech/Projects/me_buildroot-2014.08/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc
> checking for C compiler default output... configure: error: C compiler
> cannot create executables

Please pastebin somewhere (http://code.bulix.org) the contents of the
file /home/novtech/Projects/me_buildroot-2014.08/output/build/ncurses-5.9/config.log.

> It seems that he looks for arm-buildroot-linux-gnueabihf-gcc that doesn't
> exist !

It does exist, it is built by Buildroot at the beginning of the build.

Also, please pastebin your complete .config file.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
