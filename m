From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Jan 2013 15:52:01 +0100
Subject: [Buildroot] [pull request v6] Pull request for branch
	yem-root-passwd
Message-ID: <cover.1357397453.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Here's a re-spin of the second-part of the 'root-paswd' series.


Changes v5 -> v6:
  - set root password only for default skeleton, not for custom one (Gustavo)
  - rebase on-top current master

Changes v4 -> v5:
  - drop patch #1, applied upstream (Peter)
  - make the password-encoding scheme generic (ie. not root-speific)
  - rebase on-top current master


The following changes since commit 66bfe1d4fe2de50aef6ac3fc836a710fa577cdef:

  xdriver_xf86-video-sunffb: remove package (2013-01-05 14:34:48 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-root-passwd

Yann E. MORIN (2):
      system: set root password only for default skeleton
      target: add different methods to encode passwords

 system/Config.in |   84 ++++++++++++++++++++++++++++++++++++++++++++---------
 system/system.mk |    5 ++-
 2 files changed, 73 insertions(+), 16 deletions(-)

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
