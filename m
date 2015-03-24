From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Mar 2015 19:54:12 +0100
Subject: [Buildroot] [PATCH 0/2 v4] enhance root password (branch yem/passwd)
Message-ID: <cover.1427223149.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series allows setting analready-ecoded root pasword. See the commit
log of patch 2/2 for the whole explanation.


Changes v3 -> v4:
  - ditch support for DES-encoded passwords  (Yann)
  - use a single kconfig option to set both encoded and clear-text
    password  (Yann)


Regards,
Yann E. MORIN.


The following changes since commit 22014e038047dfa2a303fecce0a22d1c5811b6a5:

  mongoose: bump to version 5.6 (2015-03-23 23:17:32 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/passwd

for you to fetch changes up to a13aae8e9670b5cb069379dee94735deb3663f21:

  system: allow/disallow root login, accept encoded passwords (2015-03-24 19:48:42 +0100)

----------------------------------------------------------------
Lorenzo Catucci (1):
      system: allow/disallow root login, accept encoded passwords

Yann E. MORIN (1):
      system: remove DES password encoding

 Config.in.legacy |  7 +++++++
 system/Config.in | 37 +++++++++++++++++++------------------
 system/system.mk | 24 ++++++++++++++++++++----
 3 files changed, 46 insertions(+), 22 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
