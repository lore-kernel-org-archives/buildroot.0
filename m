From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Nov 2012 23:42:40 +0100
Subject: [Buildroot] buildroot-2012.08: Handling drm module
In-Reply-To: <CABRndgxqqO3HC08rVngxm2eaSVjQ9Ks04U7Mss5-xu=B4WGMdg@mail.gmail.com>
References: <CABRndgxqqO3HC08rVngxm2eaSVjQ9Ks04U7Mss5-xu=B4WGMdg@mail.gmail.com>
Message-ID: <50A029E0.4020802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/11/12 22:05, Zvi Vered wrote:
> Hello,
>
> I just tried buildroot-2012.08
>
> According to .config buildroot does not handle 'drm'. at all.
> Am I right ?
>
> When I booted my PC104 module with 'knoppix 2 nodrm' the text screen flickers.
> With 'knoppix 2' the screen is OK.
>
> Now I want to boot the PC104 with "my" distribution based on vanilla
> 3.4.7, busybox.
> Can you help ?

  Can you explain what your problem is?  Is it that the build fails, or that the
resulting image doesn't boot, or that the screen still flickers with the
buildroot image?

  In any case, it is probably a kernel problem.  If you use exactly the same kernel
version and kernel configuration as in knoppix, you should get the same behaviour.
(You can usually get the configuration of a running kernel from /proc/config.gz).
Note that knoppix may have additional kernel patches as well.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
