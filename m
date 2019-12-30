From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 21:36:12 +0100
Subject: [Buildroot] [PATCH 0/2] package/openssl: move options to
 per-provider Config.in (branch yem/openssl-move-options)
Message-ID: <cover.1577738159.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Small series that does just what it says on the tin.


Regards,
Yann E. MORIN.


The following changes since commit ca75e164a06fa016f35b9658ae1a7f59396ab64c

  package/wf111: update the upstream URL in Config.in (2019-12-30 21:21:56 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 3c20be96d78c897e6a158af41df5b4462776e767

  package/libressl: move config options (2019-12-30 21:31:57 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/libopenssl: move options
      package/libressl: move config options

 package/libopenssl/Config.in | 16 ++++++++++++++++
 package/libressl/Config.in   |  9 +++++++++
 package/openssl/Config.in    | 26 +-------------------------
 3 files changed, 26 insertions(+), 25 deletions(-)
 create mode 100644 package/libressl/Config.in

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
