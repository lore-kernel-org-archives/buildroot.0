From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Oct 2018 20:48:24 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] package/python-enum34:
 enable host build
Message-ID: <20181023224617.6B4A5886DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c6d87e8a8fdec319b43fab7c5909f40b7269f03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

This is initially used by the setools package to do offline
policy analysis using host tools.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3ec98f0564dfa68d55b52b2815f8017455993ea9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-enum34/python-enum34.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-enum34/python-enum34.mk b/package/python-enum34/python-enum34.mk
index c612cb65e2..09d1143ab9 100644
--- a/package/python-enum34/python-enum34.mk
+++ b/package/python-enum34/python-enum34.mk
@@ -12,3 +12,4 @@ PYTHON_ENUM34_LICENSE = BSD-3-Clause
 PYTHON_ENUM34_LICENSE_FILES = enum/LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
