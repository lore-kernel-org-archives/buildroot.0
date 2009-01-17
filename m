From: danieljlaird at hotmail.com <danieljlaird@hotmail.com>
Date: Sat, 17 Jan 2009 21:41:48 -0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/cairo
In-Reply-To: <20090117200304.GB22848@zelow.no>
References: <20090114133637.93DCB769A1@busybox.osuosl.org><COL102-DS153B476E9992200EBB96B2DCD60@phx.gbl><1231944617.6465.10.camel@sven>
	<20090117095524.GA11505@zelow.no><87k58t3nkb.fsf@macbook.be.48ers.dk>
	<20090117200304.GB22848@zelow.no>
Message-ID: <COL102-DS212985CAEF7E65DA88999BDCD50@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I agree with you,
We could also do the same with --enable-static based upon BR2_ENABLE_STATIC.

This would be a really good thing and remove yet more common options, non 
auto-tooled ones stay as they are and get updated eventually

Dan

--------------------------------------------------
From: "Thomas Lundquist" <lists@zelow.no>
Sent: Saturday, January 17, 2009 8:03 PM
To: <buildroot@uclibc.org>
Subject: Re: [Buildroot] svn commit: trunk/buildroot/package/cairo

> On Sat, Jan 17, 2009 at 05:27:32PM +0100, Peter Korsgaard wrote:
>>
>>  Thomas> I'll just add it to the configure part in Makefile.autotools.in, 
>> configure seems to
>>  Thomas> ignore it if it's not needed instead of complaining.
>>  Thomas> And I'm pretty sure noone cares about html documentation anyway.
>>  Thomas> Both --without-html-dir and --disable-gtk-doc
>>  Thomas> And I'll connect it to BR2_HAVE_DOCUMENTATION
>>
>> Sounds like a good idea - Thanks.
>
> It seems to work aswell. I guess we should/could do the same thing
> with DISABLE_LARGEFILE and DISABLE_NLS.
>
> The non-autotools .mk's can stay as they are for now.
>
>
> Thomas.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
