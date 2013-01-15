From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 15 Jan 2013 14:15:56 +0100
Subject: [Buildroot] CANBUs Quesetion
In-Reply-To: <002d01cdf30f$46f45890$d4dd09b0$@co.uk>
References: <001b01cdf015$9b34ca40$d19e5ec0$@co.uk>	<20130111171429.79490168@skate>	<004501cdf24a$009f6440$01de2cc0$@co.uk>	<50F40BF3.5080106@relinux.de>	<004b01cdf26d$ea1d2cb0$be578610$@co.uk>
 <20130114195101.12914c2d@skate> <002d01cdf30f$46f45890$d4dd09b0$@co.uk>
Message-ID: <50F5568C.8060007@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 15.01.2013 11:58, schrieb Ted Wood:
>>> How to do what? Sorry but your question is far from being precise
>>> enough to be understood.
> I'm really not sure how to make it any clearer than I did with my previous
> post. My response to Stephan Hoffman's suggestion that I integrate the
> driver into my kernel source and make a kernel patch out of it was to ask
> where I might find information on this. There is nothing in the Buildroot
> manual about it.
Ted,

kernel hackng is not a part of buildroot's scope.

I do not know about a good tutorial or so.

Maybe you want to read "Linux Device Drivers"
http://shop.oreilly.com/product/9780596005900.do and/or the information
provided on http://www.kernel.org/ and http://kernelnewbies.org/.

If you look at the driver's source code it should become clear. If it
does not you might want to think whether paying for commercial
assistance might be cheaper than learning it all.

You could also provide a link to the driver's source code, maybe someone
wants to have a look at it and give you the hints you need.

Stephan
>
> I'm not asking to be told how to do it, I'm asking for a pointer to where to
> find the information. As someone new to Embedded Linux I've been struggling
> to filter the huge volume of irrelevant and outdated material that Google
> throws up.  
>
> But thank you for the guide to asking questions. I shall bear it in mind in
> future.
>
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
