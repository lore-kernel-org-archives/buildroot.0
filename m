From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Dec 2009 23:05:02 +0100
Subject: [Buildroot] RTNETLINK error
In-Reply-To: <4B2CB099CF3D4F40B1B1442281CA94FFC4C92A@EXCHANGEVS01.appsig.com>
	(RYAN NEAL's message of "Wed, 9 Dec 2009 13:20:48 -0800")
References: <4B2CB099CF3D4F40B1B1442281CA94FFC4C929@EXCHANGEVS01.appsig.com>
	<87vdgfx6ac.fsf@macbook.be.48ers.dk>
	<4B2CB099CF3D4F40B1B1442281CA94FFC4C92A@EXCHANGEVS01.appsig.com>
Message-ID: <87ocm7x0q9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == NEAL, RYAN <RYAN_NEAL@appsig.com> writes:

 Ryan> I am actually not trying to boot from an NFS.  I just want to use an
 Ryan> initramfs.

Ok, why are you then using the kernel ip autoconfig stuff that is
normally only used to boot from NFS?

 Ryan> output/target% cat etc/network/interfaces
 Ryan> # Configure Loopback
 Ryan> auto lo
 Ryan> iface lo inet loopback

 Ryan> that all seems reasonable?  I thought I turned off NFS as an option in
 Ryan> buildroot.

Yes, looks fine.

-- 
Bye, Peter Korsgaard
