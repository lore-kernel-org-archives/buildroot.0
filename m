From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jun 2017 18:57:03 +0200
Subject: [Buildroot] [PATCH] package/bdwgc: backport an upstream patch
 to fix musl build
In-Reply-To: <20170603154217.6053-1-romain.naour@gmail.com>
References: <20170603154217.6053-1-romain.naour@gmail.com>
Message-ID: <20170603185703.66838c68@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Jun 2017 17:42:17 +0200, Romain Naour wrote:
> Fixes:
> http://autobuild.buildroot.net/results/c9e/c9ec16635fbdb2d6ddf11e317bc537c111ea7050
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...-tv-is-unknown-error-in-brief_async_signa.patch | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/bdwgc/0003-Fix-size-of-tv-is-unknown-error-in-brief_async_signa.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
