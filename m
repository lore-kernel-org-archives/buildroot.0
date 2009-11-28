From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 28 Nov 2009 15:16:05 -0600
Subject: [Buildroot] BB update Was:  Build jobbing
In-Reply-To: <87d4324cl3.fsf@macbook.be.48ers.dk>
References: <200911271522.58858.minimod@morethan.org>
	<200911281341.45157.minimod@morethan.org>
	<87d4324cl3.fsf@macbook.be.48ers.dk>
Message-ID: <200911281516.07279.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat November 28 2009, Peter Korsgaard wrote:
> >>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:
> 
>  Michael> One more nit - 
> 
>  Michael> Enable setjmp/longjmp should default to yes if Lua is selected.
> 
>  Michael> Lua uses 'pure' C code, I.E: setjmp/longjmp because that is the
>  Michael> only type of exception handling in ansi-c standard.
> 
> setjmp exceptions is afaik something else. I atleast just built lua
> without it being enabled.
> 

Look at my print(math.sin(12)) example -
bet you don't see any backtrace.

Mike
