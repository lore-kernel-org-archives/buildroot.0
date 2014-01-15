From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Jan 2014 20:33:22 +0100
Subject: [Buildroot] [PATCH v3 1/2] ffmpeg: bump to version 1.2.4
In-Reply-To: <kkviqaxprn.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Wed, 15 Jan 2014 19:12:04 +0100")
References: <BLU0-SMTP2638CE0203ADFD44E6B8961D9CB0@phx.gbl>
 <CAHXCMM+SfJ0j1vUTyHv7c2VbL9F1BimMcZD7YcfqXbOPmasssA@mail.gmail.com>
 <kkviqaxprn.ln2@ID-313208.user.individual.net>
Message-ID: <87ppntt4zh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

Hi,

 > configure: Using system-installed FFMpeg code
 > configure: WARNING:
 >   ======================================================================
 >    WARNING: you have chosen to build gst-ffmpeg against a random
 >    external version of Libav instead of building it against the tested
 >    internal Libav snapshot that is included with gst-ffmpeg.

 > Currently I am testing a patch for gst-ffmpeg which uses "the tested 
 > internal Libav snapshot that is included with gst-ffmpeg". This should fix 
 > the problem.

Yes, we originally used the system ffmpeg to save rootfs space if you
needed ffmpeg for anything else - But with gst-ffmpeg (0.10.x) being
dead upstream I don't think it makes sense to block ffmpeg upgrades on this.

-- 
Bye, Peter Korsgaard
