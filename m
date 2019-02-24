From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Feb 2019 22:09:48 +0100
Subject: [Buildroot] [git commit branch/next] package/flatbuffers: bump to
 version 1.10.0
Message-ID: <20190224210740.CAD7A8DED0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db710397afd052e3aebbd00ba11e777475c15d83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Micha??l Blanc <mika.blanc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flatbuffers/flatbuffers.hash | 2 +-
 package/flatbuffers/flatbuffers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
index a8f23f4ef9..7afe849cd7 100644
--- a/package/flatbuffers/flatbuffers.hash
+++ b/package/flatbuffers/flatbuffers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	5ca5491e4260cacae30f1a5786d109230db3f3a6e5a0eb45d0d0608293d247e3	flatbuffers-v1.9.0.tar.gz
+sha256	3714e3db8c51e43028e10ad7adffb9a36fc4aa5b1a363c2d0c4303dd1be59a7c	flatbuffers-v1.10.0.tar.gz
 sha256	7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3	LICENSE.txt
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 26d9307892..69054885ea 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLATBUFFERS_VERSION = v1.9.0
+FLATBUFFERS_VERSION = v1.10.0
 FLATBUFFERS_SITE = $(call github,google,flatbuffers,$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
 FLATBUFFERS_LICENSE_FILES = LICENSE.txt
