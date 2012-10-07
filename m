From: Stephan Hoffmann <sho@relinux.de>
Date: Sun,  7 Oct 2012 16:45:11 +0200
Subject: [Buildroot] [PATCH] Manual: added FAQ entry about source override
Message-ID: <1349621111-31678-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 docs/manual/faq.txt |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/docs/manual/faq.txt b/docs/manual/faq.txt
index 575d019..fdd6a30 100644
--- a/docs/manual/faq.txt
+++ b/docs/manual/faq.txt
@@ -1,6 +1,19 @@
 Frequently Asked Questions
 ==========================
 
+How can I use sources from my local PC instead of the official tarball?
+-----------------------------------------------------------------------
+
+Just use the "Source Directory Override" mechanism.
+
+You have to add a file local.mk to you project with the following
+definition within:
+
+<package>_OVERRIDE_SRCDIR = wherever.you.source.lives
+
+Then announce this file to buildroot in the "Build options" menu as
+"location of a package override file".
+
 The boot hangs after 'Starting network...'
 ------------------------------------------
 
-- 
1.7.0.4
