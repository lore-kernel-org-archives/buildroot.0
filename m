From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Tue, 31 Jul 2007 23:43:12 +0200 (CEST)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device
 target/device/Atmel targe etc...
In-Reply-To: <20070731212709.GE11697@aon.at>
References: <20070731145959.C5111A4595@busybox.net>
	<20070731161525.GB9378@aon.at>
	<0707312219520.11633@somehost> <20070731212709.GE11697@aon.at>
Message-ID: <0707312331140.11633@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 31 Jul 2007, Bernhard Fischer wrote:

> On Tue, Jul 31, 2007 at 10:24:53PM +0200, Cristian Ionescu-Idbohrn wrote:
> >
> >Reversing $(UCLIBC_PATCH_DIR) to toolchain/uClibc/ unbreaks it.
>
> It's really a PITA, yes.

I really don't understand why stuff in checked in without testing :(

> I'm honestly thinking about an alternative approach to all of this mess.

I, for one, would welcome it.

> Either i move to a branch or somebody else would have better used a
> branch to safe away nonworking draft patches.

Yes, branches is more work for the developer, but it mostly saves a lot
of grief for the users. Dumping half tested code into the repository will
turn people off and away :(

Is there any known unbroken recent revision number one could use?


Cheers,

-- 
Cristian
