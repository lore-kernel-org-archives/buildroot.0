From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 16:06:39 +0100
Subject: [Buildroot] [PATCH 1/1] lvm2: ensured TARGET_AR is used during
 build
In-Reply-To: <20161212181354.18098-1-jordan@yelloz.me>
References: <20161212181354.18098-1-jordan@yelloz.me>
Message-ID: <20161217160639.6675a59d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Dec 2016 10:13:54 -0800, Jordan Yelloz wrote:
> The same way TARGET_CC was not being used during the build, TARGET_AR
> was not used either. Now TARGET_CONFIGURE_OPTS is injected into
> LVM2_MAKE_ENV which should include all the toolchain substitutions.
> 
> Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
> ---
>  package/lvm2/lvm2.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
