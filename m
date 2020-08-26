From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 27 Aug 2020 01:25:40 +0200
Subject: [Buildroot] [PATCH 0/2] libnss version bump
Message-ID: <20200826232542.920792-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset allow libnss version update. As stated in NSS Release Notes,
NSS 3.56 requires NSPR version >= 4.28, so let's update libnspr too.

Giulio Benetti (2):
  package/libnspr: bump version to 4.28
  package/libnss: bump version to 3.56

 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 package/libnss/libnss.hash   | 4 ++--
 package/libnss/libnss.mk     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.1
