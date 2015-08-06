From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Aug 2015 00:22:06 +0200
Subject: [Buildroot] [git commit] dnsmasq: bump to version 2.75
Message-ID: <20150806222237.6B49981DFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=10c07b9ac19805fcdfcdbd565f25761146fd7e99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: applying for 2015.08, because it fixes a regression
introduced in dnsmasq 2.74, as reported by Gustavo.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dnsmasq/dnsmasq.hash |    2 +-
 package/dnsmasq/dnsmasq.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 370792f..57dc4b1 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	9ed484b9879d63f7a0bc1010562f17d8aaadf4261e9a126299796cb9696d93ba	dnsmasq-2.74.tar.xz
+sha256	640c4e1d4c298e42458419cd78cfc26acc549401b1a34d271cd3e0e4226941f1	dnsmasq-2.75.tar.xz
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 0df33ca..a0db81b 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.74
+DNSMASQ_VERSION = 2.75
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
