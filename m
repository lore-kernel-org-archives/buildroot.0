From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  1 Jun 2015 21:11:12 +0300
Subject: [Buildroot] [PATCH 2/2] tcpdump: bump to version 4.7.4
In-Reply-To: <52fd7f7ccf19bfe68e2919435d07ba0805671a47.1433182272.git.baruch@tkos.co.il>
References: <52fd7f7ccf19bfe68e2919435d07ba0805671a47.1433182272.git.baruch@tkos.co.il>
Message-ID: <0219da9c0fb982a80d0d075cb1066ed746c3146d.1433182272.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/tcpdump/tcpdump.hash | 2 +-
 package/tcpdump/tcpdump.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index 36e1c3bd568c..5943347b422a 100644
--- a/package/tcpdump/tcpdump.hash
+++ b/package/tcpdump/tcpdump.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	1f87fb652ce996d41e7a06c601bc6ea29b13fee922945b23770c29490f1d8ace	tcpdump-4.7.3.tar.gz
+sha256	6be520269a89036f99c0b2126713a60965953eab921002b07608ccfc0c47d9af	tcpdump-4.7.4.tar.gz
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 71b844ab3502..6a88305a1522 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.7.3
+TCPDUMP_VERSION = 4.7.4
 TCPDUMP_SITE = http://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3c
 TCPDUMP_LICENSE_FILES = LICENSE
-- 
2.1.4
