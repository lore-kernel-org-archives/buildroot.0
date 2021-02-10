From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 10:04:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/sox: security bump to latest
 git commit
In-Reply-To: <20210203200049.1151409-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 3 Feb 2021 21:00:49 +0100")
References: <20210203200049.1151409-1-fontaine.fabrice@gmail.com>
Message-ID: <87zh0cnvir.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Bump to the latest git commit as this will fix the following CVEs:
 > git log|grep CVE
 >   sox-fmt: validate comments_bytes before use (CVE-2019-13590) [bug #325]
 >   fix possible null pointer deref in lsx_make_lpf() (CVE-2019-8357)
 >   fft4g: bail if size too large (CVE-2019-8356)
 >   fix possible overflow in lsx_(re)valloc() size calculation (CVE-2019-8355)
 >   fix possible buffer size overflow in lsx_make_lpf() (CVE-2019-8354)
 >   xa: validate channel count (CVE-2017-18189)
 >   aiff: fix crash on empty comment chunk (CVE-2017-15642)
 >   adpcm: fix stack overflow with >4 channels (CVE-2017-15372)
 >   flac: fix crash on corrupt metadata (CVE-2017-15371)
 >   wav: ima_adpcm: fix buffer overflow on corrupt input (CVE-2017-15370)
 >   wav: fix crash writing header when channel count >64k (CVE-2017-11359)
 >   hcom: fix crash on input with corrupt dictionary (CVE-2017-11358)
 >   wav: fix crash if channel count is zero (CVE-2017-11332)

 > - Tweak configuration options due to
 >   https://sourceforge.net/p/sox/code/ci/6ff0e9322f9891f5a6ac6c9b3bceffbfca16bec3
 > - libgsm is now an optional dependency since
 >   https://sourceforge.net/p/sox/code/ci/e548827ffcf4dffa7f21709b8e96b04b481c09b8
 > - Add patch to put back --disable-stack-protector

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
