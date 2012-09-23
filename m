From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 23 Sep 2012 19:53:58 +0200
Subject: [Buildroot] [git commit] xdriver_x86-driver-intel: bump version
In-Reply-To: <20120923174302.18d54928@skate> (Thomas Petazzoni's message of
 "Sun, 23 Sep 2012 17:43:02 +0200")
References: <20120922194153.43B029967A@busybox.osuosl.org>
 <20120923174302.18d54928@skate>
Message-ID: <87d31caamh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Peter Korsgaard,
 Thomas> On Sat, 22 Sep 2012 21:34:54 +0200, Peter Korsgaard wrote:

 >> -XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.10.0
 >> +XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.13.0
 >> XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
 >> XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
 >> XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES

 Thomas> I haven't looked exactly, but it seems that the patches have been
 Thomas> removed, so maybe the AUTORECONF is no longer useful here?

No, there's still the cross compile patch. Strangely enough we didn't
get the 2.9 patch removed back when the version was bumped to 2.10 (but
it didn't get applied anymore because of the 2.10 patch).

The 2.10 patch is still needed for 2.13.

-- 
Bye, Peter Korsgaard
