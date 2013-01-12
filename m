From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jan 2013 00:50:31 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem-dvb-apps
Message-ID: <cover.1358034598.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Here's a two-patch series to fix the dvb-apps licensing terms, and bump
the version.


The following changes since commit 2b29492cf7a67a705dc0302018d1a7b35d19f308:

  webkit: remove X.org server dependency (2013-01-12 22:53:41 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-dvb-apps

Yann E. MORIN (2):
      package/dvb-apps: fix licensing terms when utils are enabled
      package/dvb-apps: bump version

 package/dvb-apps/dvb-apps.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
