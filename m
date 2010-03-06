From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 06 Mar 2010 22:51:52 +0100
Subject: [Buildroot] Patch to allow iproute2 without IPv6 requirement
In-Reply-To: <1267473268.25711.10.camel@localhost.localdomain> (Darcy
	L. Watkins's message of "Mon, 01 Mar 2010 11:54:28 -0800")
References: <D61182AC8012EA4EBC531B3AF23BE10992A96A@tranzeo-mail2.12stewart.tranzeo.com>
	<1267220120.28886.99.camel@localhost.localdomain>
	<1267473268.25711.10.camel@localhost.localdomain>
Message-ID: <87aaul15l3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Darcy" == Darcy L Watkins <dwatkins@tranzeo.com> writes:

 Darcy> Hello,
 Darcy> I noticed that when I upgraded from 2009.02 to 2010.02 I lost iproute2
 Darcy> in my config that doesn't use IPv6.  The patch below applies to 2010.02
 Darcy> and should allow the iproute2 to build without IPv6.  It builds OK (and
 Darcy> doesn't appear to misbehave) on my powerpc 405 platform and I am also
 Darcy> building it to try out later today on an ARM11 platform.

 Darcy> Anyone else who wants to test drive it is welcome to do so.

Thanks, looks sane. Please submit it to iproute upstream so we don't
need to maintain this in the future.

-- 
Bye, Peter Korsgaard
