From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 21:04:50 +0200
Subject: [Buildroot] Autobuilder toolchain configuration update
Message-ID: <20150809210450.79363a21@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've pushed a small update of the Buildroot external toolchains used in
the autobuilders:

 * All toolchains have been rebuilt from Git version ad0f85e instead of
   4a48479 previously.

 * br-arm-cortex-a9-glibc is now using gcc 5.x. The last rebuild
   reverted it to gcc 4.9 due to the rename of Config.in symbol for gcc
   versions. It's now back at gcc 5.x. So gcc 5.x issues should
   reappear in the autobuilders.

 * The NIOS II toolchain, which was stuck at Buildroot 2015.05 due to a
   build failure in gcc following the bump to 4.9.3, has now been
   rebuilt thanks to the build problem being fixed.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
