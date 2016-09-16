From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 18:44:54 +0200
Subject: [Buildroot] [git commit] audit: update legal info
Message-ID: <20160916164525.89E027FE2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1011f89a18b3cebc198e328b87f91707a8755af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Programs are released under GPLv2+. README file says libraries
libaudit.* and libauparse.* are released under LGPL but there are two
files auparse/strsplit.c and lib/strsplit.c which are released under
GPLv2+ which makes both libraries GPL. Until we review situation with
upstream, we simply mention "unclear (libraries)".

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
[Thomas: add "unclear (libraries)" as suggested by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/audit/audit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 7137208..0e5bd27 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -6,7 +6,7 @@
 
 AUDIT_VERSION = 2.6.7
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
-AUDIT_LICENSE = GPLv2
+AUDIT_LICENSE = GPLv2+ (programs), unclear (libraries)
 AUDIT_LICENSE_FILES = COPYING
 
 AUDIT_INSTALL_STAGING = YES
