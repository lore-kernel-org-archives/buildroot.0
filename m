From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 May 2015 17:37:36 +0200
Subject: [Buildroot] [PATCH 0/2 v2] manual: some hashes-related
	clarifications (branch yem/manual)
Message-ID: <cover.1430667367.git.yann.morin.1998@free.fr>
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


Changes v1 -> v2:
  - fix merge-gone-wild  (Arnout)
  - clarify and clean-up what hash we prefer  (Arnout)
  - typoes  (Arnout)


Regards,
Yann E. MORIN.


The following changes since commit e2d3e1de84fa4a6f9af997d064fa1bcbdddc3ff2:

  poppler: help finding libtiff in static linking scenarios (2015-05-03 16:33:46 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/manual

for you to fetch changes up to 65108fc814c42059f26b7690ccd505c0ebb6afb5:

  manual: Add notes about GitHub and hashes (2015-05-03 17:10:55 +0200)

----------------------------------------------------------------
Maxime Hadjinlian (1):
      manual: Add notes about GitHub and hashes

Yann E. MORIN (1):
      docs/manual: also document md5 hash

 docs/manual/adding-packages-directory.txt | 36 +++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 11 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
