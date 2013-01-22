From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Jan 2013 10:35:47 -0300
Subject: [Buildroot] [PATCH 2/8] bind: add license information
In-Reply-To: <1358861753-5990-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358861753-5990-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358861753-5990-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/bind.mk | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.7.12.4
