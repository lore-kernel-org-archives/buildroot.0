From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Apr 2020 23:07:12 +0200
Subject: [Buildroot] [PATCH 2/2] package/openssh: bump to version 8.2p1
In-Reply-To: <20200330162411.9678-2-romain.naour@smile.fr>
References: <20200330162411.9678-1-romain.naour@smile.fr>
 <20200330162411.9678-2-romain.naour@smile.fr>
Message-ID: <20200404230712.07ffac0b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Mar 2020 18:24:11 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> This new version is mandatory to allow the glibc package bump to version 2.31.
> Otherwise it's not possible to connect to the remote host, as reported by [1] [2].
> Upstream commit [3][4] fixes the issue.
> 
> [1] https://bugs.archlinux.org/task/65386
> [2] https://bugs.gentoo.org/708224
> [3] https://github.com/openssh/openssh-portable/commit/beee0ef61866cb567b9abc23bd850f922e59e3f0
> [4] https://github.com/openssh/openssh-portable/commit/69298ebfc2c066acee5d187eac8ce9f38c796630
> 
> Release Note:
> https://www.openssh.com/txt/release-8.2
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/openssh/openssh.hash | 4 ++--
>  package/openssh/openssh.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
