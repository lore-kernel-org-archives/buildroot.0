From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Dec 2012 22:26:28 +0100
Subject: [Buildroot] [PATCH] xtensa: add -mlongcalls to CFLAGS for xtensa
In-Reply-To: <50c0320c.05bf440a.60fe.60b5@mx.google.com> (Chris Zankel's
 message of "Wed, 5 Dec 2012 21:36:36 -0800")
References: <50c0320c.05bf440a.60fe.60b5@mx.google.com>
Message-ID: <87boe1r43f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Zankel <chris@zankel.net> writes:

 Chris> The longcalls option allows calls across a greater range of addresses.
 Chris> This option may degrade both code size and performance, but
 Chris> the linker can generally optimize away the unnecessary overhead
 Chris> when a call ends up within range

Committed, thanks.

-- 
Bye, Peter Korsgaard
