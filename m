From: Joachim Pihl <jpihl@nevion.com>
Date: Mon, 7 Dec 2009 10:17:14 +0100
Subject: [Buildroot] Strange MTD problem (ARM)
In-Reply-To: <87pr6rp3fn.fsf@macbook.be.48ers.dk>
References: <op.u4j7ikxlyqa4qb@jap> <873a3nqj1q.fsf@macbook.be.48ers.dk>
	<op.u4j8accoyqa4qb@jap-lappis.nevion.com>
	<87pr6rp3fn.fsf@macbook.be.48ers.dk>
Message-ID: <op.u4j9e0v8yqa4qb@jap-lappis.nevion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 07 Dec 2009 09:57:00 +0100, Peter Korsgaard <jacmet@uclibc.org>  
wrote:

>>>>>> "Joachim" == Joachim Pihl <jpihl@nevion.com> writes:

>  Joachim> We have used "cp mtdblock2 /dev/mtdblock2" for 7 years in the
>  Joachim> product, this is the first time I have seen it fail.
>
> OK. FYI, busybox nowadays also has the flashcp applet from mtd-utils
> which does the right thing.

Thanks, that solved the problem. Will simply replace "cp mtdblock2  
/dev/mtdblock2" with "flashcp mtdblock2 /dev/mtd2" and all is well.


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
