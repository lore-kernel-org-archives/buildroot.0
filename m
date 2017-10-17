From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 17 Oct 2017 15:02:39 +0000
Subject: [Buildroot] [PATCH] qt: Allow enabling of QtWebKit with GCC 6+
In-Reply-To: <87d15mkv01.fsf@dell.be.48ers.dk>
References: <20170922125003.32618-1-didin@synopsys.com>
 <87d15mkv01.fsf@dell.be.48ers.dk>
Message-ID: <4881796E12491D4BB15146FE0209CE6467F9F640@DE02WEMBXB.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, Thomas,

> -----Original Message-----
> From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter Korsgaard
> Sent: Tuesday, October 17, 2017 12:02 PM
> To: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: buildroot at busybox.net; Thomas Petazzoni <thomas.petazzoni@free-electrons.com>; Alexey Brodkin
> <Alexey.Brodkin@synopsys.com>
> Subject: Re: [PATCH] qt: Allow enabling of QtWebKit with GCC 6+
> 
> >>>>> "Evgeniy" == Evgeniy Didin <Evgeniy.Didin@synopsys.com> writes:
> 
>  > Building Qt with QtWebKit on configuration step there is
>  > a check which disables QtWebKit build with GCC 6+.
>  > Back in the day nobody thought about building Qt with GCC
>  > version greater than 5.x. And now with modern GCCs like
>  > 6.x and 7.x this assumption gets in the way.
> 
>  > Given in Buildroot today we don't have GCC older than 4.9
>  > it should be safe to remove now meaningless check completely
>  > by adding patch to qt.
> 
>  > Signed-off-by: Evgeniy Didin <didin@synopsys.com>
>  > Cc: Alexey Brodkin <abrodkin@synopsys.com>
>  > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Committed to 2017.08.x, thanks.

I see that commit was applied on 2 "LTS" branches already which is definitely good.
But my question is are there any formal rules and guidelines for patches to be
cherry-picked onto LTS branches? Something like https://github.com/torvalds/linux/blob/master/Documentation/process/stable-kernel-rules.rst?

Probably I just missed that as usual :)

-Alexey
