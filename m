From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 21 Mar 2021 08:59:29 +0100
Subject: [Buildroot] [PATCH 0/2] package/libnss: bump version
Message-ID: <20210321075931.3404471-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset update libnss version as well as libnspr version because
NSS 3.63 requires NSPR 4.30

Giulio Benetti (2):
  package/libnspr: bump version to 4.30
  package/libnss: bump version to 3.63

 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 package/libnss/libnss.hash   | 4 ++--
 package/libnss/libnss.mk     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.1
