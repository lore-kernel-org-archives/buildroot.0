From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Dec 2014 19:16:03 +0100
Subject: [Buildroot] [PATCH 0/2] FreeRDP: misc arch-related fixes (branch
	yem/fixes)
Message-ID: <cover.1419704115.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Two patches to fix FreeRDP because it may mis-detects the CPU, and may
enable features (Neon, SSE2) even if the CPU is missing them.

Regards,
Yann E. MORIN.


The following changes since commit 4ab89081f4d9187b9ad853eac2058fd98c6892d1:

  package/ffmpeg: update hash (2014-12-27 19:09:39 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/fixes

for you to fetch changes up to d37d664e994af72e48de29bfbb2112249981b672:

  package/freerdp: do not use SSE2 extensions when not available (2014-12-27 19:13:43 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/freerdp: do not use Neon extensions when not available
      package/freerdp: do not use SSE2 extensions when not available

 package/freerdp/freerdp.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
