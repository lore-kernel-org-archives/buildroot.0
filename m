From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 24 Mar 2012 21:44:04 +0100
Subject: [Buildroot] [PATCH v1 0/1] forward errno bug patches from uClibc
	0.9.32
Message-ID: <1332621845-10604-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These patches should also be applied to uclibc 0.9.33 in order to avoid 
runtime errors with libsoup or other applications that are sensistive to the errno threading bug.


Sagaert Johan (1):
  uClibc 0.9.33 : forward errno bug patches from uClibc 0.9.32

 ...x-e500-__fe_nomask_env-use-of-__set_errno.patch |   34 ++++++++++
 .../uClibc-0.9.33-linuxthreads-errno-fix.patch     |   68 ++++++++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 toolchain/uClibc/uClibc-0.9.33-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.33-linuxthreads-errno-fix.patch

-- 
1.7.9.3
