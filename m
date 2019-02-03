From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Feb 2019 15:40:44 +0100
Subject: [Buildroot] [PATCH v2 4/6] ffmpeg: bump to version 4.1.
 ffserver is not supported anymore.
In-Reply-To: <mfmiifx78d.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Sun, 03 Feb 2019 09:48:22 +0100")
References: <20190131121526.11816-1-lpdev@cordier.org>
 <20190131121526.11816-5-lpdev@cordier.org>
 <20190202155400.6547fba9@windsurf>
 <mfmiifx78d.ln2@ID-313208.user.individual.net>
Message-ID: <87a7jdx7df.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Am Sat, 02 Feb 2019 15:54:00 +0100 schrieb Thomas Petazzoni:
 >> I'd like to hear from Bernd about this ffmpeg bump. If I remember well,
 >> major ffmpeg bumps are typically breaking some APIs, causing build
 >> issues with packages that use ffmpeg.

 > Hi Thomas,

 > afaik the only package left over to be fixed before we bump ffmpeg to 4.x 
 > is gstreamer1/gst1-libav, see my patch:
 > http://patchwork.ozlabs.org/patch/962138/

 > In the meantime upstream released version 1.15.1 as unstable release so 
 > we have two choices: Apply my patch or bump gstreamer1 to an unstable 
 > version.

I would prefer to stick with the stable versions if possible.

-- 
Bye, Peter Korsgaard
