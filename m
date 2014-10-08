From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Oct 2014 10:19:48 -0300
Subject: [Buildroot] [PATCH 4/5] procps-ng: bump to version 3.3.10
In-Reply-To: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1412774389-11297-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/procps-ng/procps-ng.hash | 3 +++
 package/procps-ng/procps-ng.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/procps-ng/procps-ng.hash

diff --git a/package/procps-ng/procps-ng.hash b/package/procps-ng/procps-ng.hash
new file mode 100644
index 0000000..e011356
--- /dev/null
+++ b/package/procps-ng/procps-ng.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/procps-ng/files/Production/
+md5	1fb7f3f6bf92ce6c5c9ed9949ae858fe	procps-ng-3.3.10.tar.xz
+sha1	484db198d6a18a42b4011d5ecb2cb784a81b0e4f	procps-ng-3.3.10.tar.xz
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index d82db76..71e32dd 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROCPS_NG_VERSION = 3.3.9
+PROCPS_NG_VERSION = 3.3.10
 PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
 PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
 PROCPS_NG_LICENSE = GPLv2+, libproc and libps LGPLv2+
-- 
2.0.4
