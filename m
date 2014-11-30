From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:13:06 +0100
Subject: [Buildroot] [git commit branch/next] package/flac: Rename patch
Message-ID: <20141130141317.BDA257FFBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=506bff595ec5a23713de5512f234bef7dffd6cfe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

*.txt are not recognized as patches.
This patch also fixes build with BR2_DEBUG_2=y.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...nfigure-don-t-try-to-unset-g-from-CFLAGS.patch} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.txt b/package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.patch
similarity index 100%
rename from package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.txt
rename to package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.patch
