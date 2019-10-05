From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 5 Oct 2019 16:07:26 +0200
Subject: [Buildroot] [git commit] package/python-channels-redis: drop
 unneeded redis dependency
Message-ID: <20191005140253.20F1E88564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eacbb1920156dcfd2f54ba2e07107f0b5f2410ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/3053d6470da905218817a7d9b3945f07d70f8296

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-channels-redis/python-channels-redis.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-channels-redis/python-channels-redis.mk b/package/python-channels-redis/python-channels-redis.mk
index d56f403a7c..4765c1013a 100644
--- a/package/python-channels-redis/python-channels-redis.mk
+++ b/package/python-channels-redis/python-channels-redis.mk
@@ -10,6 +10,5 @@ PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/79/20/896a5
 PYTHON_CHANNELS_REDIS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_REDIS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_REDIS_LICENSE_FILES = LICENSE
-PYTHON_CHANNELS_REDIS_DEPENDENCIES = redis
 
 $(eval $(python-package))
