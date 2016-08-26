From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 10:55:29 +0200
Subject: [Buildroot] [git commit] package/uboot-tols: fix dependency of
 comment about FIT support
In-Reply-To: <20160825215944.0CDBA822DD@busybox.osuosl.org>
References: <20160825215944.0CDBA822DD@busybox.osuosl.org>
Message-ID: <20160826105529.65876156@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 23:55:35 +0200, Peter Korsgaard wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=791e35f222da58e815a657d07b620635b78a80e8
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> When commit 031130a4 added the dependency on shared libs for FIT support
> in uboot-tools, the dependency of the comment was added exactly as the
> dependency of the symbol.
> 
> That means the comment is shown when FIT support is possible, and hidden
> when it is not, while we want it the other way around...
> 
> Fix the dependency.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

You forgot to fix the commit title, even though the typo was noticed
by Fabio and acknowledged by Yann.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
