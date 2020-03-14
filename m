From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 23:38:08 +0100
Subject: [Buildroot] [git commit branch/2019.11.x]
 package/python-setuptools-scm-git-archive: depends on python-setuptools-scm
Message-ID: <20200315082329.C4FB083CA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65640e1d275d9fd7fe74afb135d446b6ba5cc9ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

python-setuptools-scm-git-archive requires python-setuptools-scm package so
add it to its dependencies.

Fixes:
http://autobuild.buildroot.net/results/b356c948cf2b22534ca333cfe34dee31371c0007

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5075afc87b7eb45c6f347e2bdd0f87bc4f9597c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../python-setuptools-scm-git-archive.mk                                 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
index 1c18095f54..032e2d3fc9 100644
--- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
+++ b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
@@ -10,5 +10,6 @@ PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SITE = https://files.pythonhosted.org/packages
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE_FILES = LICENSE
+HOST_PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(host-python-package))
