From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 13:46:08 +0200
Subject: [Buildroot] [git commit] xerces: add license information
Message-ID: <20140507120710.DAA4A9CA29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7284392853f27e21480a801c46e6266218a568f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xerces/xerces.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 7bd7070..9402abe 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -7,6 +7,8 @@
 XERCES_VERSION = 3.1.1
 XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.gz
 XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources/
+XERCES_LICENSE = Apache-2.0
+XERCES_LICENSE_FILES = LICENSE
 XERCES_MAKE = $(MAKE1)
 XERCES_INSTALL_STAGING = YES
 XERCES_CONF_OPT = --disable-threads \
