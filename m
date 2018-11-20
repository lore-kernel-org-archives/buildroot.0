From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Nov 2018 17:38:51 +0100
Subject: [Buildroot] [PATCH next v2 0/2] apr-util/apache fixes for
 per-package folders
Message-ID: <20181120163853.5040-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is a v2 of the apr-util/apache fixes for per-package
folders. There is a changelog in each of the two patches.

Thanks,

Thomas

Thomas Petazzoni (2):
  package/apr-util: fix build with per-package folders
  package/apache: add patch to fix per-package folder build

 ...in-handle-separate-APR_INCLUDE_DIR-A.patch | 48 +++++++++++++++++++
 package/apr-util/apr-util.mk                  |  7 +++
 2 files changed, 55 insertions(+)
 create mode 100644 package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch

-- 
2.19.1
