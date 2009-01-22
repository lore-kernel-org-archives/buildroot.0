From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 22 Jan 2009 16:45:35 +0100
Subject: [Buildroot] busybox login problem on AT91SAM9263
In-Reply-To: <5B920D714A1C354D8949DBF58C2A35D604139ABC@freja.acte.local>
	(Robin ActeSE Stridh's message of "Thu\,
	22 Jan 2009 16\:22\:11 +0100")
References: <5B920D714A1C354D8949DBF58C2A35D604139AA8@freja.acte.local>
	<87d4egudlg.fsf@macbook.be.48ers.dk>
	<5B920D714A1C354D8949DBF58C2A35D604139AAE@freja.acte.local>
	<8763k8uacw.fsf@macbook.be.48ers.dk>
	<1232559369.11888.20.camel@elrond.atmel.com>
	<5B920D714A1C354D8949DBF58C2A35D604139ABA@freja.acte.local>
	<877i4no5n7.fsf@macbook.be.48ers.dk>
	<5B920D714A1C354D8949DBF58C2A35D604139ABB@freja.acte.local>
	<87zlhjml3m.fsf@macbook.be.48ers.dk>
	<5B920D714A1C354D8949DBF58C2A35D604139ABC@freja.acte.local>
Message-ID: <87sknbmjj4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robin" == Stridh, Robin ActeSE <robin.stridh@acteembedded.se> writes:

 Robin> Hi,

 Robin> I configured buildroot to use an external toolchain and tried
 Robin> using the toolchain built with the working configuration
 Robin> (r24822) to build the current version of the root file system
 Robin> (r24966). Here the login actually works!

 Robin> Using an newer toolchain, but still external (r24936) still
 Robin> gives the same login problem. Also building todays buildroot
 Robin> with todays toolchain gives the same problem. Seems the
 Robin> problem lies within the toolchain.  Ulf: you said something
 Robin> about that you maybe updated the uClibc configuration. Can you
 Robin> explain this?

Strange. Between those two versions we changed the default gcc version
from 4.2.4 to 4.3.2 - Are both compilations with gcc 4.2.4?

 Robin> If I have to rebuild the toolchain each time it will take
 Robin> time, but I will make some more experiments.

Thanks, please do it as a binary search instead of more-or-less random
versions.

-- 
Bye, Peter Korsgaard
