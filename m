From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Tue,  5 Aug 2014 14:12:28 +0200
Subject: [Buildroot] [PATCH v2 1/2] dhcpdump: Fix patch file name
Message-ID: <1407240749-17574-1-git-send-email-benoit.thebaudeau@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the naming convention for patches, which is:

	<packagename>-<number>-<description>.patch

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>

---

Changes in v2: New patch
---
 ...on-bsd-structures.patch => dhcpdump-0001-use-non-bsd-structures.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/dhcpdump/{dhcpdump-1.8-use-non-bsd-structures.patch => dhcpdump-0001-use-non-bsd-structures.patch} (100%)

diff --git a/package/dhcpdump/dhcpdump-1.8-use-non-bsd-structures.patch b/package/dhcpdump/dhcpdump-0001-use-non-bsd-structures.patch
similarity index 100%
rename from package/dhcpdump/dhcpdump-1.8-use-non-bsd-structures.patch
rename to package/dhcpdump/dhcpdump-0001-use-non-bsd-structures.patch
-- 
1.9.1
