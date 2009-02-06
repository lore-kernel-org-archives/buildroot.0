From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Feb 2009 09:44:48 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <1233866252.4148.12.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Thu\, 05 Feb 2009 21\:37\:32 +0100")
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<873aeue676.fsf@macbook.be.48ers.dk>
	<d6cda7730902041833r5e5af2ax26c0eebb48df19a4@mail.gmail.com>
	<87vdrpaug2.fsf@macbook.be.48ers.dk>
	<1233866252.4148.12.camel@elrond.atmel.com>
Message-ID: <87ab90ar9b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Thiago> It will use the rootfs suffix if one is specified for the kernel, but
 Thiago> if none is supplied, we get default kernel names. Then you can get
 Thiago> both rootfs and kernel with your board names, dates, etc. And both
 Thiago> rootfs and kernel names will always match.

 Ulf> And you have no clue about the kernel version.

Why would you want to know? We don't provide that kind of info for the
other files either (which is good as the file names don't change then)
Just run mkimage -l and/or boot it if you want to check.

 Ulf> And you have to modify the suffix for every project.
 Ulf> Much better to just create the link to uImage etc.

Yes, as it's a per-project decission. I don't believe this is a big
effort, most people only work on 1-2 projects.

-- 
Bye, Peter Korsgaard
