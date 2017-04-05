From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  5 Apr 2017 23:20:56 +0200
Subject: [Buildroot] [PATCH 0/3 v2] core/pkg-generic: store package<->files
	for staging and host
Message-ID: <cover.1491427248.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series does for staging and host as we do for target:
store the list of installed files and relate them to the package
that installed each.

---
Changes v1 -> v2:
  - split in three patches
  - in addition to staging, also store for host


Regards,
Yann E. MORIN.


The following changes since commit 4f50f4928ca3855d9d1b1b9699d2cb37e4ca65da

  Add out-of-source U-Boot device tree support (2017-04-05 22:29:23 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 44910f2975b83c91148d08f3df11ea048eea0609

  core/pkg-generic: store file->package list for staging and host too (2017-04-05 23:15:27 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      core/pkg-generic: rmove intermediate file-list files
      core/pk-generic: redirect only wsa when listing package's isntalled files
      core/pkg-generic: store file->package list for staging and host too

 package/pkg-generic.mk | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
