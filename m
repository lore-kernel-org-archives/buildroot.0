From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 11 Mar 2011 22:31:52 +0100
Subject: [Buildroot] [PATCH] toolchain/gcc/4.2.4: Remove libstdc++
	uClibc locale patches.
In-Reply-To: <AANLkTin7isvvLN28dLa9_ca_cCW0odc8FerFkDEwYeJA@mail.gmail.com>
	(Will Newton's message of "Thu, 10 Mar 2011 10:27:49 +0000")
References: <AANLkTin7isvvLN28dLa9_ca_cCW0odc8FerFkDEwYeJA@mail.gmail.com>
Message-ID: <87mxl1pcmv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> These patches do not build with more recent versions of uClibc
 Will> going back as far as at least 2008. More recent compiler versions
 Will> seem to do fine without these patches, so lets remove them so
 Will> libstdc++ locale support will actually build for gcc 4.2.4.

Committed, thanks.

-- 
Bye, Peter Korsgaard
