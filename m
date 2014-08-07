From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Aug 2014 22:18:58 +0200
Subject: [Buildroot] [git commit] dhcpdump: Fix patch file name
Message-ID: <20140807202212.E940B9D3D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc6b399366bcdfa7432ec5d10865753ad24b0a1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the naming convention for patches, which is:

	<packagename>-<number>-<description>.patch

Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau@advansee.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ... => dhcpdump-0001-use-non-bsd-structures.patch} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/dhcpdump/dhcpdump-1.8-use-non-bsd-structures.patch b/package/dhcpdump/dhcpdump-0001-use-non-bsd-structures.patch
similarity index 100%
rename from package/dhcpdump/dhcpdump-1.8-use-non-bsd-structures.patch
rename to package/dhcpdump/dhcpdump-0001-use-non-bsd-structures.patch
