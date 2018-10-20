From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 20 Oct 2018 22:07:31 +0300
Subject: [Buildroot] [PATCH v2 1/1] DEVELOPERS: add myself for python*
Message-ID: <20181020190731.5506-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

---
v1->v2: following Yegor suggestion, the patch was updated
for python* instead of the long list of python packages.
---
 DEVELOPERS | 37 +------------------------------------
 1 file changed, 1 insertion(+), 36 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 17db96aa62..ae73a2d38a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -200,42 +200,7 @@ F:	package/stress/
 
 N:	Asaf Kahlon <asafka7@gmail.com>
 F:	package/libuv/
-F:	package/python-attrs/
-F:	package/python-bcrypt/
-F:	package/python-bitstring/
-F:	package/python-constantly/
-F:	package/python-engineio/
-F:	package/python-fire/
-F:	package/python-h2/
-F:	package/python-idna/
-F:	package/python-incremental/
-F:	package/python-jinja2/
-F:	package/python-jsonmodels/
-F:	package/python-logbook/
-F:	package/python-lxml/
-F:	package/python-paramiko/
-F:	package/python-passlib/
-F:	package/python-ply/
-F:	package/python-priority/
-F:	package/python-py/
-F:	package/python-pyasn1/
-F:	package/python-pyasn1-modules/
-F:	package/python-pycryptodomex/
-F:	package/python-pyhamcrest/
-F:	package/python-pyopenssl/
-F:	package/python-pyqrcode/
-F:	package/python-pyroute2/
-F:	package/python-pysmi/
-F:	package/python-pytz/
-F:	package/python-reentry/
-F:	package/python-sdnotify/
-F:	package/python-subprocess32/
-F:	package/python-txtorcon/
-F:	package/python-twisted/
-F:	package/python-u-msgpack/
-F:	package/python-ubjson/
-F:	package/python-yieldfrom/
-F:	package/python-zope-interface/
+F:	package/python*
 F:	package/zeromq/
 
 N:	Ash Charles <ash.charles@savoirfairelinux.com>
-- 
2.17.1
