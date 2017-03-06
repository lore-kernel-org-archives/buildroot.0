From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  6 Mar 2017 20:35:12 +0100
Subject: [Buildroot] [PATCH 2/2] package/dovecot-pigeonhole: bump version to
	0.4.17
In-Reply-To: <20170306193512.4916-1-bernd.kuhls@t-online.de>
References: <20170306193512.4916-1-bernd.kuhls@t-online.de>
Message-ID: <20170306193512.4916-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 95325a95d..7898ff8ac 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,2 +1,2 @@
 # Locally computed after checking signature
-sha256 8f0b98f18062d6e241eef74ebe16cc167cd246361cbe6657d94f0ecc5d7d3234  dovecot-2.2-pigeonhole-0.4.16.tar.gz
+sha256 74d869c7532cbf4fe41e3cc95a1aa6ce32e98f4d423f0d099da1e0fba022dae3  dovecot-2.2-pigeonhole-0.4.17.tar.gz
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 846e7f97d..1b5185f6d 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.4.16
+DOVECOT_PIGEONHOLE_VERSION = 0.4.17
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
 DOVECOT_PIGEONHOLE_LICENSE = LGPLv2.1
-- 
2.11.0
