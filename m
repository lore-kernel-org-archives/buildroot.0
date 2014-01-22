From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jan 2014 21:59:32 +0100
Subject: [Buildroot] [PATCH 0/3] BR2_EXTERNAL, O: misc fixes and docs
Message-ID: <cover.1390424302.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here is a small series that fixes use of relative paths in BR2_EXTERNAL
and documents the limitations in the manual for BR2_EXTERNAL and O.

This is a split-up of my previous patch, which can be dropped.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (3):
      Makefile: use absolute paths to BR2_EXTERNAL
      manual: $(BR2_EXTERNAL)/{Config.in,external.mk} are mandatory
      manual: add explanations on limitation about using O=...

 Makefile                             |  9 +++++++++
 docs/manual/common-usage.txt         | 13 ++++++++++---
 docs/manual/customize-outside-br.txt | 13 ++++++++-----
 3 files changed, 27 insertions(+), 8 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
