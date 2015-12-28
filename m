From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Dec 2015 20:08:51 +0100
Subject: [Buildroot] [PATCH 0/2] jack2: add missing dependencies (branch
	yem/pw)
Message-ID: <cover.1451329553.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This short series cleans up the dependnecies of jack2, by adding
optional dependencies that were so far not accounted for in the
dependency chain.

Note that this series only clenly applies on-top of the previously-sent
multi-mode patch:
    http://lists.busybox.net/pipermail/buildroot/2015-December/148388.html

However, it does not functionally depend on it, so can be applied
without it (but would need some manual love to fix conflicts).


Regards,
Yann E. MORIN.


The following changes since commit 8936ae4b4162b2bfa77ac2fd6ade62226ef1bdcc:

  jack2: allow to choose the mode to operate jackd (2015-12-28 18:19:12 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/pw

for you to fetch changes up to 5f7632a3d6ed3e3ab0f324e31be21a0ea18245d4:

  package/jack2: add missing optional dependencies (2015-12-28 20:03:58 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/eigen: install .pc file
      package/jack2: add missing optional dependencies

 package/eigen/eigen.mk |  9 +++++++++
 package/jack2/jack2.mk | 17 +++++++++++++++++
 2 files changed, 26 insertions(+)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
