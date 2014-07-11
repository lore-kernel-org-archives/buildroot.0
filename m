From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Thu, 10 Jul 2014 20:53:55 -0700
Subject: [Buildroot] i.MX 3.10.17 updates
In-Reply-To: <CADCpmyMRiYGQesj9jsafvfLgV3o3cBJG6QGx3N8KKW2ix7PZDw@mail.gmail.com>
References: <53BEDF43.9020401@boundarydevices.com>	<726E1478A66AD646A8419562133B4C3D0EB71DFB@mxadeneo.adeneo-embedded.us>	<CADCpmyOhiNWv31pdUi5=Q3n-vD9jiFO_8d3v61ZqAa6yaxLy9A@mail.gmail.com>	<53BEEF7D.4020208@boundarydevices.com>	<20140710200111.GG28300@free.fr>
 <CADCpmyMRiYGQesj9jsafvfLgV3o3cBJG6QGx3N8KKW2ix7PZDw@mail.gmail.com>
Message-ID: <53BF5FD3.9080607@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Gary,

On 07/10/2014 05:11 PM, Gary Bisson wrote:
> Eric, All,
> 
> On Thu, Jul 10, 2014 at 1:01 PM, Yann E. MORIN <yann.morin.1998@free.fr
> <mailto:yann.morin.1998@free.fr>> wrote:
> 
>     Eric, All,
> 
>     On 2014-07-10 12:54 -0700, Eric Nelson spake thusly:
>     > On 07/10/2014 12:01 PM, Gary Bisson wrote:
>     > > Resend my e-mail with the correct e-mail address so the
>     mailing-list can
>     > > see it:
>     > >
>     > > On Thu, Jul 10, 2014 at 11:53 AM, BISSON Gary
>     > > <gbisson at adeneo-embedded.us <mailto:gbisson@adeneo-embedded.us>
>     <mailto:gbisson@adeneo-embedded.us
>     <mailto:gbisson@adeneo-embedded.us>>> wrote:
>     > >
>     > >     Hi Eric,
>     > >
>     > >     Please find attached both my buildroot and my kernel config.
>     > >     I was using a code sourcery 2013.05 toolchain for my testing.
>     > >     Regarding GStreamer, might just be a missing plugin not
>     necessarily
>     > >     related to the fsl one. Hope my config will help.
>     > >
>     >
>     > This is the config I started with, so I suspect that you'll also have
>     > difficulties playing video.
>     >
> 
> 
> I confirm that your stream wasn't playing because of some gstreamer
> missing plugins. Please find attached a new configuration that enables
> matroska plugin (webm format) and autodetect (for playbin) among others.
>
> The test has been run on a Sabrelite connected to a 1080p hdmi display:
> # gplay tears_of_steel_1080p.webm
> # gplay trailer_1080p_h264_mp3.avi
>

I'll try this out tomorrow.

I got sidetracked by something else that's missing: the libfslcodec
package needs an update to support Hardfp.

Regards,


Eric
