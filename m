From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 22 Jan 2015 14:17:46 -0300
Subject: [Buildroot] [PATCH 2/2] php: rename patches to new naming convention
In-Reply-To: <1421947066-25455-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421947066-25455-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1421947066-25455-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/{php-01-no-iconv-search.patch => 0001-no-iconv-search.patch} | 0
 package/php/{php-02-dlopen.patch => 0002-dlopen.patch}                   | 0
 package/php/{php-03-disable-pharcmd.patch => 0003-disable-pharcmd.patch} | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename package/php/{php-01-no-iconv-search.patch => 0001-no-iconv-search.patch} (100%)
 rename package/php/{php-02-dlopen.patch => 0002-dlopen.patch} (100%)
 rename package/php/{php-03-disable-pharcmd.patch => 0003-disable-pharcmd.patch} (100%)

diff --git a/package/php/php-01-no-iconv-search.patch b/package/php/0001-no-iconv-search.patch
similarity index 100%
rename from package/php/php-01-no-iconv-search.patch
rename to package/php/0001-no-iconv-search.patch
diff --git a/package/php/php-02-dlopen.patch b/package/php/0002-dlopen.patch
similarity index 100%
rename from package/php/php-02-dlopen.patch
rename to package/php/0002-dlopen.patch
diff --git a/package/php/php-03-disable-pharcmd.patch b/package/php/0003-disable-pharcmd.patch
similarity index 100%
rename from package/php/php-03-disable-pharcmd.patch
rename to package/php/0003-disable-pharcmd.patch
-- 
2.0.5
