From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Jan 2013 23:30:54 +0100
Subject: [Buildroot] [git commit] bind: add license information
Message-ID: <20130128223358.E519E9A86C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=46acbdb58dab9aa0e268a155668794d351630274
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bind/bind.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index bd7e5ed..8a66534 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -7,6 +7,8 @@
 BIND_VERSION = 9.6-ESV-R8
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_MAKE = $(MAKE1)
+BIND_LICENSE = ISC
+BIND_LICENSE_FILES = COPYRIGHT
 BIND_TARGET_SBINS = lwresd named named-checkconf named-checkzone
 BIND_TARGET_SBINS += named-compilezone rndc rndc-confgen dnssec-dsfromkey
 BIND_TARGET_SBINS += dnssec-keyfromlabel dnssec-keygen dnssec-signzone
