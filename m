From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 07 Sep 2013 08:11:00 +0200
Subject: [Buildroot] [PATCH 2 of 2 v3] xzcat: treat as host prerequisite
	and build if needed
In-Reply-To: <a7969409ab53a2fc00c4.1375434315@BEANTN0L019720> (Thomas De
 Schampheleire's message of "Fri, 02 Aug 2013 11:05:15 +0200")
References: <patchbomb.1375434313@BEANTN0L019720>
 <a7969409ab53a2fc00c4.1375434315@BEANTN0L019720>
Message-ID: <8761ud17rf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> If xzcat is not present on the host system, buildroot bails out early asking
 Thomas> the developer to install it (xzcat is now a DL_TOOLS_DEPENDENCY)
 Thomas> Conversely, when BR2_TARGET_ROOTFS_CPIO_XZ is enabled, then host-xz is a
 Thomas> build dependency, and no manual action is required from the developer.

 Thomas> Because the second approach is nicer, also build host-xz when xzcat is not
 Thomas> available, using the host-prerequisite and suitable-host-pkg mechanisms,
 Thomas> already used for tar.

 Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 Thomas> ---
 Thomas> v3: update after $(firstword) change
 Thomas> v2: avoid filtering out xzcat from DL_TOOLS_DEPENDENCIES (comment ThomasP)

Committed, thanks.

-- 
Bye, Peter Korsgaard
