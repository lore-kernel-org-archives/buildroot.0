From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  1 Jan 2015 17:50:47 +0100
Subject: [Buildroot] [PATCH 0/2 v8] Improve silent builds (branch
	yem/fabio/silent)
Message-ID: <cover.1420130984.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This patch set improves silent builds.

Silent builds are also nice when top-level parallel make is being used
to reduce the output clutter.

Changes v7 -> v8:
  - simply by just consigning stdout to oblivion  (Yann)

Regards,
Yann E. MORIN.


The following changes since commit b7e7b417fa1210a7f9c4e76ee747238981dcd012:

  wpa_supplicant: fix indentation and change file permissions (2015-01-01 11:31:14 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/fabio/silent

for you to fetch changes up to 70490271dbf1774e87cc5dab1a5e907105afeb62:

  pkg-download: silence downloads if make is silent (2015-01-01 17:47:49 +0100)

----------------------------------------------------------------
Fabio Porcedda (2):
      Makefile: improve detection of make "-s" flag
      pkg-download: silence downloads if make is silent

 Makefile                    | 2 +-
 package/pkg-download.mk     | 8 ++++++++
 support/download/dl-wrapper | 3 ++-
 3 files changed, 11 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
