From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 20:46:41 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-stringprep: bump to
 version 1.0.17
Message-ID: <20200106201550.3C6FD8EE4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8e3ffad3d9db9bb10e7dacda51faedf8bd862fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-stringprep/erlang-p1-stringprep.hash | 2 +-
 package/erlang-p1-stringprep/erlang-p1-stringprep.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
index 5200d661a8..c9bf4c7067 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 32245561f84b03b9024c8768ad2ac8d67f285a032a7f36ff35a74c77fc701f96 erlang-p1-stringprep-1.0.14.tar.gz
+sha256 119b751f569baecc4d911ff3c2a6a33a042f8d0b2e64445072d1af14ed935fc0 erlang-p1-stringprep-1.0.17.tar.gz
diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
index a05752508c..49ffb77cd3 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_STRINGPREP_VERSION = 1.0.14
+ERLANG_P1_STRINGPREP_VERSION = 1.0.17
 ERLANG_P1_STRINGPREP_SITE = $(call github,processone,stringprep,$(ERLANG_P1_STRINGPREP_VERSION))
 ERLANG_P1_STRINGPREP_LICENSE = TCL (tools/*.tcl), Apache-2.0 (rest)
 ERLANG_P1_STRINGPREP_LICENSE_FILES = LICENSE.ALL LICENSE.TCL LICENSE.txt
