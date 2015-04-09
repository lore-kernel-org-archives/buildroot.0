From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 21:39:22 +0200
Subject: [Buildroot] [git commit] erlang: bump version to 17.5
Message-ID: <20150409194013.17738818A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12c37dbf1ae552bb5f6671a4ce48971439a59f78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This also adds a hash file for the new version.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang/erlang.hash |    2 ++
 package/erlang/erlang.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/erlang/erlang.hash b/package/erlang/erlang.hash
new file mode 100644
index 0000000..2d6a39a
--- /dev/null
+++ b/package/erlang/erlang.hash
@@ -0,0 +1,2 @@
+# From http://www.erlang.org/download/MD5
+md5	346dd0136bf1cc28cebc140e505206bb	otp_src_17.5.tar.gz
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 0c76531..499f62c 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # See note below when updating Erlang
-ERLANG_VERSION = 17.4
+ERLANG_VERSION = 17.5
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
