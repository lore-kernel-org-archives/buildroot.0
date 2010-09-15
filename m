From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Sep 2010 19:07:25 +0200
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <SNT119-W19D1DBCD197B0F139037EA82790@phx.gbl>
References: <29591683.post@talk.nabble.com> <29641651.post@talk.nabble.com>
	<SNT119-W3039C61443ADF5E85164F582730@phx.gbl>
	<SNT119-W26A1FD2D4331730D164D2C82770@phx.gbl>
	<20100913102031.03481d63@surf>
	<SNT119-W9D3C2902126B58DEE9A1282770@phx.gbl>
	<87mxrm6lrc.fsf@macbook.be.48ers.dk>
	<SNT119-W4750F1F26C2613C40FB5C82790@phx.gbl>
	<20100915133124.604f8b74@surf>
	<SNT119-W19D1DBCD197B0F139037EA82790@phx.gbl>
Message-ID: <20100915190725.459aaca8@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Johny,

On Wed, 15 Sep 2010 12:39:37 +0000
Johnny Beardsmore <jny0@hotmail.com> wrote:

> What does creating this file allow me to do (other than apply the
> previously mentioned e2fsck to it)?  I assume I'll still be
> transfering all the same stuff to the target, but do I also include
> this file, and if so, where should it be located? 

This file is the image of an ext2 filesystem, so you can just copy it
raw to a USB key or the partition of a USB key, and then just mount the
USB key. See 

I don't want to be/seem rude, but it seems you lack some really basic
embedded Linux knowledge. May I suggest to order and read a book such
as Building Embedded Linux Systems [1] ?

That would really help you understanding what is going on.

Also you are not explaining what you are trying to achieve *in the
end*. It might be that generating an ext2 filesystem image is totally
useless for what you're trying to do.

Regards,

Thomas

[1] http://oreilly.com/catalog/9780596529680
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
