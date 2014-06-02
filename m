From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Jun 2014 13:07:58 +0200
Subject: [Buildroot] [PATCH 12/21] package/procps: bump version and
	rename to procps-ng
In-Reply-To: <8efa4f97896ac9993e10940368cb32d6d4bb5e6e.1401658972.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 1 Jun 2014 23:43:43 +0200")
References: <cover.1401658972.git.yann.morin.1998@free.fr>
 <8efa4f97896ac9993e10940368cb32d6d4bb5e6e.1401658972.git.yann.morin.1998@free.fr>
Message-ID: <8761kjy3g1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > procps is getting replaced by procps-ng, and there are
 > new versions available!

 > procps-ng is now an autotools package, so get rid of our
 > custom build/install rules.

 > Remove most patches, except for one that still half-applies,
 > so update and rename it.

 > procps is dead, long live procps-ng!

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/Config.in                                |  2 +-
 >  package/{procps => procps-ng}/Config.in          |  6 ++---
 >  package/procps-ng/procps-0000-remove-index.patch | 16 +++++++++++++
 >  package/procps-ng/procps.mk                      | 15 ++++++++++++

Both of these should 's/procps/procps-ng/'.

What about Config.in.legacy?

-- 
Bye, Peter Korsgaard
