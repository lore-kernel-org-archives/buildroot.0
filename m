From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 Feb 2019 22:44:23 +0100
Subject: [Buildroot] [PATCHv2] package/s6-linux-utils: bump to 2.5.0.0
In-Reply-To: <20190202203756.9988-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Sat, 2 Feb 2019 21:37:56 +0100")
References: <20190202203756.9988-1-patrickdepinguin@gmail.com>
Message-ID: <87sgx5yifc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > In 2.4.0.2, compilation under glibc 2.28 is fixed (and our local patch can
 > thus be removed).
 > While at it, bump to the latest released version 2.5.0.0.

 > Note: change in COPYING file is only the copyright year.

 > From the NEWS file:
 > """
 > In 2.5.0.0
 > ----------
 >  - Optional nsss support.
 >  - s6-devd, s6-uevent-listener, s6-uevent-spawner removed.

 > In 2.4.0.2
 > ----------
 >  - s6-logwatch rewrite.
 >  - Better portability with old glibc versions.
 >  - s6-uevent-listener and s6-uevent-spawner are marked as deprecated. (The
 >    mdevd package obsoletes them.)
 > """

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > ---
 >  ...s-sysmacros.h-because-glibc-is-glibc.patch | 27 -------------------
 >  package/s6-linux-utils/s6-linux-utils.hash    |  4 +--
 >  package/s6-linux-utils/s6-linux-utils.mk      |  2 +-
 >  3 files changed, 3 insertions(+), 30 deletions(-)
 >  delete mode 100644 package/s6-linux-utils/0001-Include-sys-sysmacros.h-because-glibc-is-glibc.patch

 > v2:
 > - remove leftover patch (feedback Thomas Petazzoni)
 > - fix hash of COPYING file

Committed, thanks.

-- 
Bye, Peter Korsgaard
