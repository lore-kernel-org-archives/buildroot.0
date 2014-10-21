From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 21 Oct 2014 11:26:37 -0300
Subject: [Buildroot] [PATCH 2/4] docs/manual: document makeusers group-only
	creation
In-Reply-To: <1413901599-27312-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413901599-27312-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413901599-27312-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 docs/manual/makeusers-syntax.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/manual/makeusers-syntax.txt b/docs/manual/makeusers-syntax.txt
index 5b3f347..8e64a0e 100644
--- a/docs/manual/makeusers-syntax.txt
+++ b/docs/manual/makeusers-syntax.txt
@@ -51,6 +51,8 @@ There are a few restrictions on the content of each field:
 If +home+ is not +-+, then the home directory, and all files below,
 will belong to the user and its main group.
 
+If +username+ is +-+, then just a group will be created.
+
 Examples:
 
 ----
-- 
2.0.4
