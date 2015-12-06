From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Dec 2015 12:13:56 +0100
Subject: [Buildroot] [PATCH 0/2 v2] package/gawk: handle optional
	dependencies on mpfr and readline (branch yem/gawk)
Message-ID: <cover.1449400403.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds better handling of the dependency on MPFR, and handles
the optional dependency on readline.

Changes v1 -> v2:
  - better comment on why no --with-{mpfr,readline}  (Arnout)

Regards,
Yann E. MORIN.


The following changes since commit f8daafddb2339d5d34af1ed23f7dcf4380b775bc:

  docs: website: update for 2015.11.1 (2015-12-05 23:17:04 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/gawk

for you to fetch changes up to 2b971b558fa20e875348aa2213e0ad385f72d20f:

  package/gawk: add optional readline dependency (2015-12-06 09:42:01 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/gawk: clean the mpfr dependency
      package/gawk: add optional readline dependency

 package/gawk/gawk.mk | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
