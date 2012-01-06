From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Jan 2012 07:52:52 +0100
Subject: [Buildroot] [PATCH 3/3] Migrate the packages to the new infra
In-Reply-To: <4F0180B3.5010105@free-electrons.com>
References: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
 <201112202229.19551.arnout@mind.be> <4F0180B3.5010105@free-electrons.com>
Message-ID: <201201060752.52798.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 02 January 2012 11:02:27 Maxime Ripard wrote:
> >  By the way, doesn't systemd support sysv-style init scripts as well?
> 
> It does, but you lose almost if not all the benefits of using systemd
> with sysv scripts.

 Yes, but then we should install a package's sysv init scripts if it 
doesn't define systemd init scripts.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
