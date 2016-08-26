From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 16:25:02 +0200
Subject: [Buildroot] Autobuilder toolchain update
Message-ID: <20160826162502.00fe5ac9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

For your information, I've updated in the autobuilders the pre-built
Buildroot ARC toolchain, in order to use the latest fix provided by
Vlad [1].

This should hopefully get rid of a bunch of compiler failures spotted
by the autobuilders on the ARC architecture.

The new toolchain is:

   http://autobuild.buildroot.net/toolchains/tarballs/br-arcle-hs38-full-2016.08-rc2-77-g2a4d2c5.tar.bz2

Best regards,

Thomas

[1] https://git.buildroot.org/buildroot/commit/?id=62d9a0fc06cf78b0853473ad3d66bc7a2d3a361d
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
