From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Sep 2015 09:41:50 +0200
Subject: [Buildroot] Building system for the Marvell's ARMADA A385 borad
	to resolve the VLAN trunk issue
In-Reply-To: <20150925093431.4a39623e@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 25 Sep 2015 09:34:31 +0200")
References: <944894A3EB1D044A9003B2F944389BB20474C34B0F@svr-wa-exch1.atg.lc>
 <5600612C.5060300@mind.be>
 <20150923170613.75f5e7e4@free-electrons.com>
 <871tdno5er.fsf@dell.be.48ers.dk>
 <20150925093431.4a39623e@free-electrons.com>
Message-ID: <87oagrlzcx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

>> Couldn't we just do a single defconfig that builds all the dtb files and
 >> then add a README describing what dtb / how to boot on the various
 >> boards?

 > Right, we could do that. But it's really as simple as taking some
 > random mainline kernel version and build mvebu_v7_defconfig. It's not a
 > defconfig that has a lot of added-value.

Ok, and the Marvell u-boot supports zImage / separate dtb or do you need
to play tricks with appended dtb? Anything related to the bootloader
that is worthwhile documenting?

-- 
Venlig hilsen,
Peter Korsgaard 
