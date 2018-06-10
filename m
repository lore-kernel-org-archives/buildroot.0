From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 15:07:45 +0200
Subject: [Buildroot] [PATCH 1/1] numactl: change source code provider to
 GitHub
In-Reply-To: <20180607195132.7501-1-karpenko@fastmail.com>
References: <20180607195132.7501-1-karpenko@fastmail.com>
Message-ID: <20180610150745.405b0785@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jun 2018 22:51:32 +0300, Mikhail Karpenko wrote:
> The original ftp with source code is not reachable any more and this
> commit changes the location of the package to corresponding GitHub
> project.
> 
> Signed-off-by: Mikhail Karpenko <karpenko@fastmail.com>
> ---
>  package/numactl/numactl.hash | 2 +-
>  package/numactl/numactl.mk   | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
