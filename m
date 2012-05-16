From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 16 May 2012 13:02:12 +0200
Subject: [Buildroot] [PATCH resend] source-check: change behavior to
 check only selected packages / add source-check-all
In-Reply-To: <cceaa854b98654b39b1f.1337107383@beantl019720>
References: <cceaa854b98654b39b1f.1337107383@beantl019720>
Message-ID: <4FB38934.5070400@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire wrote:
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
>

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Luca
