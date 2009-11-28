From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 28 Nov 2009 21:30:00 +0100
Subject: [Buildroot] BB update Was:  Build jobbing
In-Reply-To: <200911281341.45157.minimod@morethan.org> (Michael S. Zick's
	message of "Sat\, 28 Nov 2009 13\:41\:42 -0600")
References: <200911271522.58858.minimod@morethan.org>
	<87pr724ggy.fsf@macbook.be.48ers.dk>
	<200911281317.54373.minimod@morethan.org>
	<200911281341.45157.minimod@morethan.org>
Message-ID: <87d4324cl3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

 Michael> One more nit - 

 Michael> Enable setjmp/longjmp should default to yes if Lua is selected.

 Michael> Lua uses 'pure' C code, I.E: setjmp/longjmp because that is the
 Michael> only type of exception handling in ansi-c standard.

setjmp exceptions is afaik something else. I atleast just built lua
without it being enabled.

-- 
Bye, Peter Korsgaard
