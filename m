From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 21:35:26 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/pkg-python.mk:
 fixup typo, PYTHON#_PATH --> PHYON3_PATH
Message-ID: <20200715195254.3B9E48716A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbcd8460b9306d8c31862013be36b7b0ef9ba093
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Brock.Zheng <goodmenzy@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 54b57cf27107a80a626b28ab79fd4138aebfcee9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-python.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 31b53e281b..59a48e5a87 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -23,7 +23,7 @@
 # basename does not evaluate if a file exists, so we must check to ensure
 # the _sysconfigdata__linux_*.py file exists. The "|| true" is added to return
 # an empty string if the file does not exist.
-PKG_PYTHON_SYSCONFIGDATA_PATH = $(PYTHON#_PATH)/_sysconfigdata__linux_*.py
+PKG_PYTHON_SYSCONFIGDATA_PATH = $(PYTHON3_PATH)/_sysconfigdata__linux_*.py
 PKG_PYTHON_SYSCONFIGDATA_NAME = `{ [ -e $(PKG_PYTHON_SYSCONFIGDATA_PATH) ] && basename $(PKG_PYTHON_SYSCONFIGDATA_PATH) .py; } || true`
 
 # Target distutils-based packages
