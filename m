From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 May 2017 15:40:12 +0200
Subject: [Buildroot] [git commit] python-pytablewriter: bump version to
	0.19.8
Message-ID: <20170601202855.CA51D807D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f317023804642b691775b6791aa484ca9cd1f7fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pytablewriter/python-pytablewriter.hash | 4 ++--
 package/python-pytablewriter/python-pytablewriter.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index 570a7ab..533d21a 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pytablewriter/json, sha256 locally computed
-md5 0f559538d2d40b1f59904b3bf6c66b35  pytablewriter-0.19.7.tar.gz
-sha256 09c841a08cfcecc51e7ffc1846c5200b9f25ef6a3ed82a1a33f714b1c0d9ef94  pytablewriter-0.19.7.tar.gz
+md5 a2d3fe29adc7708ce986646f41c1d229  pytablewriter-0.19.8.tar.gz
+sha256 b76cb1591504ed1dcdc14ccf383806f45e2027bd72d844e545c6a0d18552d46c  pytablewriter-0.19.8.tar.gz
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index 24a4d2e..ddbc17b 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEWRITER_VERSION = 0.19.7
+PYTHON_PYTABLEWRITER_VERSION = 0.19.8
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/2d/5d/02baae4e38413608a77abec5f4ad9a665ba788802e84d7f84cfd9fbe49a2
+PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/9b/89/1883fcd076f40034539f577b033636b20d9a7983a8ba99e9b8ef11b680b2
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
