From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Nov 2019 23:46:39 +0100
Subject: [Buildroot] [git commit branch/next] package/protobuf: bump to
 3.10.1
Message-ID: <20191116223937.7E00B8F079@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da418d33fff3a8e969b145d66f3dae8b0ea492f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index f869691689..edb5fb6f03 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	29a1db3b9bebcf054c540f13400563120ff29fbdd849b2c7a097ffe9d3d508eb  protobuf-cpp-3.9.1.tar.gz
+sha256	e82ee5bdde198e0a1935e280748a86a7989474ea771418a2fd90f03e2e65b99b  protobuf-cpp-3.10.1.tar.gz
 sha256	6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 77b01b5b88..82e21df5f0 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works, as they share the same
 # version/site variables.
-PROTOBUF_VERSION = 3.9.1
+PROTOBUF_VERSION = 3.10.1
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index de47cd28b7..fe883a96df 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	d07934c7e78d424e5f0f2182c2f3bed47214481005b9614a7480d6aaac97e7ef  protobuf-python-3.9.1.tar.gz
+sha256	39c7a5e7e557b24fc324bec3a73054d277ed9b9b320b273564e04f862131e679  protobuf-python-3.10.1.tar.gz
 sha256	6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
