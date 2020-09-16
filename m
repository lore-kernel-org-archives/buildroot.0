From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Sep 2020 23:11:31 +0200
Subject: [Buildroot] [PATCH 0/3 v4] package/qt5/qt5webengine: fix options
 and dependencies (branch yem/qt5webengine-options)
Message-ID: <cover.1600290685.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a refresh and respin of the commits by Nathan, which got
reviewed by Peter.

I (Yann) merely did the following changes:

 1. refresh on top of master, now that we no longer have a version
    choice for qt5,

 2. split the first patch in two: the first to switch to the new options
    instead of defines, the second to add the missing dependency

As such, I did not carry Peter's review on the first patch, since I
split it.

Note: this is not even build-tested; it's just a refresh-n-respin.


Regards,
Yann E. MORIN.


The following changes since commit e5f92758ff52ff713c9b45a52f4fdb1bfabdfc2f

  package/qt5/qt5webengine: fix build with Bison 3.7 (2020-09-16 22:13:20 +0200)


are available in the git repository at:

  https://git.busybox.net/~ymorin/git/buildroot

for you to fetch changes up to 6efc39e9d97769fae93be2bcb91f56b050dda219

  package/qt5/qt5webengine: fix build dependencies for autodetected packages (2020-09-16 23:01:16 +0200)


----------------------------------------------------------------
Nathan Ford (3):
      package/qt5/qt5webengine: fix ffmpeg/codec/alsa option handling for latest
      package/qt5/qt5webengine: ffmpeg supports needs webp mux
      package/qt5/qt5webengine: fix build dependencies for autodetected packages

 package/qt5/qt5webengine/Config.in       |  1 +
 package/qt5/qt5webengine/qt5webengine.mk | 34 +++++++++++++++++++++++++++++---
 2 files changed, 32 insertions(+), 3 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
