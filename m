From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Nov 2018 16:21:05 +0100
Subject: [Buildroot] [PATCH next 0/2] Per-package folder fixes
Message-ID: <20181115152107.5834-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here are two patches that illustrate the kind of issue that one can
face with some packages when using per-package folders.

The commit log explain in further details the problems.

Thomas

Thomas Petazzoni (2):
  package/apr-util: fix build with per-package folders
  package/apache: add patch to fix per-package folder build

 ...in-handle-separate-APR_INCLUDE_DIR-A.patch | 47 +++++++++++++++++++
 package/apr-util/apr-util.mk                  |  9 ++++
 2 files changed, 56 insertions(+)
 create mode 100644 package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch

-- 
2.19.1
