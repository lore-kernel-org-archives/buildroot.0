From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Jun 2009 12:27:52 +0200
Subject: [Buildroot] [git commit] toolchain/kernel: remove ancient versions
Message-ID: <20090611111352.E3814771F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fac68300eeddb0a3eec2e745b208e4f39ff5811
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch is too large, so refusing to show it


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |   17 +-
 .../kernel-headers/kernel-headers-new.makefile     |    4 -
 .../kernel-headers/linux-2.6.23-nios2nommu.patch   |26567 --------------------
 .../linux-2.6.25.19-export-linux-aout.patch        |   24 -
 4 files changed, 1 insertions(+), 26611 deletions(-)
 delete mode 100644 toolchain/kernel-headers/linux-2.6.23-nios2nommu.patch
 delete mode 100644 toolchain/kernel-headers/linux-2.6.25.19-export-linux-aout.patch
