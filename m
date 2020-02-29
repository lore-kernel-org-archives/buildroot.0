From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 28 Feb 2020 19:22:13 -0700
Subject: [Buildroot] [PATCH 1/1] package/ser2net: bump to version 4.1.2
Message-ID: <20200229022213.36247-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ser2net/ser2net.hash | 6 +++---
 package/ser2net/ser2net.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index 5bd927d7d1..9a61564b0e 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5 44a69f573677d9f2bde87b3611db5817  ser2net-4.1.1.tar.gz
-sha1 502e11c3bee429de6550db459d83c9a0991cfc5c  ser2net-4.1.1.tar.gz
+md5 1a42e9605342fd3d6fa41b48be7f564a  ser2net-4.1.2.tar.gz
+sha1 2a40a94e37d89ca795b3a8f692583c78259383c1  ser2net-4.1.2.tar.gz
 # Locally computed:
-sha256 ad6c8fb34d01be177570323899d840a44c8774399d594595393708162fc61e22  ser2net-4.1.1.tar.gz
+sha256 9bdc33476834bbbdcbfbb77ff8f1b1952fe2e7e19dde7e6f7932cea0cec958c7  ser2net-4.1.2.tar.gz
 sha256 501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 2ea68ccc43..55f82bb2b4 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 4.1.1
+SER2NET_VERSION = 4.1.2
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
-- 
2.20.1
