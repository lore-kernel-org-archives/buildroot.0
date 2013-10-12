From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Oct 2013 00:20:06 +0200
Subject: [Buildroot] [pull request] Pull request for branch yem/misc
Message-ID: <cover.1381616359.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here is a small series to clean up rpi-userland wrt .pc files.

Regards,
Yann E. MORIN.


The following changes since commit 9f7e8f120dfeddd8b49eb4d232253cc3f9ac8efa:

  package/weston: add RPi compositor (2013-10-11 08:56:53 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/misc

for you to fetch changes up to 291be0994d2be580cc266c53b85f3d380b35ad3d:

  package/rpi-userland: expose appropriate EGL version (2013-10-13 00:06:34 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/rpi-userland: install all of our .pc files the same way
      package/rpi-userland: expose appropriate EGL version

 .../rpi-userland-000-add-pkgconfig-files.patch     | 34 ++++++++++++++++++++--
 1 file changed, 31 insertions(+), 3 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
