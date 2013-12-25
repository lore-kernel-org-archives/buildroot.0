From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 12:29:10 +0100
Subject: [Buildroot] [git commit] python-bottle: add missing dependency on
	python
Message-ID: <20131225113133.B009C9C1C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e6716137f7e05bb60bd52928a43587d198ddc78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-bottle/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/python-bottle/Config.in b/package/python-bottle/Config.in
index f9b60ca..07f490c 100644
--- a/package/python-bottle/Config.in
+++ b/package/python-bottle/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_BOTTLE
 	bool "python-bottle"
+	depends on BR2_PACKAGE_PYTHON
 	help
 	  Bottle is a fast, simple and lightweight WSGI micro web-framework
 	  for Python. It is distributed as a single file module and has no
