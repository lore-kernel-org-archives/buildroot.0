From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 21 Sep 2020 09:44:34 +0200
Subject: [Buildroot] [PATCH 0/2] libnss version bump to 3.57
Message-ID: <20200921074436.213451-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset allow libnss version update. As stated in NSS Release Notes,
NSS 3.57 requires NSPR version >= 4.29, so let's update libnspr too.

Giulio Benetti (2):
  package/libnspr: bump version to 4.29
  package/libnss: bump version to 3.57

 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 package/libnss/libnss.hash   | 4 ++--
 package/libnss/libnss.mk     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.1
