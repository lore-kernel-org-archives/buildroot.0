From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 26 Jul 2020 02:53:31 +0200
Subject: [Buildroot] [PATCH 0/2] package/libnss and libnspr version bump
Message-ID: <20200726005333.340972-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

this patchset bump NSPR and NSS version. NSS 3.55 requires NSPR 4.27 so
these 2 patches must be applied subsequently.

I've already built with utils/test-pkg -p libnss and the main 6 builds
were OK.

Giulio Benetti (2):
  package/libnspr: bump version to 4.27
  package/libnss: bump version to 3.55

 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 package/libnss/libnss.hash   | 4 ++--
 package/libnss/libnss.mk     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.1
