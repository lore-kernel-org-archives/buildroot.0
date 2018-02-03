From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  3 Feb 2018 18:05:55 +0100
Subject: [Buildroot] [PATCH 0/2] package/wf111: don't require a
 pre-downloaded tarball
Message-ID: <cover.1517677545.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

The download site is now longer behind a click-wrap registration
process, so we can do a direct download now.

Also, fix the archive name for the armv5te variant.


Regards,
Yann E. MORIN.


The following changes since commit 233202597d9411399aeaded2f9a7cd14f2e29833

  python3: bump to 2.6.4 (2018-02-03 08:26:16 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to ef05e42aa7a51d33c666507728602993d04344bb

  package/wf111: do a direct download (2018-02-03 17:57:14 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/wf111: fix armv5 URL
      package/wf111: do a direct download

 package/wf111/Config.in | 11 -----------
 package/wf111/wf111.mk  |  9 ++-------
 2 files changed, 2 insertions(+), 18 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
