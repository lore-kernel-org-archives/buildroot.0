From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 09:37:54 +0100
Subject: [Buildroot] [PATCH 5/5] package/docker-engine: bump version to
 20.10.1
In-Reply-To: <20201216080013.547261-5-christian@paral.in>
References: <20201216080013.547261-1-christian@paral.in>
 <20201216080013.547261-5-christian@paral.in>
Message-ID: <20201230093754.3d333de2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Dec 2020 00:00:12 -0800
Christian Stewart <christian@paral.in> wrote:

> Additionally, fix the ldflags specification of the package version.
> 
> The "autogen" script does not actually configure anything anymore, and instead
> exports a LDFLAGS environment variable which we can't use. Instead, specify the
> version information via LDFLAGS directly in the Buildroot makefile, similar to
> containerd and other packages.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/docker-engine/docker-engine.hash |  2 +-
>  package/docker-engine/docker-engine.mk   | 25 +++++++++---------------
>  2 files changed, 10 insertions(+), 17 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
