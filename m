From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  5 Jan 2017 22:16:33 +0100
Subject: [Buildroot] [PATCH 0/2 v2] pjsip: configuration fixes
Message-ID: <cover.1483650983.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This two-patch series cleanups and fixes our pjsip configuration
options:
  - ensure everything is explictly disabled and not left auto-detected,
  - except for the epoll support that needs a quirk,
  - fix an option value

Cahnges v1 -> v2:
  - fix the epoll mess  (Luca)
  - add tested and acked tags by Luca on second patch


Regards,
Yann E. MORIN.


The following changes since commit 231b317dd3cf2b4b05737231b67f87c529985fef

  libgtk3: bump to version 3.22.6 (2017-01-05 16:19:26 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to c1748115da6b3cd0269388e78450d97df370d387

  package/libpjsip: drop path to staging to find libsrtp (2017-01-05 22:06:09 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/libpjsip: disable remaining unspecified options
      package/libpjsip: drop path to staging to find libsrtp

 package/libpjsip/libpjsip.mk | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
