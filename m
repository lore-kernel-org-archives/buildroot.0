From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  5 Aug 2016 20:04:52 +0200
Subject: [Buildroot] [pull request] kmsxx: fix a few build failures
Message-ID: <cover.1470420184.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This short series fixes a few build failures for kmsxx when doing
a static build.

Basically, only the shared libs were ever installed, and the
install-staging command was not catching the failure (fortuantely,
the install-target command did).


Regards,
Yann E. MORIN.


The following changes since commit 5879f0192e99982880aeff7da5bb934b202a6262

  libsepol: fix static build (2016-08-05 15:48:48 +0200)


are available in the git repository at:

  https://gitlab.com/ymorin/buildroot.git

for you to fetch changes up to f79ac35d1809e53962c3241c6483f3f7f1613603

  package/kmsxx: fix static install (2016-08-05 20:02:30 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/kmsxx: detect failure at install-staging
      package/kmsxx: fix static install

 package/kmsxx/kmsxx.mk | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
