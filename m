From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  4 Oct 2018 22:00:07 +0200
Subject: [Buildroot] [PATCH 0/2] linux-headers: drop 4.17, fix legacy
Message-ID: <cover.1538683163.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This two-patch series fixes the legacy handling for dropped kernel
header versions, and drops the 4.17 one (that was already partially and
incorrectly dropped during the merge of next).


Regards,
Yann E. MORIN.


The following changes since commit 51e17496cc403c49bc20d3a81f9c71a8a20edd0f

  gnupg: drop mandatory dependency on ncurses (2018-10-04 15:35:50 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to c1b6a02f6b6624c3138535318f5bfe6e9090ce4b

  package/linux-headers: really drop the 4.17 choice (2018-10-04 21:55:39 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      legacy: don't select kernel headers
      package/linux-headers: really drop the 4.17 choice

 Config.in.legacy                     | 129 +++++++----------------------------
 package/linux-headers/Config.in.host |   4 --
 2 files changed, 23 insertions(+), 110 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
