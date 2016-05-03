From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 3 May 2016 21:23:50 +0200
Subject: [Buildroot] How to enable rtmp support in gst1-plugins-bad?
In-Reply-To: <5728F418.8080602@zacarias.com.ar>
References: <CAPeTicPDug8fDDk=_z7esK-txLUC0w36xPh+d3-b0FNGrOs_MA@mail.gmail.com>
 <20160503204603.66114582@gmx.net>
 <5728F418.8080602@zacarias.com.ar>
Message-ID: <20160503212350.5c4af295@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gustavo,

On Tue, 3 May 2016 15:55:20 -0300, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> On 03/05/16 15:46, Peter Seiderer wrote:
> 
> > Hello sonntex,
> >
> > On Tue, 3 May 2016 15:14:05 +0300, sonntex <sonntex@gmail.com> wrote:
> >
> >> I did not find rtmp support in gst1-plugins-bad. There is only rtp support.
> >> So, I think that it is a misprint. Is it? Patch looks like:
> >
> > No misprint, only a missing update  since version bump to 1.8.0.
> >
> > Rtp support was moved from gst-plugins-bad to gst-plugins-good (see [1]),
> > same with mpg123 support, moved from -bad to -ugly (see [2])...
> >
> > Time to do a re-check of the options for 1.8.x, but did not yet find the
> > time for it....
> >
> > Regards,
> > Peter
> >
> > [1] https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/configure.ac?id=f649e85bc9e6c6f52abcdd9fe1e5de670b0f580e
> > [2] https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/configure.ac?id=08d8aefcdaaf89ecb6dd53ec1e4f95cd42d01664
> 
> Hi Peter.
> Argh, i missed the move, probably because i looked into configure and/or 
> NEWS rather than commits/relnotes.
> Do you want to pick up these removals, moves and legacy or shall i?
> It would be good to have this sorted out for the upcoming release.

No problem (only a little work ;-) ), feel free to pick it up...

Regards,
Peter

> Thanks.
> Regards.
