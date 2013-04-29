From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Apr 2013 22:29:30 +0200
Subject: [Buildroot] [PATCH 0/4] Misc fixes
Message-ID: <1367267374-7512-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a bunch of misc fixes that have been sitting in my private
repository for some time. Three patches fix incorrect dependencies,
one removes trailing spaces.

Best regards,

Thomas

Thomas Petazzoni (4):
  qt, php: selecting mysql requires depending on MMU
  make: undeprecate package as it is used by the uClibc test suite
  system: remove trailing tabs in Config.in file
  Config.in.legacy: fix consistency warning on pthread-stubs option

 Config.in.legacy         |    1 +
 package/make/Config.in   |    6 ++++--
 package/php/Config.ext   |    3 +++
 package/qt/Config.sql.in |    1 +
 system/Config.in         |   16 ++++++++--------
 5 files changed, 17 insertions(+), 10 deletions(-)

-- 
1.7.9.5
