From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  9 May 2018 12:28:49 +0200
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: add myself to some packages
Message-ID: <20180509102849.26411-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add myself to lcms2, liblockfile, libnetfilter_conntrack,
libnetfilter_queue and whois

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3ddb292894..f085261ac2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -677,6 +677,7 @@ F:	package/gupnp-tools/
 F:	package/hiredis/
 F:	package/i2pd/
 F:	package/igd2-for-linux/
+F:	package/lcms2/
 F:	package/lftp/
 F:	package/libcap-ng/
 F:	package/libcdio-paranoia/
@@ -690,8 +691,11 @@ F:	package/libgtk2/
 F:	package/libgtk3/
 F:	package/libidn/
 F:	package/libjpeg/
+F:	package/liblockfile/
 F:	package/libmatroska/
 F:	package/libmpdclient/
+F:	package/libnetfilter_conntrack/
+F:	package/libnetfilter_queue/
 F:	package/libupnp/
 F:	package/libupnp18/
 F:	package/minissdpd/
@@ -703,6 +707,7 @@ F:	package/rygel/
 F:	package/safeclib/
 F:	package/tinycbor/
 F:	package/tinydtls/
+F:	package/whois/
 
 N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
-- 
2.14.1
