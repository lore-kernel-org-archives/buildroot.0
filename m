From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 15:05:29 +0100
Subject: [Buildroot] roseapplepi_defconfig fails to build
Message-ID: <20161105150529.2e72435a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Earlier this year, you added the roseapplepi_defconfig in Buildroot.
However, this defconfig now fails to build its kernel with gcc 5.x.
Since you have access to the HW, could you submit a patch to update the
defconfig?

See the full build log at
http://free-electrons.com/~thomas/pub/buildroot-defconfigs/roseapplepi_defconfig.log.FAIL.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
