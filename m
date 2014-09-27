From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 27 Sep 2014 09:44:18 +0200
Subject: [Buildroot] [PATCH 1/1] jamvm: bump to 2.0.0 (including mips
	big-endian support)
In-Reply-To: <1411760203-9478-1-git-send-email-patrickdepinguin@gmail.com>
 (Thomas De Schampheleire's message of "Fri, 26 Sep 2014 21:36:43
 +0200")
References: <1411760203-9478-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <878ul5y0bx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 > This commit bumps jamvm to version 2.0.0. From the release notes:

 >     I'm pleased to announce a new release of JamVM.  JamVM 2.0.0 is the
 >     first release of JamVM with support for OpenJDK (in addition to GNU
 >     Classpath). Although IcedTea already includes JamVM with OpenJDK
 >     support, this has been based on periodic snapshots of the development
 >     tree.

 >     JamVM 2.0.0 supports OpenJDK 6, 7 and 8 (the latest). With OpenJDK 7 and
 >     8 this includes full support for JSR 292 (invokedynamic). JamVM 2.0.0
 >     with OpenJDK 8 also includes full support for Lambda expressions (JSR
 >     335), type annotations (JSR 308) and method parameter reflection.

 >     In addition to OpenJDK support, JamVM 2.0.0 also includes many
 >     bug-fixes, performance improvements and improved compatibility (from
 >     running the OpenJDK jtreg tests).

 > As this release now also supports MIPS big-endian targets, this commit
 > fixes bug #7010 (https://bugs.busybox.net/show_bug.cgi?id=7010)

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 > ---
 > Note: according to the README, powerpc64 is also supported, but needing
 > --with-libffi. This commit does not yet enable that support.

Ok. Can be added in the future if somebody needs it.

Committed, thanks.

-- 
Bye, Peter Korsgaard
