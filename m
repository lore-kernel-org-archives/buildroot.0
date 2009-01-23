From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Jan 2009 12:06:01 +0100
Subject: [Buildroot] busybox login problem on AT91SAM9263
In-Reply-To: <5B920D714A1C354D8949DBF58C2A35D604139ABE@freja.acte.local>
	(Robin ActeSE Stridh's message of "Thu\,
	22 Jan 2009 20\:12\:17 +0100")
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
	<87sknbmjj4.fsf@macbook.be.48ers.dk>
	<5B920D714A1C354D8949DBF58C2A35D604139ABE@freja.acte.local>
Message-ID: <87wscml1t2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robin" == Stridh, Robin ActeSE <robin.stridh@acteembedded.se> writes:

Hi,

 Robin> I know I have selected EABI in buildroot sucessfully in the
 Robin> past and my kernel is built to support both. Now I have no
 Robin> idea when this thing broke - probably months ago.

 Robin> What ABI is recommended for Buildroot? I though that if
 Robin> selectable you should always choose EABI since it's newer?

Well, it's newer, but potentinally less stable (as you see).
Sorry, I don't work much with ARM, so I cannot say much more than that
- Ulf?

-- 
Bye, Peter Korsgaard
