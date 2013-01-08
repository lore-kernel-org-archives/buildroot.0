From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jan 2013 23:55:01 +0100
Subject: [Buildroot] [PATCH 02/28] x11r7: remove useless depends on of
 X.org drivers
In-Reply-To: <20d29fed0daf0228d11c9cfca4c3b692d80343a4.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <20d29fed0daf0228d11c9cfca4c3b692d80343a4.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <50ECA3C5.8040206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/06/13 22:29, Thomas Petazzoni wrote:
> All X.org server drivers are already enclosed in a if
> BR2_PACKAGE_XSERVER_xorg .. endif block. Now that this option is only
> set if a X.org server is enabled, there is no need for each individual
> driver to depend on BR2_PACKAGE_XSERVER_XORG.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (untested)

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
