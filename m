From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 7 Jul 2018 23:47:22 +0200
Subject: [Buildroot] [git commit] package/openpowerlink: bump to version
 2.7.0
Message-ID: <20180707214400.A26E087FD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3193ac1d5426ad7202cfb262094f86f32f454212
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See http://openpowerlink.sourceforge.net/doc/2.7/2.7.0/page_revision_history.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openpowerlink/openpowerlink.hash | 8 ++++----
 package/openpowerlink/openpowerlink.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openpowerlink/openpowerlink.hash b/package/openpowerlink/openpowerlink.hash
index f69950ddcf..da9bdd2a72 100644
--- a/package/openpowerlink/openpowerlink.hash
+++ b/package/openpowerlink/openpowerlink.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.6.2/
-md5	bbb268e33e55424de563cb677703d8f7	openPOWERLINK_V2.6.2.tar.gz
-sha1	bf6a8b202c1192b531ce6d6c4c6254e5689c65fe	openPOWERLINK_V2.6.2.tar.gz
+# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.7.0/
+md5	4843f857b8334c984827435fa9e1ab96	openPOWERLINK_V2.7.0.tar.gz
+sha1	a256e05d187b334651764ab21a827b3a4fa64e2f	openPOWERLINK_V2.7.0.tar.gz
 # sha256 locally computed
-sha256	38d7a93c05cc0167be5c498e625d1efddeac2616ceb1bc8c3c6679552ae6da15	openPOWERLINK_V2.6.2.tar.gz
+sha256	64c23ee42e3852bf2316fd99c59eae9cdd634219f92b3ea70ce747dad1e05354	openPOWERLINK_V2.7.0.tar.gz
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index e2958b30b1..90088cef56 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENPOWERLINK_VERSION = V2.6.2
+OPENPOWERLINK_VERSION = V2.7.0
 OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_VERSION)
 OPENPOWERLINK_SOURCE = openPOWERLINK_$(OPENPOWERLINK_VERSION).tar.gz
 OPENPOWERLINK_LICENSE = BSD-2-Clause, GPL-2.0
