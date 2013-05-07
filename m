From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Tue, 7 May 2013 10:20:36 +0200 (CEST)
Subject: [Buildroot] [PATCH] toolchain/crostool-NG: mark as deprecated
In-Reply-To: <20130507100237.3888a716@skate>
Message-ID: <2101586089.2239357.1367914836004.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> I don't have real comments about the proposal to deprecate the
> Crosstool-NG support, but I'd like to take this opportunity to unveil
> my plans about the internal toolchain support (I hate unveiling plans
> before the code is ready, but it seems like a good idea in this
> particular case) :
> 
>  (1) I am currently converting the existing internal toolchain logic
>  to
>      use the package infrastructure. I've already done it for
>      'gdb' (merged for 2013.05), I have patches that seem to work for
>      elf2flt and linux-headers, and I've started working on
>      converting
>      gcc (which is the most complicated piece of the puzzle).
> 
>  (2) Once this conversion is done, I intend to work on adding
>  (e)glibc
>      support to the internal toolchain backend, so that regardless of
>      what happens with the Crosstool-NG backend, Buildroot will
>      continue to have the possibility to build a (e)glibc toolchain.
> 
> (1) and (2) represent a significant amount of work, so don't expect
> those things to be ready overnight.
> 

ok, thanks for the news, I was a bit worried that we had would have no 
support for self-compiled glibc toolchain at some point (that was the 
main reason I was using ct-ng)
