From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Feb 2012 10:31:43 +0100
Subject: [Buildroot] [PATCH] Add Freescale MX53 support
In-Reply-To: <8762fjt2m7.fsf@macbook.be.48ers.dk>
References: <1328273223-16093-1-git-send-email-mbriand@adeneo-embedded.com>
 <201202070000.34270.arnout@mind.be> <8762fjt2m7.fsf@macbook.be.48ers.dk>
Message-ID: <201202071031.44299.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 07 February 2012 10:27:28 Peter Korsgaard wrote:
>  >> diff --git a/board/freescale/mx53loco/linux.config b/board/freescale/mx53loco/linux.config
>  Arnout>  Personally I'd prefer to use a kernel defconfig (mx5_defconfig), but
>  Arnout> perhaps this one is more appropriate.
> 
> I agree if possible, as that's one thing less to maintain.

 I think the main difference is that the mx5_defconfig includes several 
BSPs, not just the loco.  So this custom one will probably result in a
(slightly) smaller kernel.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
