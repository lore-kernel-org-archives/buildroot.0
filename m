From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Sep 2012 21:44:40 +0200
Subject: [Buildroot] [PATCH 05/11] gettext: convert to autotools-package
In-Reply-To: <1347836276-24262-6-git-send-email-yann.morin.1998@free.fr>
References: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
 <1347836276-24262-6-git-send-email-yann.morin.1998@free.fr>
Message-ID: <505B7228.3060209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/17/12 00:57, Yann E. MORIN wrote:
> From: Maxime Ripard<maxime.ripard@free-electrons.com>
>
> Signed-off-by: Maxime Ripard<maxime.ripard@free-electrons.com>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> Tested-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> [yann.morin.1998 at free.fr:  add license info, build libintl if locales disabled]
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> CC: Samuel Martin<s.martin49@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  patches 1-8, with an internal toolchain with everything enabled except LOCALE,
  with all 735 packages that build successfully (i.e. an allpackageyesconfig and
  removing the ones that fail to build (mainly because avr32linux.org has
  vanished)

  With all the acks received so far, I propose to commit patches 1-6 (i.e.
including this one).

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
