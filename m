From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Apr 2009 14:59:58 +0200
Subject: [Buildroot] svn commit: [26102] trunk/buildroot/target
In-Reply-To: <20090415091322.9352176525@busybox.osuosl.org>
	(austinf@uclibc.org's message of "Wed\,
	15 Apr 2009 09\:13\:22 +0000 \(UTC\)")
References: <20090415091322.9352176525@busybox.osuosl.org>
Message-ID: <8763h69inl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "austinf" == austinf  <austinf@uclibc.org> writes:

 austinf> Author: austinf
 austinf> Date: 2009-04-15 09:13:21 +0000 (Wed, 15 Apr 2009)
 austinf> New Revision: 26102

 austinf> Log:
 austinf> unmark the sparc targets as broken, they build if you disable shared libgcc

So what about letting BR2_GCC_SHARED_LIBGCC depend on !BR2_space &&
!BR2_sparc64 ?

-- 
Bye, Peter Korsgaard
