From: angus salkeld <angus.salkeld@alliedtelesis.co.nz>
Date: Tue, 05 May 2009 07:38:57 +1200
Subject: [Buildroot] [PATCH] Add a .gitignore file
In-Reply-To: <49FEAF91.8050403@nessie.de>
References: <49FEE4470200007000014C15@gwia.alliedtelesyn.co.nz>
	<49FEAF91.8050403@nessie.de>
Message-ID: <49FFED11.D58A.0070.1@alliedtelesis.co.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Thanks for the feedback.
Here is a patch with the suggested changes.

Regards
-Angus Salkeld

---
 .gitignore                |    9 +++++++++
 package/config/.gitignore |    6 ++++++
 2 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 .gitignore
 create mode 100644 package/config/.gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..f901994
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,9 @@
+/build_*
+/project_*
+/toolchain_*
+/binaries/*
+/.auto.deps
+/.config.cmd
+/.config.old
+*.depend
+*.o
diff --git a/package/config/.gitignore b/package/config/.gitignore
new file mode 100644
index 0000000..9067e68
--- /dev/null
+++ b/package/config/.gitignore
@@ -0,0 +1,6 @@
+/buildroot-config
+/conf
+/mconf
+/lex.zconf.c
+/zconf.hash.c
+/zconf.tab.c
-- 
1.5.6
