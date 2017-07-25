From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 24 Jul 2017 21:51:32 -0700
Subject: [Buildroot] [PATCH] python-toml: add host variant of the package
Message-ID: <20170725045132.363-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add host variant of the package to make it availible to custom host
tools that might want to use it.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/python-toml/python-toml.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-toml/python-toml.mk b/package/python-toml/python-toml.mk
index fec113e1c..cd449761b 100644
--- a/package/python-toml/python-toml.mk
+++ b/package/python-toml/python-toml.mk
@@ -11,3 +11,5 @@ PYTHON_TOML_LICENSE = MIT
 PYTHON_TOML_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
+
-- 
2.13.3
