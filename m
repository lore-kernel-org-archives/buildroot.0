From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Oct 2016 17:31:12 +0200
Subject: [Buildroot] odroidc2 broken in latest git
In-Reply-To: <trinity-97d923e3-1509-4df6-8cea-c6856bedc7ff-1475734297864@3capp-mailcom-bs04>
 (daggs@gmx.com's message of "Thu, 6 Oct 2016 08:11:37 +0200")
References: <trinity-97d923e3-1509-4df6-8cea-c6856bedc7ff-1475734297864@3capp-mailcom-bs04>
Message-ID: <87oa2xmr3z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "daggs" == daggs  <daggs@gmx.com> writes:

 > Greetings all,
 > following a complaint posted in the odroid forums I tried to boot
 > latest git with mininal config on my odroidc2 board and it doesn't
 > boot.

Yes, it was also reported here and I CC'ed you on the mails.

 > I've booted the last commit I know to work (61b6abb2a2198d0a659d305ac3dd813a1f900aa1) and it indeed boots.
 > I've checked the odroidc2 file's logs and there were no changes done after the commit mentioned above.

 > has there been any structural change that might cause this behavior?

Without knowing it, I would guess it is related to the toolchain
version. We have changed the default binutils and gcc version since
August.

Can you verify with the gcc/binutils versions used in 61b6abb2a219?

-- 
Bye, Peter Korsgaard
