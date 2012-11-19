From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 19 Nov 2012 20:41:54 +0100
Subject: [Buildroot] [PATCH] external-toolchain: add Sourcery CodeBench
 ARM 2012.09
In-Reply-To: <1353324554-23461-1-git-send-email-fabio.porcedda@gmail.com>
References: <1353324554-23461-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <50AA8B82.6010609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/11/12 12:29, Fabio Porcedda wrote:
> I've added the "depends on BROKEN" because this toolchain
> breaks linux kernel arm builds:
> "arch/arm/lib/copy_template.S:247: Error: selected processor
>   does not support ARM mode `ldralt r4,[r1],#4'"

  Then why would we add support for that toolchain to buildroot?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
