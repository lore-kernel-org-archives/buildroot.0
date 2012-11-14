From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:37:24 +0100
Subject: [Buildroot] [git commit] python: add license info
Message-ID: <20121114214734.780BE99B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f38c572204014bd67c3ffe165397bea2f678370e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python/python.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index fae4e5c..87237bb 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -7,6 +7,8 @@ PYTHON_VERSION_MAJOR = 2.7
 PYTHON_VERSION       = $(PYTHON_VERSION_MAJOR).2
 PYTHON_SOURCE        = Python-$(PYTHON_VERSION).tar.bz2
 PYTHON_SITE          = http://python.org/ftp/python/$(PYTHON_VERSION)
+PYTHON_LICENSE       = Python software foundation license v2, others
+PYTHON_LICENSE_FILES = LICENSE
 
 # Python needs itself and a "pgen" program to build itself, both being
 # provided in the Python sources. So in order to cross-compile Python,
