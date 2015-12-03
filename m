From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  3 Dec 2015 23:22:03 +0100
Subject: [Buildroot] [PATCH 0/2] package/gawk: handle optional dependencies
	on mpfr and readline (branch yem/host-gawk)
Message-ID: <cover.1449181275.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds better handling of the dependency on MPFR, and handles
the optional dependency on readline.

Regards,
Yann E. MORIN.


The following changes since commit ab2e5dddfc9ea4a8214f8d968b9aab9617e01998:

  wireshark: add optional geoip support (2015-12-03 22:38:31 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/host-gawk

for you to fetch changes up to f37416a8d0f491f30efbc89ddd3a2ce82e56b65c:

  package/gawk: add optional readline dependency (2015-12-03 23:20:01 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/gawk: clean the mpfr dependency
      package/gawk: add optional readline dependency

 package/gawk/gawk.mk | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
