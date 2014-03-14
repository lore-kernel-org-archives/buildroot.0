From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Mar 2014 23:10:39 +0100
Subject: [Buildroot] [PATCH 0/2 v3] legal-info: extract packages to get
	license files (branch yem/legal)
Message-ID: <cover.1394834923.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here a quick and short series fixing the legal-info infra to extract
packages before trying to save the license files.


Changes v2 -> v3:
  - fix manifest for no-redistribute, or overriden, or local packages


Regards,
Yann E. MORIN.


The following changes since commit 5dc0e606b554c494a76ffcc216eb8911d2d71dfa:

  libesmtp: not available for static builds (2014-03-13 22:59:07 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/legal

for you to fetch changes up to 14c2e0397e1ce59801eb4e33561429c831dbadc8:

  legal-info: add a comment about what pacakges we save the tarballs of (2014-03-14 23:05:28 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      legal-info: extract even no-redistribute packages
      legal-info: add a comment about what pacakges we save the tarballs of

 package/pkg-generic.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
