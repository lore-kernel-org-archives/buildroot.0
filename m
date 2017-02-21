From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Feb 2017 21:32:32 +0100
Subject: [Buildroot] [PATCH 0/2 next] toolchain/wrapper: adhere to
	SOURCE_DATE_EPOCH
Message-ID: <cover.1487709136.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series, for the next branch, re-introduces conformance with
SOURCE_DATE_EPOCH, with a clean-room re-implementation.

The first patch is cherry-picked from master, to remove the previous
implementation, while the second patch actually provides the new
implementation.


Regards,
Yann E. MORIN.


The following changes since commit 9a7ac39605e1bf416db033b009e6c09f54f44fdf

  keepalived: new package (2017-02-20 22:44:08 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 3c4084fc0c3cf518c6fe170bebd83124730eba00

  toolchain/wrapper: fake __DATE_ and __TIME__ for older gcc (2017-02-21 21:31:44 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      Revert "reproducible: fix DATE/TIME macros in toolchain-wrapper"
      toolchain/wrapper: fake __DATE_ and __TIME__ for older gcc

 toolchain/toolchain-wrapper.c | 109 +++++++++++++++++++++---------------------
 1 file changed, 55 insertions(+), 54 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
