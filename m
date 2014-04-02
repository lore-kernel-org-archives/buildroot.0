From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed,  2 Apr 2014 16:42:24 +0200
Subject: [Buildroot] [PATCH 0/2] eudev fixes (PowerPC)
Message-ID: <1396449746-12934-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Here are some patches to fix compilation of eudev for PowerPC when using an
external toolchain.

Best regards,
ELB

Eric Le Bihan (2):
  eudev: fix redefinition of usec_t and nsec_t.
  eudev: only use pragma diagnostics if GCC supports it.

 ...dev-Fix-redefinition-of-usec_t-and-nsec_t.patch |  526 ++++++++++++++++++++
 ...y-use-pragma-for-ignoring-diagnostics-if-.patch |   37 ++
 2 files changed, 563 insertions(+)
 create mode 100644 package/eudev/eudev-0002-libudev-Fix-redefinition-of-usec_t-and-nsec_t.patch
 create mode 100644 package/eudev/eudev-0003-libudev-Only-use-pragma-for-ignoring-diagnostics-if-.patch

-- 
1.7.9.5
