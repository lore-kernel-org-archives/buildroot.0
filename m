From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 May 2012 22:45:51 +0200
Subject: [Buildroot] [PATCH resend] source-check: change behavior to
 check only selected packages / add source-check-all
In-Reply-To: <cceaa854b98654b39b1f.1337107383@beantl019720>
References: <cceaa854b98654b39b1f.1337107383@beantl019720>
Message-ID: <4FB2C07F.2060608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/15/12 20:43, Thomas De Schampheleire wrote:
> The original 'source-check' target first selects all packages, and then checks
> whether the package tarballs can be found. This is useful for Buildroot
> maintainers, but less useful for developers working on a specific project. The
> latter only care about the packages used in that project.
>
> This patch removes the allyesconfig dependency to source-check so that only
> selected packages are checked. The original behavior is moved to a new target
> 'source-check-all'.
>
> Signed-off-by: Thomas De Schampheleire<thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
