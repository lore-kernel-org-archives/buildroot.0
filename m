From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jan 2014 13:05:03 +0800
Subject: [Buildroot] Patchwork oldest patches cleanup #4 (deadline
	January 5)
In-Reply-To: <CAAXf6LVVi6d=xRjsqW8eSMAf1CpKyU-qUTQ2dbfCPU=EF__jcA@mail.gmail.com>
References: <CAAXf6LWFAfs_i_NjBbD3RZ=Y0RDKftzwj-_8xKuqyYA=69PNsw@mail.gmail.com>
 <CAAXf6LVVi6d=xRjsqW8eSMAf1CpKyU-qUTQ2dbfCPU=EF__jcA@mail.gmail.com>
Message-ID: <20140106130503.2df2a9ef@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 5 Jan 2014 11:21:33 +0100, Thomas De Schampheleire wrote:

> > libatomic_ops version update 7.3alpha2 old version 1.2 does not
> > compiles with modern gcc and utils
> > Alexander Khryukin <alexander@mezon.ru>
> > http://patchwork.ozlabs.org/patch/198133
> 
> No feedback, marked as rejected.

I think bumping the version of a package is often useful, so I'm not
sure I would mark this patch as rejected. Or if no one is pushing to
bump libatomic_ops, then we should just assume no one cares, and
therefore there's no point in keeping the patch around?

> > [07/10] libffi: make thread support optional
> > Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > http://patchwork.ozlabs.org/patch/199883
> 
> No feedback, marked as rejected.

It's weird because I don't see libffi build failures in the
autobuilders, even though there is one no thread ARM toolchain in the
configurations.

> > [4/4] gstreamer: replace gst-ffmpeg with gst-libav
> > bogdan at nimblex.org
> > http://patchwork.ozlabs.org/patch/207431
> 
> No feedback, rejected.

I'm a little bit concerned about how we reject patches here. Maybe
replacing gst-ffmpeg by gst-libav makes sense and should be done? If we
don't keep the patch around, we'll have no way to remember that it
should be done at some point in the future. I admit that by doing
this, we'll never shrink the list of pending patches, but I have the
feeling that we might be missing useful ideas.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
