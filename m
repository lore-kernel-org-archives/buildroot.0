From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Feb 2009 12:12:51 +0100
Subject: [Buildroot] Toolchain error
In-Reply-To: <1235382160.2951.52.camel@localhost.localdomain> (Rajeev Bansal's
	message of "Mon\, 23 Feb 2009 15\:12\:40 +0530")
References: <1E3D081C7B502B4A988F643E604CF9634721AD@INDEXCH.corp.proxim.com>
	<873ae54iy6.fsf@macbook.be.48ers.dk>
	<1235382160.2951.52.camel@localhost.localdomain>
Message-ID: <87ljrx2yq4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rajeev" == Rajeev Bansal <rbansal@proxim.com> writes:

 Rajeev> Hello Peter, 

 Rajeev> Thanks for your response. I think MIPS has the support for
 Rajeev> NPTL, I am building the toolchain explicitly for NPTL support
 Rajeev> only. Kindly see this link

The kernel and glibc might support it, but uClibc doesn't (yet).

-- 
Bye, Peter Korsgaard
