From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 4 Feb 2021 19:02:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/sox: security bump to latest
 git commit
In-Reply-To: <8735ybbvhf.fsf@dell.be.48ers.dk>
References: <20210203200049.1151409-1-fontaine.fabrice@gmail.com>
 <8735ybbvhf.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W814X3hcKWqYpPHmu040Waxhs4hH4po0a5MCufE3Hk5YDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le jeu. 4 f?vr. 2021 ? 18:20, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > Bump to the latest git commit as this will fix the following CVEs:
>  > git log|grep CVE
>  >   sox-fmt: validate comments_bytes before use (CVE-2019-13590) [bug #325]
>  >   fix possible null pointer deref in lsx_make_lpf() (CVE-2019-8357)
>  >   fft4g: bail if size too large (CVE-2019-8356)
>  >   fix possible overflow in lsx_(re)valloc() size calculation (CVE-2019-8355)
>  >   fix possible buffer size overflow in lsx_make_lpf() (CVE-2019-8354)
>  >   xa: validate channel count (CVE-2017-18189)
>  >   aiff: fix crash on empty comment chunk (CVE-2017-15642)
>  >   adpcm: fix stack overflow with >4 channels (CVE-2017-15372)
>  >   flac: fix crash on corrupt metadata (CVE-2017-15371)
>  >   wav: ima_adpcm: fix buffer overflow on corrupt input (CVE-2017-15370)
>  >   wav: fix crash writing header when channel count >64k (CVE-2017-11359)
>  >   hcom: fix crash on input with corrupt dictionary (CVE-2017-11358)
>  >   wav: fix crash if channel count is zero (CVE-2017-11332)
>
>  > - Tweak configuration options due to
>  >   https://sourceforge.net/p/sox/code/ci/6ff0e9322f9891f5a6ac6c9b3bceffbfca16bec3
>  > - libgsm is now an optional dependency since
>  >   https://sourceforge.net/p/sox/code/ci/e548827ffcf4dffa7f21709b8e96b04b481c09b8
>  > - Add patch to put back --disable-stack-protector
>
> It would be good if you could bring up this issue with upstream.
Already done and patch sent upstream as stated in
0002-configure.ac-put-back-disable-stack-protector.patch.
>
> Committed, thanks.
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
