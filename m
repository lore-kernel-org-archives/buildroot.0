From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Apr 2015 18:48:23 +0200
Subject: [Buildroot] [PATCH 0/6] legal-info: fix packages (branch yem/legal)
Message-ID: <cover.1428252467.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes the 6 packages that have broken legal-info.

Regards,
Yann E. MORIN.


The following changes since commit 6b8e4a7f4a1d7460485374ff6efda0bcb2ec5aa7:

  wvstreams: disable with the ARC external toolchain (2015-04-05 17:35:31 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/legal

for you to fetch changes up to a556182f9ddaca8f73745709a7f748de37b887fb:

  package/linux-firmware: fix legal-info (2015-04-05 18:32:51 +0200)

----------------------------------------------------------------
Yann E. MORIN (6):
      package/liblinear: fix legal-info
      package/python-cherrypy: fix legal-info
      package/zmqpp: fix legal-info
      package/evemu: fix legal-info
      package/gnu-efi: fix legal-info
      package/linux-firmware: fix legal-info

 package/evemu/evemu.mk                     | 2 +-
 package/gnu-efi/gnu-efi.mk                 | 4 ++--
 package/liblinear/liblinear.mk             | 2 +-
 package/linux-firmware/linux-firmware.mk   | 2 +-
 package/python-cherrypy/python-cherrypy.mk | 2 +-
 package/zmqpp/zmqpp.mk                     | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
