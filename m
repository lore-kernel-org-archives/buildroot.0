From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 28 Nov 2009 13:41:42 -0600
Subject: [Buildroot] BB update Was:  Build jobbing
In-Reply-To: <200911281317.54373.minimod@morethan.org>
References: <200911271522.58858.minimod@morethan.org>
	<87pr724ggy.fsf@macbook.be.48ers.dk>
	<200911281317.54373.minimod@morethan.org>
Message-ID: <200911281341.45157.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat November 28 2009, Michael S. Zick wrote:
>   ? ?             GCC compiler Version (gcc 4.3.4)  --->                                     ? ?
>   ? ?         [*] Enable toolchain with --sysroot support                                    ? ?
>   ? ?         [*] Enable setjmp/longjmp exceptions?                                          ? ?
>

One more nit - 

Enable setjmp/longjmp should default to yes if Lua is selected.

Lua uses 'pure' C code, I.E: setjmp/longjmp because that is the
only type of exception handling in ansi-c standard.

Mike
