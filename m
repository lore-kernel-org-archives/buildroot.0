From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 06 Nov 2010 17:11:37 +0100
Subject: [Buildroot] Results of random configuration builds
In-Reply-To: <AANLkTimvA9Tr_Jd8pB1O0_ZtNu6v+tz5cBzGNhgCnME0@mail.gmail.com>
	(Will Newton's message of "Sat, 6 Nov 2010 15:07:54 +0000")
References: <20101106134454.7769d258@surf>
	<AANLkTimvA9Tr_Jd8pB1O0_ZtNu6v+tz5cBzGNhgCnME0@mail.gmail.com>
Message-ID: <87sjze1lfq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

Hi,

 Will> I've noticed ltrace breaks quite frequently because it is built from
 Will> the debian archive, which doesn't guarantee that the package will
 Will> remain available forever. I wonder whether we should be building
 Will> anything from the debian archive directly and build from
 Will> archive.debian.net instead.

The archive is normally preferred, but a missing upstream shouldn't
matter much with the backup mirror (sources.buildroot.net). Is that
somehow not working for you?

-- 
Bye, Peter Korsgaard
