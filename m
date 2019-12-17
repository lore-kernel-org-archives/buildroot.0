From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 17 Dec 2019 15:37:01 +0100
Subject: [Buildroot] [PATCH 0/3] Microblaze cleanup 3
Message-ID: <20191217143704.51115-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop some workaround since binutils and gcc fixed previous bugs

Giulio Benetti (3):
  package/sqlite: remove workaround when building with gcc version <=
    4.9
  package/libnss: remove ld segfault workaround
  package/kmod: remove ld segfault workaround

 package/kmod/kmod.mk     |  6 ------
 package/libnss/libnss.mk | 10 ----------
 package/sqlite/sqlite.mk |  6 ------
 3 files changed, 22 deletions(-)

-- 
2.20.1
