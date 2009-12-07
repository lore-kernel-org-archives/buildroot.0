From: Joachim Pihl <jpihl@nevion.com>
Date: Mon, 7 Dec 2009 09:52:50 +0100
Subject: [Buildroot] Strange MTD problem (ARM)
In-Reply-To: <873a3nqj1q.fsf@macbook.be.48ers.dk>
References: <op.u4j7ikxlyqa4qb@jap> <873a3nqj1q.fsf@macbook.be.48ers.dk>
Message-ID: <op.u4j8accoyqa4qb@jap-lappis.nevion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 07 Dec 2009 09:34:25 +0100, Peter Korsgaard <jacmet@uclibc.org>  
wrote:

>>>>>> "Joachim" == Joachim Pihl <jpihl@nevion.com> writes:
>
>  Joachim> This may not be related to Buildroot, but I am completely  
> stumped:
>
> I take it that this is with busybox cp and not coreutils? You might have
> better luck asking on the busybox list.

This is with busybox, yes. Will repost to the busybox list and see what  
comes up.


>  Joachim> # cp mtdblock2 /dev/mtdblock2
>
> So you want cp to detect that the target is a special file and not
> unlink it, but instead do something like cat mtdblock2 >/dev/mtdblock2 ?
>
> Why not simply use cat instead?

Actually, I have never thought of that, but will that start from the  
beginning of the MTD block? We have used "cp mtdblock2 /dev/mtdblock2" for  
7 years in the product, this is the first time I have seen it fail.


-- 
Joachim Pihl
Senior R&D Engineer
Nevion

Tel: +47 33 48 94 66
Fax: +47 33 48 99 98
Mobile: +47 91 33 98 91
jpihl at nevion.com
www.nevion.com

-----------------------------------
The Global Video Transport Leader
-----------------------------------
