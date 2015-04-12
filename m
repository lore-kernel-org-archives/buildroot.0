From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 14:42:09 +0200
Subject: [Buildroot] [PATCH 0/2 v2 autobuilders] buildroot-test: misc
	enhancenments (branch yem/reproduce)
Message-ID: <cover.1428842444.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series fixes the br-reproduce script wrt. the URLs accepted
by the server.

Changes v1 -> v2:
  - fix ugly POSIX shell syntax in favour of readable bashism  (Thomas)
  - fix quoting  (Thomas)


Regards,
Yann E. MORIN.


The following changes since commit a7226db951d7e542b8a6b9b13e94a29a22879aff:

  autbuild-run: fix legal-info (2015-04-06 23:17:13 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot-test yem/reproduce

for you to fetch changes up to 4ec90d83a1df3ac770250375cbd7617dc2b6fe63:

  br-reproduce-build: fix URL of gitid (2015-04-12 14:40:24 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      br-reproduce-build: quote variables
      br-reproduce-build: fix URL of gitid

 utils/br-reproduce-build | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
