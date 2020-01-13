From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2020 21:17:43 +0100
Subject: [Buildroot] [git commit] package/openswan: security bump to version
 2.6.51.5
Message-ID: <20200113201115.38E5381751@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94c66ece472bf816ff8e23a26c468aa2f69ec2bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2019-10155 (IKEv1 information exchange packet's integrity check
value is not verified)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openswan/openswan.hash | 2 +-
 package/openswan/openswan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openswan/openswan.hash b/package/openswan/openswan.hash
index de0fa05058..a9b54dbaf6 100644
--- a/package/openswan/openswan.hash
+++ b/package/openswan/openswan.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 857c0d0b9a7e447d2857bf4d0f7118d7ed1196499e0b640e53e5c6bd0c0185d9  openswan-2.6.51.1.tar.gz
+sha256 4124f4ce970089f301c34b9c48f54b021cf6b2b8813877942337f8022104f70d  openswan-2.6.51.5.tar.gz
 sha256 1c36ae1e7b0f6cce4b4ffe969b71f83635734804acdd38544443564b00f8783a  COPYING
 sha256 d7d012ef3be47faffba4d97a83d4986c9f4a63ac997ebf5961d33852e5f1801a  LICENSE
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index d7f1c46471..aabf7d98c7 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSWAN_VERSION = 2.6.51.1
+OPENSWAN_VERSION = 2.6.51.5
 OPENSWAN_SITE = https://download.openswan.org/openswan
 OPENSWAN_LICENSE = GPL-2.0+, BSD-3-Clause
 OPENSWAN_LICENSE_FILES = COPYING LICENSE
