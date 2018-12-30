From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 14:46:01 +0100
Subject: [Buildroot] [PATCH 1/2] runc: bump to version 1.0.0-rc6
In-Reply-To: <20181229104217.13806-1-christian@paral.in>
References: <20181229104217.13806-1-christian@paral.in>
Message-ID: <20181230144601.61d07fba@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Dec 2018 02:42:16 -0800, Christian Stewart wrote:
> Previously, a specific commit hash from the Docker runc.installer was used to
> determine the required runc version for the Docker Engine. This old commit hash
> used was a untagged pre-1.0.0 release of runc, closer to an earlier release
> candidate.
> 
> The runc version used in the Debian distribution is not the pinned version
> previously used by Buildroot. It is the latest release candidate. The latest
> release candidate is known to be compatible with the Docker Engine, and there is
> no justification for pinning to an older RC anymore.
> 
> This commit bumps to the latest RC, 1.0.0-rc6. A v1.0.0 is expected soon.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/runc/runc.hash | 2 +-
>  package/runc/runc.mk   | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
