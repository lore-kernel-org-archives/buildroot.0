From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Nov 2009 11:23:28 +0100
Subject: [Buildroot] BB update Was:  Build jobbing
In-Reply-To: <200911290331.03877.minimod@morethan.org> (Michael S. Zick's
	message of "Sun\, 29 Nov 2009 03\:31\:01 -0600")
References: <200911271522.58858.minimod@morethan.org>
	<200911290302.13984.minimod@morethan.org>
	<87my253d8o.fsf@macbook.be.48ers.dk>
	<200911290331.03877.minimod@morethan.org>
Message-ID: <87iqct39zz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

 >> That's imho fairly clearly not about basic setjmp/longjmp support.

 Michael> Only when you are thinking about building a compiler, but if
 Michael> instead you happen to be an applications programmer, who
 Michael> doesn't know or care how the compiler works internally...

Then he probably shouldn't be changing stuff under toolchain options ;)

 Michael> I only now recognize why it seems clear to you - because I did live
 Michael> on the gcc list once upon a time - not all of the buildroot users
 Michael> have that background.

Actually I haven't done much gcc development. The
BR2_GCC_USE_SJLJ_EXCEPTIONS option got added back in 2004 by Erik really
in beginning of BR development. I don't know of anything needing it
today.

In general, we try to use sensible defaults - If you don't understand an
option, just leave it at default.

-- 
Bye, Peter Korsgaard
