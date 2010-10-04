From: anthony henderson <development@fair-games.com>
Date: Mon, 4 Oct 2010 21:51:11 +0100
Subject: [Buildroot] can't resolve symbol 'atexit'
In-Reply-To: <20101004190204.0405bdc3@surf>
References: <AANLkTinDdVF2W2sgU24qBHfDVztgJ-kEy=FQyeuE7fyH@mail.gmail.com>
	<20101004190204.0405bdc3@surf>
Message-ID: <AANLkTikx8G8ovJqCtbiM04XRbvti03oOtiG5AeHmp-=3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks,
I thought that might be the case, now to try to get them to give the
source...

On 4 October 2010 18:02, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello Anthony,
>
> On Mon, 4 Oct 2010 14:26:53 +0100
> anthony henderson <development@fair-games.com> wrote:
>
> > I've got busy box working well with my software, however I've tried
> > to run an exe provided by the board vendor and get the following
> > error "can't resolve symbol 'atexit'" is there a way to fix this?
> > It's a bit hard to find details on google, I think it's to do with
> > different versions of uClibc?  However when I've opened buildroot and
> > looked in toolchain -> uClibc I can't see any options to do with
> > atexit.  Can anyone point me in the right direction, thanks.
>
> You cannot expect a random binary taken from your vendor to work with a
> random version/configuration of uClibc. Basically, you need to get the
> source code for this application and recompile it with the toolchain
> used to build your embedded system.
>
> The uClibc library does not provide a stable ABI, both accross versions
> and configurations.
>
> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Regards Tony


NOTE: This message is intended solely for the use of the individual or
organization to whom it is addressed. It may contain privileged or
confidential information. If you have received this message in error, please
notify the originator immediately. If you are not the intended recipient,
you should not use, copy, alter, or disclose the contents of this message.
All information or opinions expressed in this message and/or any attachments
are those of the author and are not necessarily those of Fair Games UK LTD
or its affiliates. Fair Games UK LTD accepts no responsibility for loss or
damage arising from its use, including damage from virus.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101004/800c95cd/attachment-0001.html>
