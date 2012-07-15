From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Jul 2012 14:07:17 +0200
Subject: [Buildroot] [PATCH v2 1/2] Convert gettext to autotargets
In-Reply-To: <1338674861-1716-1-git-send-email-s.martin49@gmail.com>
References: <1338674861-1716-1-git-send-email-s.martin49@gmail.com>
Message-ID: <5002B275.8020206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/12 00:07, Samuel Martin wrote:
> From: Maxime Ripard<maxime.ripard@free-electrons.com>
>
> Signed-off-by: Maxime Ripard<maxime.ripard@free-electrons.com>
> Acked-by: Samuel MARTIN<s.martin49@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  I can't imagine that all the _cv_ variables that were set in gettext
are really unnecessary, but I guess the autobuild infrastructure will
find out if they aren't...

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
