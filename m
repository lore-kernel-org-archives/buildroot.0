From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jan 2014 09:00:28 +0100
Subject: [Buildroot] [PATCH 1/1] gst-ffmpeg: Use internal libav instead
 of external ffmpeg
In-Reply-To: <87lhyht3mx.fsf@dell.be.48ers.dk>
References: <BLU0-SMTP442A9DE801569E9B4917C36D9BE0@phx.gbl>
 <87lhyht3mx.fsf@dell.be.48ers.dk>
Message-ID: <20140129090028.01079137@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 15 Jan 2014 21:02:30 +0100, Peter Korsgaard wrote:

>  > +GST_FFMPEG_CONF_OPT = --with-ffmpeg-extra-configure="--cross-prefix=$(TARGET_CROSS)"
> 
> It seems like we atleast also need to pass --target-os=linux, otherwise
> configure fails:

Then if you pass --target-os=linux, probably the
gst-ffmpeg-uclibc.patch added by Bernd is no longer necessary?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
