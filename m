From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jul 2010 22:47:28 +0200
Subject: [Buildroot] [git commit master 1/1] u-boot: add Marvell
	u-boot.kwb support
In-Reply-To: <4C4DF09E.502@gmx.net> (Ossy's message of "Mon, 26 Jul 2010
	22:31:26 +0200")
References: <20100726141846.1699E8262B@busybox.osuosl.org>
	<4C4DF09E.502@gmx.net>
Message-ID: <87iq42dl7j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ossy" == Ossy  <ossy1980@gmx.net> writes:

Hi,

 Ossy> Just for documentation if someone searches the mailingarchive:
 Ossy> I run a plain vanilla u-boot with a minor patch in bin-format on my
 Ossy> seagate dockstar (sheevaplug with less memory). But this is
 Ossy> chainloaded by the proprietary u-boot. So at least for this
 Ossy> configuration you are not forced to use the .kwb format.

Ok. u-boot.kwb is in mainline u-boot so it isn't a big issue.

 Ossy> @Peter:
 Ossy> Please note my patch for applying patches to u-boot. The current git
 Ossy> tree includes a typo. I corrected it and submitted the patch more than
 Ossy> once to the mailinglist (see attachement).

Committed, thanks.

-- 
Bye, Peter Korsgaard
