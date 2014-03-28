From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 28 Mar 2014 22:24:45 +0100
Subject: [Buildroot] [PATCH 4/9] manual/contribute.txt: fix typo
In-Reply-To: <1396041895-29533-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1396041895-29533-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1396041895-29533-5-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 docs/manual/contribute.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 52d4d04..028dd90 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -97,7 +97,7 @@ To indicate approval of a patch, there are three formal tags that keep
 track of this approval. To add your tag to a patch, reply to it with the
 approval tag below the original author's Signed-off-by line. These tags
 will be picked up automatically by patchwork (see
-ref:apply-patches-patchwork[]) and will be part of the commit log when
+xref:apply-patches-patchwork[]) and will be part of the commit log when
 the patch is accepted.
 
 Tested-by:: Indicates that the patch has been tested successfully.
-- 
1.7.9.5
