From: phil.edworthy at renesas.com <phil.edworthy@renesas.com>
Date: Tue, 26 Jun 2012 08:22:32 +0100
Subject: [Buildroot] [PATCH] Add /dev/video static device nodes
In-Reply-To: <87395ldcre.fsf@macbook.be.48ers.dk>
References: <1340085953-24986-1-git-send-email-phil.edworthy@renesas.com>
 <87395ldcre.fsf@macbook.be.48ers.dk>
Message-ID: <OF45C63F13.90D97F79-ON80257A29.00283130-80257A29.002883FA@eu.necel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

> Subject: Re: [PATCH] Add /dev/video static device nodes
> Sent by: Peter Korsgaard <jacmet@gmail.com>
>
> >>>>> "Phil" == Phil Edworthy <phil.edworthy@renesas.com> writes:
>
>  Phil> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
>
> Committed, thanks.
>
> Please consider using devtmpfs instead though.
I use udev most of the time, but some customers/projects still use static dev nodes.

Thanks
Phil
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120626/e70c1a47/attachment.html>
