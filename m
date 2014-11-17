From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 17 Nov 2014 20:14:50 -0300
Subject: [Buildroot] [RFC PATCH 0/2] Add Freescale e5500 & e6500 support
Message-ID: <1416266092-6465-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset enables internal toolchain builds for Freescale e5500
and e6500 cores.
It's only built-tested to generate a 32 and 64-bit toolchains
with a basic busybox binary and libraries.

Feedback welcome, free kits to test as well :)

Gustavo Zacarias (2):
  arch/powerpc: add fsl e5500 and e6500 support
  package/gcc: set e5500 and e6500 version mask

 arch/Config.in.powerpc     | 7 +++++++
 package/gcc/Config.in.host | 6 ++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.0.4
