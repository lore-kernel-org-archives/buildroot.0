From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Tue,  1 Aug 2017 16:42:59 -0700
Subject: [Buildroot] [PATCH 0/2] update GCC graphite support
Message-ID: <20170801234301.23840-1-yurovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current ISL prevents building GCC 7.X with graphite. Update ISL to
version 0.18 which works with GCC 5.X through 7.X and mark graphite as
unsupported for GCC 4.X. Addesses bug 10091.

Andrey Yurovsky (2):
  gcc: support grahite for GCC 5 or above
  isl: bump to version 0.18

 package/gcc/Config.in.host | 4 ++++
 package/gcc/gcc.mk         | 9 +++------
 package/isl/isl.hash       | 2 +-
 package/isl/isl.mk         | 5 +----
 4 files changed, 9 insertions(+), 11 deletions(-)

-- 
2.13.3
