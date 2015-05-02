From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  2 May 2015 23:22:35 +0200
Subject: [Buildroot] [PATCH 0/2] manual: some hashes-related clarifications
	(branch yem/manual)
Message-ID: <cover.1430601733.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small, long-overdue series adds some clarifications about the use
of hashes:
  - first, md5 hashes are documented
  - second, a note explains when adding hashes for GitHub-hosted
    packages

Regards,
Yann E. MORIN.


The following changes since commit 4fe0183c5076169b4be739bcb652ebd05e35cb79:

  sdl_sound: add patch to remove -Werror when --enable-debug is passed (2015-05-02 20:09:52 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/manual

for you to fetch changes up to 26c36e7fe8e11d2c3a75414a75daab0a65c59784:

  manual: Add notes about GitHub and hashes (2015-05-02 23:19:03 +0200)

----------------------------------------------------------------
Maxime Hadjinlian (1):
      manual: Add notes about GitHub and hashes

Yann E. MORIN (1):
      docs/manual: also document md5 hash

 docs/manual/adding-packages-directory.txt | 35 ++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 10 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
