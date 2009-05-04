From: angus salkeld <angus.salkeld@alliedtelesis.co.nz>
Date: Mon, 04 May 2009 12:49:11 +1200
Subject: [Buildroot] [PATCH] Add a .gitignore file
Message-ID: <49FEE4470200007000014C15@gwia.alliedtelesyn.co.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 .gitignore |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 .gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..191e148
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,16 @@
+build_*
+project_*
+toolchain_*
+binaries/*
+.auto.deps
+.config.cmd
+.config.old
+package/config/buildroot-config/
+package/config/.depend
+package/config/conf
+package/config/mconf
+package/config/*.o
+package/config/lex.zconf.c
+package/config/lxdialog/*.o
+package/config/zconf.hash.c
+package/config/zconf.tab.c
-- 
1.5.6

NOTICE: This message contains privileged and confidential
information intended only for the use of the addressee
named above. If you are not the intended recipient of
this message you are hereby notified that you must not
disseminate, copy or take any action in reliance on it.
If you have received this message in error please
notify Allied Telesis Labs Ltd immediately.
Any views expressed in this message are those of the
individual sender, except where the sender has the
authority to issue and specifically states them to
be the views of Allied Telesis Labs.
