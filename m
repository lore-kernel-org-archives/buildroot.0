From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:57 +0100
Subject: [Buildroot] [PATCH 23/30] python: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-23-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python/python.mk |    2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.7.10.4
