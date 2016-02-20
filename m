From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 19:21:23 +0100
Subject: [Buildroot] [git commit branch/next] erlang-p1-tls: indicate
	OpenSSL exception in license info
Message-ID: <20160220182140.520EF7F9FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc681779f6384a2639401c1deee77f0575ccabcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The license of erlang-p1-tls is indeed GPLv2+ as indicated in
ERLANG_P1_TLS_LICENSE, but this GPLv2+ carries an OpenSSL exception,
which allows it to be linked against the OpenSSL library. Therefore,
we update the license information accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-tls/erlang-p1-tls.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
index f7212c4..77f06e6 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.mk
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -6,7 +6,7 @@
 
 ERLANG_P1_TLS_VERSION = 1.0.0
 ERLANG_P1_TLS_SITE = $(call github,processone,tls,$(ERLANG_P1_TLS_VERSION))
-ERLANG_P1_TLS_LICENSE = GPLv2+
+ERLANG_P1_TLS_LICENSE = GPLv2+ with OpenSSL exception
 ERLANG_P1_TLS_LICENSE_FILES = COPYING
 ERLANG_P1_TLS_INSTALL_STAGING = YES
 ERLANG_P1_TLS_DEPENDENCIES = openssl
