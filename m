From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Aug 2016 21:55:46 +0200
Subject: [Buildroot] [PATCH] package/lttng-libust: fix build with musl
In-Reply-To: <1470487458-29015-1-git-send-email-yann.morin.1998@free.fr>
References: <1470487458-29015-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160806215546.0ac9c5aa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Aug 2016 14:44:18 +0200, Yann E. MORIN wrote:
> Backport two patches from upstream to fix build with musl.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/dcb/dcb6c3aadf6f955016cf3c3f9b917cbec6d29342/
>     http://autobuild.buildroot.org/results/deb/deb80eea5ceae3e7f8e0549596dce2fb6a1e7596/
>     http://autobuild.buildroot.org/results/91e/91e64477864825c39911e3f3d0a2459f2987c209/
>     [...and a lot more...]
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Philippe Proulx <eeppeliteloop@gmail.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/lttng-libust/lttng-libust.hash | 4 ++++
>  package/lttng-libust/lttng-libust.mk   | 4 ++++
>  2 files changed, 8 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
