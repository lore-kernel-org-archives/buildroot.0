From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  6 Aug 2013 23:36:20 +0200
Subject: [Buildroot] [PATCH 1/5] Docu: Add LIBFOO_EXTRACT_CMDS
In-Reply-To: <1375824984-8226-1-git-send-email-s.martin49@gmail.com>
References: <1375824984-8226-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1375824984-8226-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Stephan Hoffmann <sho@relinux.de>

[Samuel: add precision about non-tar archive]
Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/adding-packages-generic.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index faf70b1..a6f9565 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -358,6 +358,10 @@ LIBFOO_VERSION = 2.32
 Now, the variables that define what should be performed at the
 different steps of the build process.
 
+* +LIBFOO_EXTRACT_CMDS+ lists the actions to be performed to
+  extract the package in case no standard method applies
+  (ie. non-tar archive).
+
 * +LIBFOO_CONFIGURE_CMDS+ lists the actions to be performed to
   configure the package before its compilation.
 
-- 
1.8.3.4
