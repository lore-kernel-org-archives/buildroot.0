From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Dec 2013 21:49:25 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem/misc
Message-ID: <cover.1386017298.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are two unrelated changesets:
  - the first reduces the depth of the TOC in the manual
  - the second allows one to only install the required RPi bootloader

Regards,
Yann E. MORIN.


The following changes since commit edce303b8da95a9b19939ab7a4199a39c0483c6f:

  libtasn1: fix botched makeinfo/missing logic (2013-12-02 13:33:02 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/misc

for you to fetch changes up to 631bcb8e1ae930cb7502e1f2840f045bfea776da:

  package/rpi-firmware: only install one firmware file (2013-12-02 21:47:04 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      docs/manual: limit the depth of the TOC in the HTML output
      package/rpi-firmware: only install one firmware file

 docs/manual/manual.mk                |  4 ++--
 package/rpi-firmware/Config.in       | 39 ++++++++++++++++++++++++++++++++++++
 package/rpi-firmware/rpi-firmware.mk |  8 ++------
 3 files changed, 43 insertions(+), 8 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
