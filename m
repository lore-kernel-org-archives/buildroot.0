From: Thomas Huth <huth@tuxfamily.org>
Date: Thu, 12 Sep 2019 20:40:11 +0200
Subject: [Buildroot] [PATCH v2 0/2] Frotz and XorCurses
Message-ID: <20190912184013.17316-1-huth@tuxfamily.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here are two more games, Frotz and XorCurses, that I've used with
buildroot last year ( https://www.qemu-advent-calendar.org/2018/ ).

Thomas Huth (2):
  package/frotz: new package
  package/xorcurses: new package

 DEVELOPERS                       |  1 +
 package/Config.in                |  2 ++
 package/frotz/Config.in          | 10 ++++++++++
 package/frotz/frotz.hash         |  5 +++++
 package/frotz/frotz.mk           | 29 +++++++++++++++++++++++++++++
 package/xorcurses/Config.in      | 11 +++++++++++
 package/xorcurses/xorcurses.hash |  5 +++++
 package/xorcurses/xorcurses.mk   | 25 +++++++++++++++++++++++++
 8 files changed, 88 insertions(+)
 create mode 100644 package/frotz/Config.in
 create mode 100644 package/frotz/frotz.hash
 create mode 100644 package/frotz/frotz.mk
 create mode 100644 package/xorcurses/Config.in
 create mode 100644 package/xorcurses/xorcurses.hash
 create mode 100644 package/xorcurses/xorcurses.mk

-- 
2.21.0
