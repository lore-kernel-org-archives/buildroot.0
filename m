From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  6 Aug 2014 18:47:48 +0200
Subject: [Buildroot] [PATCH 0/2 v3] Fix git download helper (branch
	yem/download-fixes)
Message-ID: <cover.1407343550.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes the git helper after some fall-overs when the wrapper
was introduced.

Changes v2 -> v3:
  - include initial patch from Peter  (Peter, Rohit)
  - fix the output file name  (Graham)


Regards,
Yann E. MORIN.


The following changes since commit 10b6d10009c70262cfb492b2abaa3a091a8fb4aa:

  espeak: new package (2014-08-04 22:40:45 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/download-fixes

for you to fetch changes up to 2205cccc9b1580208e604067224448da94599151:

  support/download: fix the git helper output file format (2014-08-06 18:33:33 +0200)

----------------------------------------------------------------
Peter Seiderer (1):
      support/download: fix the git helper

Yann E. MORIN (1):
      support/download: fix the git helper output file format

 support/download/git | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
