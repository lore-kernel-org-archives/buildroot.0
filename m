From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Feb 2015 00:33:54 +0100
Subject: [Buildroot] [PATCH 1/1] The mjpegtools programs are a set of
	tools that can do recording of videos and playback,
	simple cut-and-paste editing and the MPEG compression of audio and
	video under Linux.
In-Reply-To: <1422916506-3200-1-git-send-email-skenton@ou.edu> (Steve Kenton's
 message of "Mon, 2 Feb 2015 22:35:06 +0000")
References: <1422916506-3200-1-git-send-email-skenton@ou.edu>
Message-ID: <87lhkfga71.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steve" == Steve Kenton <skenton@ou.edu> writes:

Hi,

Normally we use something like:

mjpegtools: new package

As the first line of description for something like this.

 > http://mjpeg.sourceforge.net
 > Signed-off-by: Steve Kenton <skenton@ou.edu>

 > diff --git a/package/mjpegtools/mjpegtools.mk b/package/mjpegtools/mjpegtools.mk
 > new file mode 100644
 > index 0000000..34959265
 > --- /dev/null
 > +++ b/package/mjpegtools/mjpegtools.mk
 > @@ -0,0 +1,13 @@
 > +###############################################################################
 > +#
 > +# mjpegtools
 > +#
 > +###############################################################################
 > +
 > +MJPEGTOOLS_VERSION = 2.1.0
 > +MJPEGTOOLS_SITE = http://sourceforge.net/projects/mjpeg/files/mjpegtools/$(MJPEGTOOLS_VERSION)
 > +MJPEGTOOLS_DEPENDENCIES = jpeg
 > +MJPEGTOOLS_LICENSE = GPLv2

Most of the files contains the 'or (at your option) any later version',
so I changed this to GPLv2+.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
