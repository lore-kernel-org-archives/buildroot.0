From: Conny Marco =?ISO-8859-1?Q?Menebr=F6cker?= <menebroecker@web.de>
Date: Sat, 17 May 2008 18:57:39 +0200
Subject: [Buildroot] How to add a new package?
In-Reply-To: <20080515142800.234b4a9f@crazy>
References: <1210695461.3289.16.camel@localhost>
	<1CF6EDDF0820924DA43C9A52FE7325950B6CA51E@MI8NYCMAIL17.Mi8.com>
	<1210796316.3291.5.camel@localhost>  <20080515142800.234b4a9f@crazy>
Message-ID: <1211043459.3289.2.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Donnerstag, den 15.05.2008, 14:28 +0200 schrieb Thomas Petazzoni:
> Le Wed, 14 May 2008 22:18:36 +0200,
> Conny Marco Menebr?cker <menebroecker@web.de> a ?crit :
> 
> > Thanks for the answer, but I had added the line before.
> > Have I to run something else, than 'make menuconfig'?
> > Have I to run 'make clean' or something else?
> 
> No, just "make menuconfig". If the menu entry doesn't appear, it's
> probably because your Config.in changes are not correct.
Thanks, that was a good hint. I forgot a letter at the 'depends on'
line.
Because there was no package selected with this wrong name, I couldn't
see it in the configuration.

> 
> Can you send the patch corresponding to your Buildroot modifications ?
> That way, instead of trying to guess in the dark, we could actually
> help you.
> 
> Sincerly,
> 
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-- 
Don't send me an personal e-mail since it will be filtered by my
spamfilter.
