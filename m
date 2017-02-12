From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Feb 2017 15:53:07 +0100
Subject: [Buildroot] [PATCH 0/7 v4] support/test-pkg: fixes and enhancements
Message-ID: <cover.1486911180.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series brins a few fixes and improvements to the test-pkg script.

First, it fixes the cioding style, to be more in-line with what is used
in Buildroot.

Changes v2 -> v3:
  - drop patches already applied
  - simplify the config check  (Cam)
  - be less verbose  (Thomas)
  - fix coding style  (Thomas)

Changes v2 -> v3:
  - simplify the code to store missing config lines  (Luca)
  - properly run when -r is not provided
  - add 5th path to use an alternate list
  - add 6th patch to print the progress [n/N] for each toolchain


Regards,
Yann E. MORIN.


The following changes since commit 8ac3f121f0ccc31a79b08c473e19e4d4ae922942

  wiringpi: fix static linking (2017-02-12 15:03:02 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 05e8a8e4a66b175edcd8f6250c583051f77eeae9

  support/test-pkg: print number of toolchain and progress (2017-02-12 15:18:08 +0100)


----------------------------------------------------------------
Yann E. MORIN (7):
      supprt/test-pkg: fix code style
      support/scripts: check the config snippet exists
      support/test-pkg: simplify the config check
      support/test-pkg: be less verbose
      support/test-pkg: report number and types of failures
      support/test-pkg: add option to use an alternate list of toolchains
      support/test-pkg: print number of toolchain and progress

 support/scripts/test-pkg | 125 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 81 insertions(+), 44 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
