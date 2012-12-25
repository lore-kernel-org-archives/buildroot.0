From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Dec 2012 19:11:28 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem-misc-fixes
Message-ID: <cover.1356459033.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Here are two fixes for packages I recently submitted.

The following changes since commit 5f70f5caea8a8e229a5adad948b32fe4e3c88289:

  new package: proxychains (2012-12-23 21:57:45 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-misc-fixes

Yann E. MORIN (2):
      package/spice: don't enable GUI if dependencies not met
      package/keyutils: disable on avr32

 package/keyutils/Config.in |    1 +
 package/spice/Config.in    |    5 +++++
 2 files changed, 6 insertions(+), 0 deletions(-)

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
