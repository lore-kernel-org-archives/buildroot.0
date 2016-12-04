From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Dec 2016 10:21:53 +0100
Subject: [Buildroot] [PATCH 0/2] toolchain/wrapper: some cleanups
Message-ID: <cover.1480843290.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series brings a little bit of cleanups in the toolchain
wrapper, with no functional change.


Regards,
Yann E. MORIN.


The following changes since commit 0904b80b47245cf85d414f78c381b9cf61c6ef4b

  cmake: pass HOST_CONFIGURE_OPTS at configure time (2016-12-03 16:24:23 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to fdbfb69d6d7d7ee1b1473ac2562fbf69df49dbb8

  toolchain/wrapper: use the {str,len} tuples for the unsafe paths (2016-12-04 10:08:04 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      toolchain/wrapper: make the {str,len} tuple more generic, add comments
      toolchain/wrapper: use the {str,len} tuples for the unsafe paths

 toolchain/toolchain-wrapper.c | 58 ++++++++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 20 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
