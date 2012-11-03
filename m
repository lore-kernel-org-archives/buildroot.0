From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Nov 2012 12:50:27 +0100
Subject: [Buildroot] Reproducing autobuilder tests
Message-ID: <20121103125027.6ec9cbcc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

For people willing to help in solving the build failures reported by
our autobuilders, I've put up a script called br-reproduce-build that
will, provided the SHA1 identifying a build, reproduce this exact same
build on your machine.

This script is available at:

  http://git.buildroot.net/buildroot-test/plain/utils/br-reproduce-build

You need to customize the BASE_GIT to point to a local directory that
cointains a Buildroot Git repository, and OUTPUT_DIR to point to the
directory where you want the build to take place.

The script is available in the buildroot-test Git repository at
http://git.buildroot.net/buildroot-test/. Don't hesitate to report any
problem or send patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
