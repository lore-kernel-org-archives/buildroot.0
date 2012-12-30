From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Dec 2012 19:08:04 +0100
Subject: [Buildroot] [pull request v5] Pull request for branch
	yem-root-passwd
Message-ID: <cover.1356890711.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter, All,

As requested, here's the re-spin of the second-part of the 'root-paswd'
series.

Note however these few changes since the previous iteration:

Changes v4 -> v5:
  - drop patch #1, applied upstream (Peter)
  - make the password-encoding scheme generic (ie. not root-speific)
  - rebase on-top current master

The following changes since commit a45871bfc6a3f800548954dd364b5f53e81804ab:

  target: add option to set the root password (2012-12-30 18:00:16 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-root-passwd

Yann E. MORIN (1):
      target: add different methods to encode passwords

 system/Config.in |   62 +++++++++++++++++++++++++++++++++++++++++++++++++----
 system/system.mk |    3 +-
 2 files changed, 59 insertions(+), 6 deletions(-)

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
