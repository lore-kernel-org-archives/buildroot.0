From: Karoly Kasza <kaszak@gmail.com>
Date: Wed, 10 Dec 2014 14:14:09 +0100
Subject: [Buildroot] [PATCH 1/1] util-linux: rename patches to follow the
	new name convention
Message-ID: <1418217249-55637-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 ...{util-linux-001-sscanf-no-ms-as.patch => 001-sscanf-no-ms-as.patch} |    0
 ...cation-short-name.patch => 002-program-invocation-short-name.patch} |    0
 ...patch => 003-c.h-define-mkostemp-for-older-version-of-uClibc.patch} |    0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename package/util-linux/{util-linux-001-sscanf-no-ms-as.patch => 001-sscanf-no-ms-as.patch} (100%)
 rename package/util-linux/{util-linux-002-program-invocation-short-name.patch => 002-program-invocation-short-name.patch} (100%)
 rename package/util-linux/{util-linux-003-c.h-define-mkostemp-for-older-version-of-uClibc.patch => 003-c.h-define-mkostemp-for-older-version-of-uClibc.patch} (100%)

diff --git a/package/util-linux/util-linux-001-sscanf-no-ms-as.patch b/package/util-linux/001-sscanf-no-ms-as.patch
similarity index 100%
rename from package/util-linux/util-linux-001-sscanf-no-ms-as.patch
rename to package/util-linux/001-sscanf-no-ms-as.patch
diff --git a/package/util-linux/util-linux-002-program-invocation-short-name.patch b/package/util-linux/002-program-invocation-short-name.patch
similarity index 100%
rename from package/util-linux/util-linux-002-program-invocation-short-name.patch
rename to package/util-linux/002-program-invocation-short-name.patch
diff --git a/package/util-linux/util-linux-003-c.h-define-mkostemp-for-older-version-of-uClibc.patch b/package/util-linux/003-c.h-define-mkostemp-for-older-version-of-uClibc.patch
similarity index 100%
rename from package/util-linux/util-linux-003-c.h-define-mkostemp-for-older-version-of-uClibc.patch
rename to package/util-linux/003-c.h-define-mkostemp-for-older-version-of-uClibc.patch
-- 
1.7.10.4
