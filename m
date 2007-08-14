From: vano <ivan.kuten@promwad.com>
Date: Tue, 14 Aug 2007 08:37:28 -0100
Subject: [Buildroot] TinyX woes...
In-Reply-To: <12138977.post@talk.nabble.com>
References: <1187036974.6223.17.camel@elrond.sweden.atmel.com>	<46C0C586.9060406@promwad.com>
	<12138977.post@talk.nabble.com>
Message-ID: <46C177D8.2050908@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hebbar wrote:

> Hi Ivan 
> 
>  I am also working on ARM on arm926ejs. Since 3 weeks i am finding it too
> difficult to get ahead of building libglib2. it stops with error on
> libintl.h which is deleted by uclibc. I really want to build a gtk with
> buildroot but its to going ahead. i enabled locale & wchar and used
> uclinc-9.29.0-wchar.config but it still failed at libglib2 stage. so can u
> share ur buildroot config file & uclinc config files and details of any
> changes u have done with buildroot. this will really be a gr8 help to me.
> also what buildroot version or snapshot did u try.
> 

Please post you error messages and config.log regarding glib2.
I did nothing special except enabling locale.

If it helps my uclibc config in the attachment.

BR,
Ivan


> Regards
> Gururaja
> 
> Regards
> Gururaja

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: uclibc-config-locale
Url: http://busybox.net/lists/buildroot/attachments/20070814/d7986349/attachment.diff 
