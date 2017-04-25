From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Apr 2017 21:50:44 +0200
Subject: [Buildroot] [git commit] package/python-json-schema-validator:
	remove Python2 dependency
Message-ID: <20170425195059.44EA7827F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=990bc8b2ad87a413726e81595e31363212455c0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-json-schema-validator supports Python 3, so there's no reason
to limit it to Python 2 only.

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Matthew Carruth <carruthm@gmail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-json-schema-validator/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-json-schema-validator/Config.in b/package/python-json-schema-validator/Config.in
index 6ae1eb1..dbc5328 100644
--- a/package/python-json-schema-validator/Config.in
+++ b/package/python-json-schema-validator/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_JSON_SCHEMA_VALIDATOR
 	bool "python-json-schema-validator"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_VERSIONTOOLS
 	help
 	  JSON Schema Validator
