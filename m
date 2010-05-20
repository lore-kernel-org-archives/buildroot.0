From: Bill Borton <security@conwin.com>
Date: Thu, 20 May 2010 08:46:31 -0500
Subject: [Buildroot] Compiling host-mtd 1.3.1 error: ld: cannot find
	-lubi
In-Reply-To: <87632jy6y8.fsf@macbook.be.48ers.dk>
References: <20100519150639.0062a6ae@snot.conwin.com>
	<87632jy6y8.fsf@macbook.be.48ers.dk>
Message-ID: <20100520084631.36349dc8@snot.conwin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 May 2010 22:25:51 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:
> >>>>> "Bill" == Bill Borton <security@conwin.com> writes:
> 
>  Bill> make[1]: Leaving directory `/home/drumgod/space1/atmel_linux/buildroot/from_uclibc/5-19-10/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1'
>  Bill> make: *** [/home/drumgod/space1/atmel_linux/buildroot/from_uclibc/5-19-10/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/.stamp_built] Error 2
> 
>  Bill> I have tried many different configuration combinations but haven't
>  Bill> been able to get past this point.  Can someone please point me in
>  Bill> the right direction?
> 
> That sounds like the parallel make issue recently reported - Does it
> work for you if you change all instances of $(MAKE) in
> package/mtd/mtd.mk to $(MAKE1) ?
> 
> -- 
> Bye, Peter Korsgaard


That did it. Thank you sir!

-Bill
