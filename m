From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 Dec 2014 15:26:22 +0000
Subject: [Buildroot] [PATCH 1/1] util-linux: rename patches to follow
 the new name convention
In-Reply-To: <CABbD_XAEd=6=15Mm8kQC7keOERhrOZUfL+0fcv3j8uD=+k1oCg@mail.gmail.com>
References: <1418217249-55637-1-git-send-email-kaszak@gmail.com>	<5488629F.6010401@imgtec.com>
 <CABbD_XAEd=6=15Mm8kQC7keOERhrOZUfL+0fcv3j8uD=+k1oCg@mail.gmail.com>
Message-ID: <5488661E.10704@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear K?roly Kasza,

On 12/10/2014 03:21 PM, K?roly Kasza wrote:
> Wouldn't be better to do all packages in one run of "git mv"-s?

I'm not sure, because there are lots of patches in the patchwork queue
which may be touch some package-patches, so if you send a patch to
rename all package-patches for all buildroot packages, there could be
lots of patches that couldn't be applied as they are. I think it's
better to fix one package at a time, but that's only my opinion, I could
be wrong.

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
