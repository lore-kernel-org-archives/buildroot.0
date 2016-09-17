From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
Date: Sat, 17 Sep 2016 19:47:35 +0900
Subject: [Buildroot] [PATCH] php: bump 7.0.11
In-Reply-To: <20160917112112.53a0e5cf@free-electrons.com>
References: <CANqewP0UNjM_Ya=awwHEC+H3+h8UH=DLFv9YoTihOw_sK4Ld9g@mail.gmail.com>
 <20160916184113.6fd787c1@free-electrons.com>
 <CANqewP2HZviH=vUGPu4JDrOKgpTjXx9BuVbO23PiM5u27+t5OA@mail.gmail.com>
 <20160917112112.53a0e5cf@free-electrons.com>
Message-ID: <CANqewP23eGWuVfSWh-KOUUV7rUwXvqH8uGQ7fCn875fKh2GOaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 6e146f8..0092095 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256 970c322ba3e472cb0264b8ba9d4d92e87918da5d0cca53c4aba2a70545b8626d
 php-7.0.9.tar.xz
+sha256 d4cccea8da1d27c11b89386f8b8e95692ad3356610d571253d00ca67d524c735
 php-7.0.11.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 7df10be..083b451 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-PHP_VERSION = 7.0.9
+PHP_VERSION = 7.0.11
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.9.3


v3, I think it's finally proper, sending in plain text.
