From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 2 Dec 2016 11:31:59 +0000
Subject: [Buildroot] [PATCH next 10/10] gstreamer1/gst1-imx: bump
	version to 0.12.3
In-Reply-To: <87h96n9tqv.fsf@dell.be.48ers.dk>
References: <20161130112518.36300-1-Vincent.Riera@imgtec.com>
 <20161130112518.36300-10-Vincent.Riera@imgtec.com>
 <87h96n9tqv.fsf@dell.be.48ers.dk>
Message-ID: <95d31271-4b58-df75-89cd-9a7e95204f52@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 01/12/16 22:20, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
> 
>  > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>  > ---
>  >  package/gstreamer1/gst1-imx/gst1-imx.hash | 2 +-
>  >  package/gstreamer1/gst1-imx/gst1-imx.mk   | 2 +-
>  >  2 files changed, 2 insertions(+), 2 deletions(-)
> 
>  > diff --git a/package/gstreamer1/gst1-imx/gst1-imx.hash b/package/gstreamer1/gst1-imx/gst1-imx.hash
>  > index d345deb..b0124aa 100644
>  > --- a/package/gstreamer1/gst1-imx/gst1-imx.hash
>  > +++ b/package/gstreamer1/gst1-imx/gst1-imx.hash
>  > @@ -1,2 +1,2 @@
>  >  # locally computed hash
>  > -sha256 a75f8bc3219fa3c62637f443cef0196c9eafb90aaa5af094847d007124895822  gst1-imx-0.12.2.tar.gz
>  > +sha256 a75f8bc3219fa3c62637f443cef0196c9eafb90aaa5af094847d007124895822  gst1-imx-0.12.3.tar.gz
> 
> Ehh, did you even test this?

yes, I did a build test for the complete gstreamer1 (selecting all
packages).

> You didn't update the hash to match the new tarball, and you also didn't
> remove the now upstreamed patch.
> 
> I've pushed a fix for both issues, but please test your changes better
> in the future.

I probably made a mistake when creating the patches, but I did build
tested it.

I'll be more careful in the future. Sorry about that.

Vincent


> 
