From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  5 Sep 2017 21:42:49 +0200
Subject: [Buildroot] [PATCH 0/2] docs/manual: add appendix about migratinf
	from older versions
Message-ID: <cover.1504640557.git.yann.morin.1998@free.fr>
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


Regards,
Yann E. MORIN.


The following changes since commit c96b8675ea03a5d3194d439f740c725dd239ed1a

  support/scripts/check-bin-arch: ignore symbolic links (2017-09-04 16:01:51 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 027bc1ba0e0b06cd2e353ef8683084b6f9fec926

  docs/manual: add appendix about $(HOST_DIR)/usr (2017-09-05 21:41:18 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      docs/manual: add appendis about migration from older versions
      docs/manual: add appendix about $(HOST_DIR)/usr

 docs/manual/appendix.txt                                   |  2 +-
 ...-external-converting.txt => migrating-br2-external.txt} |  2 +-
 docs/manual/migrating-host-usr.txt                         | 14 ++++++++++++++
 docs/manual/migrating.txt                                  |  8 ++++++++
 4 files changed, 24 insertions(+), 2 deletions(-)
 rename docs/manual/{br2-external-converting.txt => migrating-br2-external.txt} (96%)
 create mode 100644 docs/manual/migrating-host-usr.txt
 create mode 100644 docs/manual/migrating.txt

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
