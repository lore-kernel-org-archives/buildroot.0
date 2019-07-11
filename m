From: Vered Kalef <vered.kalef@gmail.com>
Date: Thu, 11 Jul 2019 14:49:56 +0300
Subject: [Buildroot] How do I enable webrtc as part of external
 gstreamer, in buildroot
In-Reply-To: <7bed35ef-501b-c318-ef26-02eeed8484ad@mind.be>
References: <CADNjvP-VYgO7ctGsOjZxudkA7k6PzT4FNt+JRACmUV6=bh_E=Q@mail.gmail.com>
 <20190704202528.63f7d667@gmx.net>
 <CADNjvP_HU1+D+LXwVtVosxpvDiUGZC=uEUCET10RpiG+oVn63Q@mail.gmail.com>
 <20190707204022.65affaec@gmx.net>
 <CADNjvP8jLnPK7DvDtpacTCn2g=DowwPr-C+KX7649aenVutaDg@mail.gmail.com>
 <7bed35ef-501b-c318-ef26-02eeed8484ad@mind.be>
Message-ID: <CADNjvP_EsQTYYBonamJFuHPRpz1_9_VtkNsaAevZEbEb+RKOjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All
Thank you very much for your help!!
I managed to install webrtc with libnice 0.1.14, both as gstreamer external
components on buildroot!!
I still don't see video because I fail with exception
on g_signal_emit_by_name(webrtc, "get-transceivers", &transceivers).
But I think it is better to open a new mailing list on that, right?
although I remember I read something about it, so I'll first google it.
Much appreciated!
Vered

On Tue, Jul 9, 2019 at 8:01 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 08/07/2019 14:30, Vered Kalef wrote:
> > This file made the difference. It seems the problem is an old version of
> > libnice, it should be greater than 0.1.14, so, I think I'll upgrade to
> buildroot
> > 2018.11, which holds libnice 0.1.14
> > and create the external gstreamer with webrtc enabled as you've done in
> version
> > 2019.5.
>
>  If you can anyway upgrade buildroot as a whole (which is the safer
> option),
> then it's better to upgrade to either 2019.05 (which already contains
> gst-webrtc
> support) or to 2019.02 (because that's an LTS release).
>
>  Regards,
>  Arnout
>
> > In your opinion will it do the work?
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190711/123e4c5f/attachment.html>
