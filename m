From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Wed, 29 Jan 2014 19:33:20 +0100
Subject: [Buildroot] [PATCH 1/1] gst-ffmpeg: Use internal libav instead
	of external ffmpeg
References: <BLU0-SMTP442A9DE801569E9B4917C36D9BE0@phx.gbl>
 <87lhyht3mx.fsf@dell.be.48ers.dk> <20140129090028.01079137@skate>
Message-ID: <g4unrax5d3.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140129090028.01079137 at skate: 

> Then if you pass --target-os=linux, probably the
> gst-ffmpeg-uclibc.patch added by Bernd is no longer necessary?

Hi,

v2 of my patch was committed to git:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/74563

Changes v1 -> v2:
- replaced gst-ffmpeg-uclibc.patch with configure option --target-os=linux 
(Peter)

gst-ffmpeg-uclibc.patch was never added to git.

Regards, Bernd
