From: Yoann Sculo <yoann.sculo@gmail.com>
Date: Thu, 23 Sep 2010 17:53:06 +0200
Subject: [Buildroot] Introduction of mpd into buildroot ?
In-Reply-To: <20100923000922.57de215a@surf>
References: <AANLkTimZa473TfBgFhoXMhR_fiusyduFvdo-YuMzs84T@mail.gmail.com>
	<20100923000922.57de215a@surf>
Message-ID: <AANLkTimf+bXdea1VWQhdGSA3Am9crk0Vt1imf=58aMqM@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for your answers.
I will patch mpd and libmad like you say. You're right, It will actually be
better to solve this problem at the source.
Or at least understand why mad.pc is not packaged into libmad archive
You should hear from me soon :)

Yoann Sculo


2010/9/23 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Hello Yoann,
>
>
> On Wed, 22 Sep 2010 14:45:49 +0200
> Yoann Sculo <yoann.sculo@gmail.com> wrote:
>
> > First, I'd like to have your opinion about pkg-config files.
> libmad-0.15.1
> > for example doesn't provide the small file mad.pc
> > This is surprising, It does'nt seem to be distributed with libmad
> sources.
> > The probem is I need actually this file to compile mpd. Adding it
> manually,
> > works fine.
> >
> > So I would be inclined to create a patch into package/multimedia/libmad
> to
> > add this file during mpd installation. Is it the better way to do this ?
>
> Yes, sounds good. An even better thing would be to create such a patch
> *and* to submit it to the upstream libmad project so that hopefully a
> future version of libmad will contain the pkg-config file.
>
> > Well, if mpd has never been added into buildroot I'm interested to work
> on
> > it.
>
> I haven't heard of any effort to package mpd, so feel free to work on
> it!
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100923/47c57be0/attachment.html>
