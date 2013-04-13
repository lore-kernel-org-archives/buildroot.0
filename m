From: Ormund Williams <ormundw@panix.com>
Date: Sat, 13 Apr 2013 16:55:06 -0400
Subject: [Buildroot] Failure at: linux 3.7.8 Installing to target
Message-ID: <1365886506.4087.37.camel@station1>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I seem to be getting a similar error one that was reported a few months
ago but instead of failing at kernel build time it now fails at the
install stage:

>>> linux 3.7.8 Installing to target
# dtbs moved from arch/RCH/boot to arch/RCH/boot/dts since 3.8-rc1
cp  /home/ormund/projects/atlantic/buildroot-2013.02/output/images/
cp: missing destination file operand after `/home/ormund/projects/atlantic/buildroot-2013.02/output/images/'
Try `cp --help' for more information.
make: *** [/home/ormund/projects/atlantic/buildroot-2013.02/output/build/linux-3.7.8/.stamp_target_installed] Error 1


Any ideas what should be done?

-- 
Ormund
