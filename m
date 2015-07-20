From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 22:49:51 +0200
Subject: [Buildroot] [git commit] package/ulogd: remove autoreconf
Message-ID: <20150720205434.EBEDC81E4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65be5bc30d91f3418b7a1b66ba304be762f24574
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Autoreconf is not needed anymore since ulogd 2.0.4
where logd-01-pthread-conditional.patch was removed.

commit: 010745a955b6cf4c979588fafdb7506460038e0f

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ulogd/ulogd.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 7ff5b73..7730198 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -8,7 +8,6 @@ ULOGD_VERSION = 2.0.5
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
 ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
 ULOGD_CONF_OPTS = --with-dbi=no --with-pgsql=no
-ULOGD_AUTORECONF = YES
 ULOGD_DEPENDENCIES = host-pkgconf \
 	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
 	libnfnetlink
