From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Dec 2013 12:29:14 +0100
Subject: [Buildroot] [git commit] snmppp: fix legal informations after
	version bump
Message-ID: <20131227112943.A45919C1E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=006e9d69c051a1112247c7b153198fd469e926c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/e64/e64c3edcb00132620b07ad815c6e4d33b70c262f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/snmppp/snmppp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index d5e7adf..eb1b7b9 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -12,6 +12,6 @@ SNMPPP_INSTALL_STAGING = YES
 # no configure script in tarball
 SNMPPP_AUTORECONF = YES
 SNMPPP_LICENSE = SNMP++
-SNMPPP_LICENSE_FILES = snmp_pp/snmp_pp.cpp
+SNMPPP_LICENSE_FILES = src/v3.cpp
 
 $(eval $(autotools-package))
