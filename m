From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Dec 2012 11:00:58 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem-tvheadend
Message-ID: <cover.1356343037.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Here's an attempt at adding the tvheadend package to buildroot.
tvheadend is a PVR/DVR solution for DVB and IP streams, which
can be used as a backend by other tools, such as XBMC.

The following changes since commit 5f70f5caea8a8e229a5adad948b32fe4e3c88289:

  new package: proxychains (2012-12-23 21:57:45 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-tvheadend

Yann E. MORIN (1):
      package/tvheadend: new package

 package/Config.in                   |    1 +
 package/tvheadend/Config.in         |   20 +++++++++
 package/tvheadend/tvheadend.config  |   13 ++++++
 package/tvheadend/tvheadend.default |    6 +++
 package/tvheadend/tvheadend.init    |   54 +++++++++++++++++++++++++
 package/tvheadend/tvheadend.mk      |   76 +++++++++++++++++++++++++++++++++++
 package/tvheadend/tvheadend.mkuser  |   52 ++++++++++++++++++++++++
 7 files changed, 222 insertions(+), 0 deletions(-)
 create mode 100644 package/tvheadend/Config.in
 create mode 100644 package/tvheadend/tvheadend.config
 create mode 100644 package/tvheadend/tvheadend.default
 create mode 100644 package/tvheadend/tvheadend.init
 create mode 100644 package/tvheadend/tvheadend.mk
 create mode 100755 package/tvheadend/tvheadend.mkuser

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
