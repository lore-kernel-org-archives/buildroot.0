From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 30 Oct 2018 21:51:26 +0100
Subject: [Buildroot] [PATCH 1/1] openswan: bump to version 2.56.1.1
Message-ID: <20181030205126.14095-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openswan/openswan.hash | 2 +-
 package/openswan/openswan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openswan/openswan.hash b/package/openswan/openswan.hash
index 02fe0f90c6..de0fa05058 100644
--- a/package/openswan/openswan.hash
+++ b/package/openswan/openswan.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 ec6bc5c7ff0b807482a95ca368bb273f35da2863c5069fbf7539e87a8bab8af4  openswan-2.6.50.1.tar.gz
+sha256 857c0d0b9a7e447d2857bf4d0f7118d7ed1196499e0b640e53e5c6bd0c0185d9  openswan-2.6.51.1.tar.gz
 sha256 1c36ae1e7b0f6cce4b4ffe969b71f83635734804acdd38544443564b00f8783a  COPYING
 sha256 d7d012ef3be47faffba4d97a83d4986c9f4a63ac997ebf5961d33852e5f1801a  LICENSE
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index ea4446a5f3..d7f1c46471 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSWAN_VERSION = 2.6.50.1
+OPENSWAN_VERSION = 2.6.51.1
 OPENSWAN_SITE = https://download.openswan.org/openswan
 OPENSWAN_LICENSE = GPL-2.0+, BSD-3-Clause
 OPENSWAN_LICENSE_FILES = COPYING LICENSE
-- 
2.17.1
