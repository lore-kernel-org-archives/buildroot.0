From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Jun 2013 12:22:27 +0200
Subject: [Buildroot] [PATCH 1/2] libglib2: renumber patches
Message-ID: <1370773348-3346-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{libglib2-optional-ipv6.patch => libglib2-0001-optional-ipv6.patch}   | 0
 ...support.patch => libglib2-0002-fix-build-when-no-thread-support.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/libglib2/{libglib2-optional-ipv6.patch => libglib2-0001-optional-ipv6.patch} (100%)
 rename package/libglib2/{libglib2-0004-fix-build-when-no-thread-support.patch => libglib2-0002-fix-build-when-no-thread-support.patch} (100%)

diff --git a/package/libglib2/libglib2-optional-ipv6.patch b/package/libglib2/libglib2-0001-optional-ipv6.patch
similarity index 100%
rename from package/libglib2/libglib2-optional-ipv6.patch
rename to package/libglib2/libglib2-0001-optional-ipv6.patch
diff --git a/package/libglib2/libglib2-0004-fix-build-when-no-thread-support.patch b/package/libglib2/libglib2-0002-fix-build-when-no-thread-support.patch
similarity index 100%
rename from package/libglib2/libglib2-0004-fix-build-when-no-thread-support.patch
rename to package/libglib2/libglib2-0002-fix-build-when-no-thread-support.patch
-- 
1.8.1.2
