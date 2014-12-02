From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  2 Dec 2014 21:42:10 +0100
Subject: [Buildroot] [PATCH 2/2] package/flac: fix patch file extension
In-Reply-To: <1417552930-26836-1-git-send-email-s.martin49@gmail.com>
References: <1417552930-26836-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1417552930-26836-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.org/results/c22/c22f29fd787a3d12d86cc3cd3e2d9c8688d2f65d/
  http://autobuild.buildroot.org/results/1f8/1f824e3aa17fb17e7efe3e4c1636974fea79c1f9/
  http://autobuild.buildroot.org/results/8ad/8ad965fbc19e22d3f43899cb5efb42626fa2f55e/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...m-CFLAGS.txt => 0001-configure-don-t-try-to-unset-g-from-CFLAGS.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/flac/{0001-configure-don-t-try-to-unset-g-from-CFLAGS.txt => 0001-configure-don-t-try-to-unset-g-from-CFLAGS.patch} (100%)

diff --git a/package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.txt b/package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.patch
similarity index 100%
rename from package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.txt
rename to package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.patch
-- 
2.1.3
