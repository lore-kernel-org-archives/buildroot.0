From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Jan 2012 00:23:07 +0100
Subject: [Buildroot] [PATCH 1/4] Add support for package-declared devices
In-Reply-To: <821d176cb2d32a4cfd9de1fb10d64f89003680f3.1326304128.git.maxime.ripard@free-electrons.com>
References: <cover.1326304128.git.maxime.ripard@free-electrons.com>
 <821d176cb2d32a4cfd9de1fb10d64f89003680f3.1326304128.git.maxime.ripard@free-electrons.com>
Message-ID: <201201210023.07465.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 11 January 2012 18:53:38 Maxime Ripard wrote:
> Add a way for packages to declare files they need instead of relying
> only on device tables, which creates files no matter if the package is
> indeed enabled, as we can see for busybox.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Is there anything stopping this from going in?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
