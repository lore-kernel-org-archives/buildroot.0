From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jan 2014 14:56:23 +0100
Subject: [Buildroot] [PATCH 0/2] linux: do not always depend on host-lzop
Message-ID: <cover.1390744549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here is a small series that makes Linux not always depend on host-lzop.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      packages infra: add function to get a Kconfig option
      linux: only depend on host-lzop if needed

 linux/linux.mk       | 6 +++++-
 package/pkg-utils.mk | 6 ++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
