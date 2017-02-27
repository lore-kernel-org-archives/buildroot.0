From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 21:37:43 +0100
Subject: [Buildroot] [PATCH] python-libconfig: disable on musl
In-Reply-To: <1488148938-15671-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488148938-15671-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170227213743.3631051d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Feb 2017 23:42:18 +0100, Thomas Petazzoni wrote:
> The python-libconfig package fails to build with musl with very weird
> errors coming all the way from Boost Python, which nobody ever
> bothered to fix. It's time to disable this package on musl to avoid
> the repetitive build failures.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/f0f6cdc8c38c024772615d5e677b0f4ad63ef7ec
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/python-libconfig/Config.in | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
