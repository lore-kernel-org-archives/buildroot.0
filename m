From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 11:54:37 +0200
Subject: [Buildroot] [PATCH v2,1/1] libv4l: fix build with sdl2_image
In-Reply-To: <20180630184032.31750-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 30 Jun 2018 20:40:32 +0200")
References: <20180630184032.31750-1-fontaine.fabrice@gmail.com>
Message-ID: <87in5bft42.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > sdlcam test includes jpeglib.h so add a patch to disable it if jpeg is
 > disabled

 > Fixes:
 >  - http://autobuild.buildroot.net/results/1eded8b44cc369550566c6ce0b3c042f1aec8d44

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1->v2 (after review of Thomas Petazzoni):
 >  - Update patch to use HAVE_JPEG instead of adding --disable-tests

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
