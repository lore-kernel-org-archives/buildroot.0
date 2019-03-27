From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 15:39:22 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/python-aiojobs:
 drop aiohttp dependency
Message-ID: <20190327143607.BC29E81314@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5113a17c334f6815f72db145239ef0dd17782d32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

aiohttp isn't a required dependency for aiojobs

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 53e3860a0e22fca5348a781a5b2e70c19403d172)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-aiojobs/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-aiojobs/Config.in b/package/python-aiojobs/Config.in
index 54d6c02a8e..ab61985164 100644
--- a/package/python-aiojobs/Config.in
+++ b/package/python-aiojobs/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_AIOJOBS
 	bool "python-aiojobs"
 	depends on BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
 	help
 	  Jobs scheduler for managing background task (asyncio).
 
