From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 15 Oct 2012 21:05:20 +0200
Subject: [Buildroot] [PATCH] mplayer: fix compilation of NEON assembly
	in libavcodec
In-Reply-To: <87txtwxm2n.fsf@macbook.be.48ers.dk>
References: <1349478193-13673-1-git-send-email-arnout@mind.be>
 <87pq4s3e0t.fsf@macbook.be.48ers.dk> <50749743.5010700@mind.be>
 <87d30qadw4.fsf@macbook.be.48ers.dk> <87txtwxm2n.fsf@macbook.be.48ers.dk>
Message-ID: <507C5E70.1050808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/10/12 08:53, Peter Korsgaard wrote:
>   Peter>  It is? I've never done any real work on platforms with neon, so it's
>   Peter>  certainly a bit fussy to me, but I don't understand what the relation is
>   Peter>  with the calling convention.
>
>   Peter>  Aren't the new linaro toolchains hardfp and support neon?
>
>   Peter>  Googling a bit I see stuff like:
>
>   Peter>  http://wiki.meego.com/ARM/hardfp
>   Peter>  http://sources.redhat.com/ml/crossgcc/2012-07/msg00091.html
>
>   Peter>  http://wiki.debian.org/ArmHardFloatPort#GCC_floating-point_options
>   Peter>  mentions that neon + hardfp abi isn't supported by GCC 4.4, but
>   Peter>  otherwise doesn't mention that it cannot work.
>
> Any comments on this?

  Sorry, I was going to test it with a Linaro toolchain but forgot about it.
Running it now.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
