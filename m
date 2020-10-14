From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 20:42:57 +0200
Subject: [Buildroot] [git commit] package/jquery: bump to version 3.5.1
Message-ID: <20201014183148.378D28867F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6b61e6d591d16908bc433c70df3b7400c149d2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ignacy Gaw??dzki <ignacy.gawedzki@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jquery/jquery.hash | 2 +-
 package/jquery/jquery.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jquery/jquery.hash b/package/jquery/jquery.hash
index ec43e7cd7a..e9ef56a46d 100644
--- a/package/jquery/jquery.hash
+++ b/package/jquery/jquery.hash
@@ -1,2 +1,2 @@
 # Locally computed hashes, not provided by upstream
-sha256	2ecd295d295bec062cedebe177e54b9d6b19fc0a841dc5c178c654c9ccff09c0	jquery-1.11.2.min.js
+sha256  f7f6a5894f1d19ddad6fa392b2ece2c5e578cbf7da4ea805b6885eb6985b6e3d	jquery-3.5.1.min.js
diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
index f75eded8b3..88ab84fa05 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQUERY_VERSION = 1.11.2
+JQUERY_VERSION = 3.5.1
 JQUERY_SITE = http://code.jquery.com
 JQUERY_SOURCE = jquery-$(JQUERY_VERSION).min.js
 JQUERY_LICENSE = MIT
