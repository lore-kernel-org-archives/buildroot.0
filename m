From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 07 Feb 2013 07:52:21 +0100
Subject: [Buildroot] [PATCH 3/5] package: use <pkg>_CONFIG_SCRIPTS
 wherever possible
In-Reply-To: <1360192218-30930-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360192218-30930-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1360192218-30930-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <51134F25.107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/13 00:10, Thomas Petazzoni wrote:
> Use the <pkg>_CONFIG_SCRIPTS mechanism in all packages for which it
> does all what the package was doing. A few packages, like libxslt, are
> for now left out, since they need some additional fixup (for example a
> fixup of includedir).
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (visual inspection only)

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
