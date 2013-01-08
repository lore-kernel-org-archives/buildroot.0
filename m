From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  8 Jan 2013 13:06:19 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem-misc-fixes
Message-ID: <cover.1357646760.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Here are a series to fix the autobuilder issues with dvb-apps.


The following changes since commit 88ef92dfcb22f398809dc6bff9e675a6e29afa21:

  linux: fix double LINUX_APPEND_DTB (2013-01-08 10:12:02 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-misc-fixes

Yann E. MORIN (2):
      package/dvb-apps: requires largefiles
      package/dvb-apps: requires iconv

 package/dvb-apps/Config.in   |    5 +++++
 package/dvb-apps/dvb-apps.mk |    3 ++-
 2 files changed, 7 insertions(+), 1 deletions(-)

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
