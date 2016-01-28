From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2016 22:30:15 +0100
Subject: [Buildroot] [git commit] package/python-mako: bump version to 1.0.3,
	add hash
Message-ID: <20160201224700.992677F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d044efccf9a3f386564e46b20bb7cdb079a6915
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-mako/python-mako.hash | 4 ++++
 package/python-mako/python-mako.mk   | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
new file mode 100644
index 0000000..374be1a
--- /dev/null
+++ b/package/python-mako/python-mako.hash
@@ -0,0 +1,4 @@
+# From https://pypi.python.org/pypi/Mako/1.0.3
+md5	a78f20f6366a8a0659ce5532f8614e53	Mako-1.0.3.tar.gz
+# Locally computed
+sha256	7644bc0ee35965d2e146dde31827b8982ed70a58281085fac42869a09764d38c	Mako-1.0.3.tar.gz
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 398b8d2..52679e0 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_MAKO_VERSION = 1.0.1
+PYTHON_MAKO_VERSION = 1.0.3
 PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
 PYTHON_MAKO_SITE = https://pypi.python.org/packages/source/M/Mako
 PYTHON_MAKO_SETUP_TYPE = setuptools
