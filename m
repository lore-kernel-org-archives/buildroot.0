From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 25 Feb 2014 21:19:03 +0100
Subject: [Buildroot] [PATCH] gstreamer-imx: new package
In-Reply-To: <877g8jj6or.fsf@dell.be.48ers.dk>
References: <1393278657-18919-1-git-send-email-ps.report@gmx.net>
 <20140225180657.GA3567@free.fr> <877g8jj6or.fsf@dell.be.48ers.dk>
Message-ID: <CAHXCMMJq_T08OYxcfBqwtpTHn=kba_RzoEgv=wPLM7LzGSASLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 25, 2014 at 9:09 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>  > Peter, All,
>  > On 2014-02-24 22:50 +0100, Peter Seiderer spake thusly:
>  >> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
>  > How is gstreamer-imx different from gst-fsl-plugins?
>
>  >> From package/gstreamer/gst-fsl-plugins/Config.in:
>
>  >     GStreamer plugins for hardware-accelerated audio and video
>  >     parsers and codecs on i.MX platforms. [...]
>
>  > So, it seems we already have a package that handles accelerated
>  > audio/video decoding on i.MX.
>
> Yes, but gst-fsl-plugins is for the deprecated gstreamer 0.10.x series,
> this is for gstreamer 1.x.
>
>  >> diff --git a/package/gstreamer1/gstreamer-imx/Config.in b/package/gstreamer1/gstreamer-imx/Config.in
>
> Which is also why it is under package/gstreamer1. Perhaps the package
> should be called gstreamer1-imx to make it completely clear.

I agree with the suggested rename

Regards,

-- 
Samuel
