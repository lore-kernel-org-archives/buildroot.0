From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 22:17:03 +0200
Subject: [Buildroot] Autobuilder update: ARC toolchain updated
Message-ID: <20150727221703.6e5ba748@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I just pushed a minor update to the autobuilder configuration: I
rebuilt the ARC pre-built toolchain with the latest Buildroot master.
This should fix many of the .tbss related build problem.

See:

  http://git.buildroot.net/buildroot-test/commit/?id=c1b141aa4f892493d9e6cb6361d0edf68575798b

I will probably rebuild all Buildroot pre-built toolchains once -rc1 is
released.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
