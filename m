From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Mar 2015 19:45:27 +0200
Subject: [Buildroot] [PATCH 0/2] package/nvidia-driver: CUDA can be used
	without X.org (branch yem/nvidia-cuda)
Message-ID: <cover.1427823846.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series allows one to use nvidia-driver to do CUDA without requiring
the X.org stack.

Thanks to Al for reporting the issue and testing the patches out-of-band!
;-)

Regards,
Yann E. MORIN.


The following changes since commit 8ef3745617ca48c683480223fe851eeb72f115ea:

  libgtk3: bump to version 3.14.11 (2015-03-31 14:00:51 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/nvidia-cuda

for you to fetch changes up to c5c6f5405c36249f6d67a8180e8502e17f59e01a:

  package/nvidia-driver: add option to install CUDA MPS server (2015-03-31 19:34:02 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/nvidia-driver: CUDA support does not require X.org
      package/nvidia-driver: add option to install CUDA MPS server

 package/nvidia-driver/Config.in        | 53 ++++++++++++++++++++++++----------
 package/nvidia-driver/nvidia-driver.mk | 29 +++++++++++++------
 2 files changed, 57 insertions(+), 25 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
