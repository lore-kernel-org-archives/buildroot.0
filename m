From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 May 2020 23:40:49 +0200
Subject: [Buildroot] [PATCH 0/2] core/br2-external: fix reporting errors
 (branch yem/br2-ext-fixes)
Message-ID: <cover.1590183628.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Following a few reports on IRC, we discovered an issue with how our
br2-external support was reporting errors. Fix that.


Regards,
Yann E. MORIN.


The following changes since commit a00db9f80819982348e64834f76048c2c8381f40

  DEVELOPERS: remove python-pycrypto (2020-05-21 17:05:20 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to f7b374aa76093cdf59fd788d7c8cc39b86415eb6

  core/br2-external: report better error messages (2020-05-22 23:39:05 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      core.br2-external: fix reporting errors
      core/br2-external: report better error messages

 support/scripts/br2-external | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
