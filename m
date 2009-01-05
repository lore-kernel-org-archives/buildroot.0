From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 Jan 2009 21:12:14 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <1231179121.8886.225.camel@linux-yrgm.site> (Ulf Samuelsson's
	message of "Mon\, 05 Jan 2009 19\:12\:01 +0100")
References: <20090105161237.034D977404@busybox.osuosl.org>
	<1231179121.8886.225.camel@linux-yrgm.site>
Message-ID: <87y6xpv7fl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> The "complex" file name is needed, unless you only
 Ulf> work with a single board.

I don't get it - Isn't that why we have binaries/<project>? Even so,
isn't that the same problem with the other files? (file system images,
kernels)?

 Ulf> We obviously need to find  a way that does not break the build of
 Ulf> course.

 Ulf> Many targets define BR2_BOARD_NAME in their Config.in's
 Ulf> and it may make sense to have a common BR2_BOARD_NAME
 Ulf> Then it will be always be defined.
 Ulf> Default to "uclibc" is probably OK.

Isn't that what we have BR2_PROJECT for?

-- 
Bye, Peter Korsgaard
