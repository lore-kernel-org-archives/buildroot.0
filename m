From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 29 Jul 2014 17:01:30 +0200
Subject: [Buildroot] [PATCH] add sob line for patch series
Message-ID: <20140729150130.GA25263@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think -s is missing here to automatically add
the sob line, when using this example.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 docs/manual/contribute.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 12e7f98..b7e8944 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -272,7 +272,7 @@ This can be easily handled with +git format-patch+ by using the option
 
 ---------------------
 $ git format-patch --subject-prefix "PATCH v4" \
-    -M -o outgoing origin/master
+    -M -s -o outgoing origin/master
 ---------------------
 
 [[reporting-bugs]]
-- 
1.7.10.4
