From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 23 Nov 2011 12:09:53 +0100
Subject: [Buildroot] Adding Microblaze support to Buildroot
In-Reply-To: <87sjlgplif.fsf@macbook.be.48ers.dk>
References: <4EBC554E.7050605@gmail.com>
 <4EBC5656.2010103@gmail.com>	<4EBD18F1.6020804@relinux.de>
 <4ECB62C8.6030301@relinux.de> <87sjlgplif.fsf@macbook.be.48ers.dk>
Message-ID: <4ECCD481.4030707@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 22.11.2011 10:14, schrieb Peter Korsgaard:
>>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:
>  Stephan> Hello all,
>
>  Stephan> is there an interest in adding the Microblaze architecture to
>  Stephan> buildroot?
>
> Yes, I would say so.
>
>  I'm more worrying about how much we need to patch individual
> packages to work on microblaze.
To which extend do you expect individual packages being tested on the
different architectures?

By now I have a busybox only configuration that can boot with the U-Boot
available from the Avnet website.

I can send a patch against buildroot's next branch if desired.

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
