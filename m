From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 20 Mar 2012 23:53:42 +0100
Subject: [Buildroot] [PATCH v1 0/1] uClibc 0.9.33 : apply the patches from
	uClibc 0.9.32
Message-ID: <1332284023-32025-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After applying the patches from 0.9.32 to 0.9.33 i no longer have the issue with libsoup/libglib2
Thanks for the hint of Will Wagner.

Sagaert Johan (1):
  uClibc 0.9.33 : patches from 0.9.32 should be ported to uClibc 0.9.33 too.

 ...x-e500-__fe_nomask_env-use-of-__set_errno.patch |   34 ++++++++++
 .../uClibc-0.9.33-linuxthreads-errno-fix.patch     |   68 ++++++++++++++++++++
 .../uClibc/uClibc-0.9.33-sparc-errno-fix.patch     |   11 ++++
 3 files changed, 113 insertions(+)
 create mode 100644 toolchain/uClibc/uClibc-0.9.33-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.33-linuxthreads-errno-fix.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.33-sparc-errno-fix.patch

-- 
1.7.9.3
