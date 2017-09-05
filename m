From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  5 Sep 2017 22:34:48 +0200
Subject: [Buildroot] [PATCH 0/2 v2] docs/manual: add appendix about
	migratinf from older versions
Message-ID: <cover.1504643670.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

When we release a new version that voluntarliy breaks compatibility with
previous versions, we must document it to hepl the uesr migrate more
easily.

In 2017.08, we broke the compatibility with previous versions because we
no longer accept an RPATH pointing to $(HOST_DIR)/usr/lib, even though
that would technically functional.

Add an appendix about that.

Changes v1 -> v2:
  - move all to a single file  (Thomas)
  - fix typoes  (Thomas)


Regards,
Yann E. MORIN.


The following changes since commit 8e4935586226880b1b6d772cd89f8299f5ffc181

  package/pngquant: bump version to 2.10.1 (2017-09-05 22:01:35 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 8d12cdf3606e18c28219b5e37521aa6facb73605

  docs/manual: add appendix about $(HOST_DIR)/usr (2017-09-05 22:29:44 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      docs/manual: add appendix about migration from older versions
      docs/manual: add appendix about $(HOST_DIR)/usr

 docs/manual/appendix.txt                            |  2 +-
 .../{br2-external-converting.txt => migrating.txt}  | 21 ++++++++++++++++++++-
 2 files changed, 21 insertions(+), 2 deletions(-)
 rename docs/manual/{br2-external-converting.txt => migrating.txt} (62%)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
