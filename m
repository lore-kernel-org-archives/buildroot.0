From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Feb 2012 00:44:27 +0100
Subject: [Buildroot] [git commit] mesa3d: don't depend on the X server
In-Reply-To: <20120206190750.3B69E909EB@busybox.osuosl.org>
References: <20120206190750.3B69E909EB@busybox.osuosl.org>
Message-ID: <201202070044.27132.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 06 February 2012 17:14:39 Peter Korsgaard wrote:
> There's no particular reason why you shouldn't be able to build mesa
> without the X server (E.G. for remote X), so remove it.

 And this will become even more true when we get Wayland in buildroot :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
