From: =?UTF-8?q?Marcelo=20Guti=C3=A9rrez?= <kuyurix@gmail.com>
Date: Tue, 21 Jan 2014 14:10:06 +0000
Subject: [Buildroot] [PATCH 2/3] rename the patches so they have a number
Message-ID: <1390313407-3495-2-git-send-email-kuyurix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename patches to add sequence numbers

Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>
---
 .../{mysql-ac_cache_check.patch => mysql-0000-ac_cache_check.patch}    |    0
 ...-ps-cache-check.patch => mysql-0001-configure-ps-cache-check.patch} |    0
 ...ew-readline-iface.patch => mysql-0002-use-new-readline-iface.patch} |    0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename package/mysql/{mysql-ac_cache_check.patch => mysql-0000-ac_cache_check.patch} (100%)
 rename package/mysql/{mysql-configure-ps-cache-check.patch => mysql-0001-configure-ps-cache-check.patch} (100%)
 rename package/mysql/{mysql-use-new-readline-iface.patch => mysql-0002-use-new-readline-iface.patch} (100%)

diff --git a/package/mysql/mysql-ac_cache_check.patch b/package/mysql/mysql-0000-ac_cache_check.patch
similarity index 100%
rename from package/mysql/mysql-ac_cache_check.patch
rename to package/mysql/mysql-0000-ac_cache_check.patch
diff --git a/package/mysql/mysql-configure-ps-cache-check.patch b/package/mysql/mysql-0001-configure-ps-cache-check.patch
similarity index 100%
rename from package/mysql/mysql-configure-ps-cache-check.patch
rename to package/mysql/mysql-0001-configure-ps-cache-check.patch
diff --git a/package/mysql/mysql-use-new-readline-iface.patch b/package/mysql/mysql-0002-use-new-readline-iface.patch
similarity index 100%
rename from package/mysql/mysql-use-new-readline-iface.patch
rename to package/mysql/mysql-0002-use-new-readline-iface.patch
-- 
1.7.10.4
