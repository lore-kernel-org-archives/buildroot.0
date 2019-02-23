From: Thomas Huth <huth@tuxfamily.org>
Date: Sat, 23 Feb 2019 21:56:54 +0100
Subject: [Buildroot] [PATCH 0/3] Some more games: XorCurses,
 ASCII-Invaders and Frotz
Message-ID: <20190223205657.18394-1-huth@tuxfamily.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody!
This is my first patch contribution to the buildroot project ...
I used buildroot for building most of the images for he QEMU advent
calendar 2018 (see https://www.qemu-advent-calendar.org/2018/ ).
That would not have been possible without buildroot, so thanks a lot
for this great build environment!

Anyway, I've now gone through the package files that I've written
for that project, and I think some of them might maybe be interesting
for integrating them into the official buildroot tree, too. Please
have a look at the following patches, and let me know what you think.
(I also got some more package files on my hard disk, but they need some
more polishing, so I would like to get some feedback on these three
patches first)

Thomas Huth (3):
  package/xorcurses: new package
  package/ascii-invaders: new package
  package/frotz: new package

 package/Config.in                          |  3 ++
 package/ascii-invaders/Config.in           |  5 ++++
 package/ascii-invaders/ascii-invaders.hash |  2 ++
 package/ascii-invaders/ascii-invaders.mk   | 23 ++++++++++++++++
 package/frotz/Config.in                    |  7 +++++
 package/frotz/frotz.hash                   |  2 ++
 package/frotz/frotz.mk                     | 32 ++++++++++++++++++++++
 package/xorcurses/Config.in                | 13 +++++++++
 package/xorcurses/xorcurses.hash           |  2 ++
 package/xorcurses/xorcurses.mk             | 25 +++++++++++++++++
 10 files changed, 114 insertions(+)
 create mode 100644 package/ascii-invaders/Config.in
 create mode 100644 package/ascii-invaders/ascii-invaders.hash
 create mode 100644 package/ascii-invaders/ascii-invaders.mk
 create mode 100644 package/frotz/Config.in
 create mode 100644 package/frotz/frotz.hash
 create mode 100644 package/frotz/frotz.mk
 create mode 100644 package/xorcurses/Config.in
 create mode 100644 package/xorcurses/xorcurses.hash
 create mode 100644 package/xorcurses/xorcurses.mk

-- 
2.17.2
