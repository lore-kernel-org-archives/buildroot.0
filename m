From: Bogdan Radulescu <bogdan@nimblex.net>
Date: Sat, 25 Jan 2014 13:50:45 +0200
Subject: [Buildroot] Patchwork oldest patches cleanup #4 (deadline
	January 5)
In-Reply-To: <CAAXf6LXEKQP07Sfxd+7kJrw74uM94GR_WTF5_zOezus-9kcm7Q@mail.gmail.com>
References: <CAAXf6LWFAfs_i_NjBbD3RZ=Y0RDKftzwj-_8xKuqyYA=69PNsw@mail.gmail.com>
 <CAAXf6LVVi6d=xRjsqW8eSMAf1CpKyU-qUTQ2dbfCPU=EF__jcA@mail.gmail.com>
 <20140106130503.2df2a9ef@skate>
 <CAAXf6LUnqAYQZoQ9-npV0nyDezec__sfnZrvYJY0PouNujE3HQ@mail.gmail.com>
 <CAKu+J9340tMY2TfLwfJdh8Et=5ASJgxf4B4n_MYW0Z8u+yTbZg@mail.gmail.com>
 <CAAXf6LXHSES8Xv5PP6fAL5d9rGZWV2MFwe6MoGQsyj4aZx0ybw@mail.gmail.com>
 <CAAXf6LXEKQP07Sfxd+7kJrw74uM94GR_WTF5_zOezus-9kcm7Q@mail.gmail.com>
Message-ID: <CAKu+J91ABSiwc7onQf1-KCPH14-9s+Frqorm0mMaJkwpW5pkNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello guys,

Unfortunately I am not using buildroot at the moment and it would probably
be a while until I would be able to test and rebase this.
It would be great if you could have a look at my old patches and see what
can be reused from it.

What was wrong with http://patchwork.ozlabs.org/patch/207431/ ?

Best regards,
Bogdan


On Mon, Jan 20, 2014 at 10:28 PM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> Hi Bogdan,
>
> On Mon, Jan 20, 2014 at 4:48 PM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
> > Hi Bogdan,
> >
> > Sorry for the late reply...
> >
> > On Mon, Jan 6, 2014 at 11:48 AM, Bogdan Radulescu <bogdan@nimblex.net>
> wrote:
> >> Hi,
> >>
> >> Regarding the http://patchwork.ozlabs.org/patch/207431 patch.
> >> GStreamer switched from ffmpeg to libav a while ago and newer versions
> don't
> >> have the ffmpeg package.
> >> http://gstreamer.freedesktop.org/releases/gst-libav/0.11.90.html
> >>
> http://gstreamer.freedesktop.org/src/gst-ffmpeg/gst-ffmpeg-1.x-README.txt
> >>
> >> gst-ffmpeg was last updated almost two years ago.
> >>
> >> Even though irrelevant, the situation of ffmpeg and libav is explained
> here:
> >> http://blog.pkh.me/p/13-the-ffmpeg-libav-situation.html
> >>
> >> The patch was used in production so it's tested.
> >>
> >> I think it would be a step back if this patch is discarded.
> >>
> >
> > Thanks a lot for your feedback. The info you gave is very interesting.
> > In fact, it's the type of information that would be suitable for the
> > commit message, as it gives the rationale for the switch.
> >
> > Based on your feedback, I agree we shouldn't throw away this patch.
> > Would it be possible for you to rebase the patch based on latest
> > buildroot and resubmit? In the mean time some of the code changed, for
> > example the multimedia directory is removed now. If you have time, I
> > think this would be the fastest and best solution, as you are the
> > original author.
> >
> > Awaiting your feedback, I'll already mark it as 'Delegated to me', so
> > that the patch is not forgotten.
>
> Please have a look at this thread:
> http://lists.busybox.net/pipermail/buildroot/2014-January/087200.html
> It seems that there is a patch addressing the same issue but in a
> different way is already included in buildroot.
> It would be great if you and Bernd could check what is still needed
> from your patch.
>
> Thanks,
> Thomas
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140125/04653873/attachment.html>
