From: kiwi <gregd72002@gmail.com>
Date: Tue,  9 Dec 2014 21:23:28 +0000
Subject: [Buildroot] [PATCH 8/8] Adding entries to Config.in and
	Config.in.host
In-Reply-To: <1418160208-1569-1-git-send-email-gregd72002@gmail.com>
References: <1418160208-1569-1-git-send-email-gregd72002@gmail.com>
Message-ID: <1418160208-1569-8-git-send-email-gregd72002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gregory Dymarek <gregd72002@gmail.com>

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
---
 package/Config.in      | 7 +++++++
 package/Config.in.host | 1 +
 2 files changed, 8 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index dd3a46e..f3af26c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -115,6 +115,7 @@ endif
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/gawk/Config.in"
 endif
+	source "package/gengetopt/Config.in"
 	source "package/gettext/Config.in"
 	source "package/git/Config.in"
 	source "package/gperf/Config.in"
@@ -821,6 +822,7 @@ menu "Networking"
 	source "package/libmnl/Config.in"
 	source "package/libmodbus/Config.in"
 	source "package/libndp/Config.in"
+	source "package/libnice/Config.in"
 	source "package/libnetfilter_acct/Config.in"
 	source "package/libnetfilter_conntrack/Config.in"
 	source "package/libnetfilter_cthelper/Config.in"
@@ -839,6 +841,7 @@ menu "Networking"
 	source "package/libshairplay/Config.in"
 	source "package/libshout/Config.in"
 	source "package/libsoup/Config.in"
+	source "package/libsrtp/Config.in"
 	source "package/libstrophe/Config.in"
 	source "package/libtirpc/Config.in"
 	source "package/libtorrent/Config.in"
@@ -846,6 +849,7 @@ menu "Networking"
 	source "package/libupnpp/Config.in"
 	source "package/liburiparser/Config.in"
 	source "package/libvncserver/Config.in"
+	source "package/libwebsock/Config.in"
 	source "package/libwebsockets/Config.in"
 	source "package/neon/Config.in"
 	source "package/nss-mdns/Config.in"
@@ -856,6 +860,7 @@ menu "Networking"
 	source "package/rtmpdump/Config.in"
 	source "package/slirp/Config.in"
 	source "package/snmppp/Config.in"
+	source "package/sofia-sip/Config.in"
 	source "package/thrift/Config.in"
 	source "package/usbredir/Config.in"
 	source "package/wvstreams/Config.in"
@@ -874,6 +879,7 @@ menu "Other"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
 	source "package/cppcms/Config.in"
+	source "package/ding-libs/Config.in"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
 	source "package/fftw/Config.in"
@@ -1047,6 +1053,7 @@ endif
 	source "package/iptraf-ng/Config.in"
 	source "package/iputils/Config.in"
 	source "package/iw/Config.in"
+	source "package/janus-gateway/Config.in"
 	source "package/kismet/Config.in"
 	source "package/knock/Config.in"
 	source "package/leafnode2/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 0b7bc36..dd89bd3 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -8,6 +8,7 @@ menu "Host utilities"
 	source "package/e2tools/Config.in.host"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
+	source "package/gengetopt/Config.in.host"
 	source "package/genpart/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/mke2img/Config.in.host"
-- 
1.9.1
