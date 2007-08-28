From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 28 Aug 2007 14:55:27 +0200
Subject: [Buildroot] svn commit:	trunk/buildroot/target/device/Atme
 l:	atngw100/target_skeleton	atngw100/target etc...
Message-ID: <zjt0WVFMP7Qj.yZGl7kFD@mailout.dof.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Some stuff are needed
> during the build and
> the device table is only
> used when you convert
> $(TARGET-DIR) to
> rootfs-avr32.$(fs) which
> is too late.
> 
> It can probably be done
> better

Indeed, the packages failing with an "empty" skeleton should have some
mkdir -p actions in them IMHO. That way not all targets needs to be
fixed, but just one package.

=> Feel free to provide
   those patches.

Best Regards
Ulf Samuelsson
