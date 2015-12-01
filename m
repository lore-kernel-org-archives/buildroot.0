From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 1 Dec 2015 21:41:55 +0100
Subject: [Buildroot] [PATCH] manual: clarify policy when updating a package
	patch
Message-ID: <1449002515-27302-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Renaud AUBIN <root@renaud.io>
---
 docs/manual/patch-policy.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index 6e27e71..bb859bd 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -106,6 +106,10 @@ upstream SCM software to generate the patch set.
 Otherwise, concatenate the header with the output of the
 +diff -purN package-version.orig/ package-version/+ command.
 
+If you update an existing patch (e.g. when bumping the package version),
+make sure the original author and existing Signed-off-by tags are not
+removed.
+
 At the end, the patch should look like:
 
 ---------------
-- 
2.6.2
