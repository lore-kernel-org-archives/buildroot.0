From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jan 2015 17:46:57 +0100
Subject: [Buildroot] [git commit] qwt: add license information
Message-ID: <20150120164706.5E25E807FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb964781218ee73ce6fce88529679b200f196899
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qwt/qwt.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index a92d6b4..7105da5 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -10,6 +10,9 @@ QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
 QWT_DEPENDENCIES = qt
 
+QWT_LICENSE = LGPLv2.1 with exceptions
+QWT_LICENSE_FILES = COPYING
+
 QWT_CONFIG = 's%QWT_INSTALL_PREFIX.*/usr/local/.*%QWT_INSTALL_PREFIX = /usr%'
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDesigner.*$$/\# QWT_CONFIG += QwtDesigner/'
 QWT_CONFIG += -e 's%/features%/mkspecs/features%'
