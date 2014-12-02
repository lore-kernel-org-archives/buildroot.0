From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 23:58:23 +0100
Subject: [Buildroot] [git commit] python-flask: fix s/flash/flask/
	_DEPENDENCIES typo
Message-ID: <20141202225855.186E980082@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=901642b78f259b29ed57a65aab85c2eed5546a03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-flask/python-flask.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index d7e3d1f..8aa675e 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -10,6 +10,6 @@ PYTHON_FLASK_SITE = http://pypi.python.org/packages/source/F/Flask
 PYTHON_FLASK_SETUP_TYPE = setuptools
 PYTHON_FLASK_LICENSE = BSD-3c
 PYTHON_FLASK_LICENSE_FILES = LICENSE
-PYTHON_FLASH_DEPENDENCIES = python-werkzeug python-jinja2 python-itsdangerous
+PYTHON_FLASK_DEPENDENCIES = python-werkzeug python-jinja2 python-itsdangerous
 
 $(eval $(python-package))
