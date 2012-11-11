From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 11 Nov 2012 14:14:55 +0100
Subject: [Buildroot] [PATCH 17/23] manual: add download-infra.txt
In-Reply-To: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
References: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1352639701-27829-18-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 create mode 100644 docs/manual/download-infra.txt

diff --git a/docs/manual/developer-guide.txt b/docs/manual/developer-guide.txt
index b254b0f..f3fc1dd 100644
--- a/docs/manual/developer-guide.txt
+++ b/docs/manual/developer-guide.txt
@@ -7,4 +7,6 @@ include::writing-rules.txt[]
 
 include::adding-packages.txt[]
 
+include::download-infra.txt[]
+
 include::board-support.txt[]
diff --git a/docs/manual/download-infra.txt b/docs/manual/download-infra.txt
new file mode 100644
index 0000000..63908ad
--- /dev/null
+++ b/docs/manual/download-infra.txt
@@ -0,0 +1,8 @@
+// -*- mode:doc -*- ;
+
+[[download-infra]]
+
+Download infrastructure
+-----------------------
+
+TODO
diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index b24731f..693347b 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -61,7 +61,7 @@ using +wget+, few are only available through their +git+, +mercurial+,
 or +svn+ repository.
 +
 All other source fetching methods are implemented and may be used in a
-development context.
+development context (further details: refer to xref:download-infra[]).
 +
 ** +bazaar+
 ** +cvs+
-- 
1.8.0
