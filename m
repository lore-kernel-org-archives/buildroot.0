From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 23:59:54 +0100
Subject: [Buildroot] [git commit] manual: add download-infra.txt
Message-ID: <20121115230541.C1BF299E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6bdeb7420e0230747e8edd7691f99f64541f8cf4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/developer-guide.txt |    2 ++
 docs/manual/download-infra.txt  |    8 ++++++++
 docs/manual/prerequisite.txt    |    2 +-
 3 files changed, 11 insertions(+), 1 deletions(-)

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
