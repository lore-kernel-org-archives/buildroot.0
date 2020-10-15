From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 22:58:11 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: remove several packages from
 Adam Duskett
Message-ID: <20201015204654.EAD7C84614@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=173173cb8cd487725ace561b8366dbe679f241a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 50 --------------------------------------------------
 1 file changed, 50 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 79a9eaa563..53852ad4fc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -27,74 +27,24 @@
 #   modify packages that use this infrastructure.
 
 N:	Adam Duskett <aduskett@gmail.com>
-F:	package/audit/
-F:	package/busybox/
-F:	package/checkpolicy/
-F:	package/cppdb/
 F:	package/gobject-introspection/
-F:	package/gstreamer1/gstreamer1/
-F:	package/gstreamer1/gstreamer1-mm/
-F:	package/gstreamer1/gst1-plugins-bad/
-F:	package/gstreamer1/gst1-plugins-base/
-F:	package/gstreamer1/gst1-plugins-good/
-F:	package/gstreamer1/gst1-plugins-ugly/
-F:	package/gstreamer1/gst1-python/
-F:	package/gstreamer1/gst1-vaapi/
-F:	package/imx-usb-loader/
 F:	package/janus-gateway/
 F:	package/json-for-modern-cpp/
-F:	package/libabseil-cpp/
-F:	package/libblockdev/
-F:	package/libbytesize/
-F:	package/libcpprestsdk/
-F:	package/libcutl/
-F:	package/libodb/
-F:	package/libodb-pgsql/
 F:	package/libressl/
 F:	package/libselinux/
 F:	package/libsemanage/
 F:	package/libsepol/
-F:	package/libtextstyle/
-F:	package/libwebsockets/
-F:	package/mender-grubenv/
-F:	package/nginx-naxsi/
-F:	package/odb/
 F:	package/openjdk/
 F:	package/openjdk-bin/
-F:	package/php/
-F:	package/pkcs11-helper/
 F:	package/policycoreutils/
 F:	package/prelink-cross/
-F:	package/polkit/
-F:	package/python3/
-F:	package/python-aioredis/
-F:	package/python-asgiref/
-F:	package/python-channels/
-F:	package/python-channels-redis/
-F:	package/python-daphne/
-F:	package/python-django-enumfields/
-F:	package/python-flask-sqlalchemy/
-F:	package/python-gitdb2/
 F:	package/python-gobject/
-F:	package/python-lockfile/
-F:	package/python-mutagen/
-F:	package/python-nested-dict/
-F:	package/python-pbr/
-F:	package/python-pip/
-F:	package/python-psycopg2/
-F:	package/python-smmap2/
-F:	package/python-sqlalchemy/
-F:	package/python-sqlparse/
-F:	package/python-visitor/
 F:	package/restorecond/
 F:	package/refpolicy/
 F:	package/selinux-python/
 F:	package/semodule-utils/
 F:	package/setools/
-F:	package/sngrep/
-F:	package/spidermonkey/
 F:	package/systemd/
-F:	support/testing/tests/package/test_gst1_python.py
 F:	support/testing/tests/package/test_python_gobject.py
 
 N:	Adam Heinrich <adam@adamh.cz>
