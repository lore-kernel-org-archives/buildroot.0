From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 16:07:36 +0200
Subject: [Buildroot] svn
	commit:	trunk/buildroot/toolchain/external-toolchain
In-Reply-To: <20080616135459.GA21225@mx.loc> (Bernhard Fischer's message of
	"Mon\, 16 Jun 2008 15\:54\:59 +0200")
References: <20080616122246.C821B3C987@busybox.net>
	<20080616135459.GA21225@mx.loc>
Message-ID: <87prqh323b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 >> Author: jacmet
 >> Date: 2008-06-16 05:22:45 -0700 (Mon, 16 Jun 2008)
 >> New Revision: 22378
 >> 
 >> Log:
 >> toolchain: more sensible uclibc defaults for external toolchain

 Bernhard> Note that the external toolchain always defaulted to use a
 Bernhard> glibc-based toolchain. Steven should be notified on such a
 Bernhard> change since (IIRC) it was him who added the
 Bernhard> external-toolchain thing..

He afaiks reads this list as well, and it's just defaults, so no big
deal. BR2_TOOLCHAIN_EXTERNAL_LIBS, BR2_TOOLCHAIN_EXTERNAL_PATH and
BR2_TOOLCHAIN_EXTERNAL_PREFIX weren't set to anything before, so glibc
users have to configure it anyway.

We might as well default to something that is right away usable for
buildroot users.

-- 
Bye, Peter Korsgaard
