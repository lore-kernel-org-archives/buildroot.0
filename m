From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Mar 2015 19:57:23 +0100
Subject: [Buildroot] [PATCH 0/2] linux: fix using extensions (branch
	yem/kernel-ext)
Message-ID: <cover.1426272973.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series is an attempt at fixing the use of extensions, which
somehow broke unnoticeably since we switched to using the kconfig-package
infrastructure for the linux package.

Regards,
Yann E. MORIN.


The following changes since commit 6407a0070ff6ba6626bbbf2e0271c38c88c52a83:

  busybox: enable arp applet (2015-03-12 23:52:12 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/kernel-ext

for you to fetch changes up to 7a6b64928c074474e7577f762550fe60916ed052:

  linux: fix use of extensions (2015-03-13 19:55:21 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      linux: add note about why it's safe to include other .mk files
      linux: fix use of extensions

 linux/linux-ext-fbtft.mk   |  6 ++----
 linux/linux-ext-rtai.mk    |  6 ++----
 linux/linux-ext-xenomai.mk |  6 ++----
 linux/linux.mk             | 15 +++++++++++++++
 4 files changed, 21 insertions(+), 12 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
