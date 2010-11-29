From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 29 Nov 2010 22:14:47 +0100
Subject: [Buildroot] [PATCH] target-finalize: fix libthread_db strip fix
In-Reply-To: <201011291544.27824.vapier@gentoo.org> (Mike Frysinger's message
	of "Mon, 29 Nov 2010 15:44:26 -0500")
References: <1290897792-22134-1-git-send-email-vapier@gentoo.org>
	<201011290621.34143.vapier@gentoo.org>
	<87vd3gxsp7.fsf@macbook.be.48ers.dk>
	<201011291544.27824.vapier@gentoo.org>
Message-ID: <87eia3ygqg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> On Monday, November 29, 2010 06:41:40 Peter Korsgaard wrote:
 >> >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
 Mike> which would be nice to know ... from my point of view, these are
 Mike> simply being ignored with no feedback.  but perhaps this gets
 Mike> back to the buildroot doc not really covering any dev/release
 Mike> processes yet.
 >> 
 >> True. We follow the same general structure as a bunch of other projects
 >> (E.G. Linux, u-boot, barebox, ..).

 Mike> by "structure", i'm guessing you mean "release/development process" ?

Yes. There's naturally some scale differences, but we follow the general
process:

- Releases every 3 months
- Only the maintainer (me) has direct commit access
- A period (2 months) after a release the tree is open for new features,
  then -rc1 is released and only fixes are accepted.
- We use similar commit msg structure and signed-off-by / acked-by's

-- 
Bye, Peter Korsgaard
