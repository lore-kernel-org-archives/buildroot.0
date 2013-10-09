From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed,  9 Oct 2013 11:37:02 +0200
Subject: [Buildroot] [PATCH 1/1] manual generation : python-argparse is
	needed with older phyton releases.
Message-ID: <1381311422-31077-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 docs/manual/prerequisite.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 78ce436..1fc1a29 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -77,3 +77,4 @@ development context (further details: refer to xref:download-infra[]).
 
 * Documentation generation tools:
 ** +asciidoc+
+** +python-argparse+
-- 
1.8.4
