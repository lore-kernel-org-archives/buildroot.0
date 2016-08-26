From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Fri, 26 Aug 2016 10:00:45 -0400
Subject: [Buildroot] [PATCH] board: add support for ZII VF610
	Development Board
In-Reply-To: <20160826154418.470886f2@free-electrons.com>
References: <20160825190022.8461-1-vivien.didelot@savoirfairelinux.com>
 <20160826110008.53f339a6@free-electrons.com> <87a8fz4phc.fsf@ketchup.mtl.sfl>
 <20160826154418.470886f2@free-electrons.com>
Message-ID: <874m674oky.fsf@ketchup.mtl.sfl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

>> > Is this board publicly available?
>> >
>> > Your patch looks good and perfectly matches the Buildroot way of having
>> > minimal defconfigs. But if the board is not publicly available, I'm not
>> > sure we want a defconfig for it in Buildroot.  
>> 
>> This board is quite specific and not meant to be sold to the public,
>> hovewer the Device Tree is opened and already mainlined. It is used as a
>> reference platform for DSA with its 3 interconnected Marvell switches.
>> 
>> The bootloader and kernel support are available, so I saw no reason not
>> to glue that all together. Given what you said, we can forget about this
>> board. At least, its support is now in the wild ;-)
>
> I don't know how much we want defconfig for such platforms in
> Buildroot, but my opinion on that is definitely not clear cut. So let's
> see what others have to say about this.
>
> That being said, shall I gather from this that some products from
> Zodiac Aerospace are using Buildroot? :-)

AFAICT, I don't think so... Today it's just me using Buildroot for my
personal development.

Thanks,

        Vivien
