From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon,  6 Jan 2020 17:10:56 +0100
Subject: [Buildroot] [PATCH 03/22] erlang-eimp: Bump to version 1.0.12
In-Reply-To: <20200106161115.16524-1-johan.oudinet@gmail.com>
References: <20200106161115.16524-1-johan.oudinet@gmail.com>
Message-ID: <20200106161115.16524-4-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-eimp/erlang-eimp.hash | 2 ++
 package/erlang-eimp/erlang-eimp.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/erlang-eimp/erlang-eimp.hash

diff --git a/package/erlang-eimp/erlang-eimp.hash b/package/erlang-eimp/erlang-eimp.hash
new file mode 100644
index 0000000000..2b16ba5e57
--- /dev/null
+++ b/package/erlang-eimp/erlang-eimp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 dfcdc211480f974175af615616c7f8c1e8f9dff5d6be5faa3f20c3eb4c60240e erlang-eimp-1.0.12.tar.gz
diff --git a/package/erlang-eimp/erlang-eimp.mk b/package/erlang-eimp/erlang-eimp.mk
index 83d34cd5e0..c8cea0e429 100644
--- a/package/erlang-eimp/erlang-eimp.mk
+++ b/package/erlang-eimp/erlang-eimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_EIMP_VERSION = 1.0.8
+ERLANG_EIMP_VERSION = 1.0.12
 ERLANG_EIMP_SITE = $(call github,processone,eimp,$(ERLANG_EIMP_VERSION))
 ERLANG_EIMP_LICENSE = Apache-2.0
 ERLANG_EIMP_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
