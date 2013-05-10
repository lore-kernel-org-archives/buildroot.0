From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 May 2013 00:35:35 +0200
Subject: [Buildroot] [PATCH 2/3] Move and refactor package imx-lib to
 the freescale-imx directory
In-Reply-To: <1368174613-3427-3-git-send-email-h.fijnvandraat@inter.nl.net>
References: <1368174613-3427-1-git-send-email-h.fijnvandraat@inter.nl.net>
 <1368174613-3427-3-git-send-email-h.fijnvandraat@inter.nl.net>
Message-ID: <518D7637.7050001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/05/13 10:30, Henk Fijnvandraat wrote:
> When moved, the version and download site are set to those specified in the
> freescale-imx.mk file.
> This means that the version is bumped from 12.09.01 to 1.1.0

  That version bump should be in the first line of the commit message. So 
something like:

imx-lib: refactor to freescale-imx directory and bump version

Use the freescale-imx version and download site, which implicitly bumps 
the version from 12.09.01 to 1.1.0.

>
> Signed-off-by: Henk Fijnvandraat<h.fijnvandraat@inter.nl.net>

  With that done and after modifying the variables as I suggested, you 
can add my

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
