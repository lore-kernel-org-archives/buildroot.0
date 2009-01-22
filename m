From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 22 Jan 2009 14:02:36 +0100
Subject: [Buildroot] busybox login problem on AT91SAM9263
In-Reply-To: <5B920D714A1C354D8949DBF58C2A35D604139ABA@freja.acte.local>
	(Robin ActeSE Stridh's message of "Thu\,
	22 Jan 2009 13\:45\:45 +0100")
References: <5B920D714A1C354D8949DBF58C2A35D604139AA8@freja.acte.local>
	<87d4egudlg.fsf@macbook.be.48ers.dk>
	<5B920D714A1C354D8949DBF58C2A35D604139AAE@freja.acte.local>
	<8763k8uacw.fsf@macbook.be.48ers.dk>
	<1232559369.11888.20.camel@elrond.atmel.com>
	<5B920D714A1C354D8949DBF58C2A35D604139ABA@freja.acte.local>
Message-ID: <877i4no5n7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robin" == Stridh, Robin ActeSE <robin.stridh@acteembedded.se> writes:

Hi,

 Robin> The conclusion is that the problem occured somewhere between
 Robin> r24822 and r24922 (jan 13 and jan 21)

Strange, nothing significantly have changed to busybox since then.

Could you do little binary search between those 2 revisions to close
in on the problem commit (E.G. try 24872, if that works then 897, else
847 and so on)?

-- 
Bye, Peter Korsgaard
