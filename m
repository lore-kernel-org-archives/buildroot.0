From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Nov 2012 22:04:54 +0100
Subject: [Buildroot] howto incorporate buildroot into an autobuild
In-Reply-To: <CAHqTa-2vZ_xs26oCX8kFtgQQzGaOcLWG=r2S+hsmUi1E6WZ2Vg@mail.gmail.com>
References: <1352767649.18724.34.camel@genx>
 <CAHqTa-2vZ_xs26oCX8kFtgQQzGaOcLWG=r2S+hsmUi1E6WZ2Vg@mail.gmail.com>
Message-ID: <50A2B5F6.2040106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/11/12 06:02, Avery Pennarun wrote:
> I also severely hacked up buildroot to be able to build multiple
> packages in parallel on a multicore machine; this makes builds
> typically 2-3x faster on our setup, and probably even more so if you
> use a really fast disk (SSD RAID?) and lots of RAM and multiple CPUs.
> You can see our hacked-up version here:
> http://gfiber.googlesource.com/buildroot
>
> Beware, however, as it may burn your eyes.  Someday I would like to
> clean up the parallelism patches and submit them here.

  Wow!  There are a couple of great ideas in that repository.  I certainly
wouldn't mind seeing some of these things upstreamed.  Like the shuffle
thing, that would be really great for the autobuilders.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
