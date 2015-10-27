From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Oct 2015 07:33:55 +0100
Subject: [Buildroot] [PATCH] libglib2: disable tests and update
 configure options
In-Reply-To: <1445380855-31482-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1445380855-31482-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20151027073355.62029b0e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Tue, 20 Oct 2015 19:40:55 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Sometimes if host-python is around it doesn't work too well with the
> distro python (Gentoo, FC20 at least) leading to build failures.
> 
> This failure is very hard to trigger, it's normally easier to do so by
> enabling top-level parallel builds.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0f8/0f881e322b7f9d244b8dd2440ba0afd3a8418027/
> 
> While at it update the configure options to avoid any host
> libraries/tools from leaking in, new naming conventions and options.
> And remove dead code dealing with the nothreaded variant.
> 
> Signed-off-by: Gustavo Zacarias <gustavozacarias@free-electrons.com>
> ---
>  package/libglib2/0002-disable-tests.patch | 43 +++++++++++++++++++++++++++++++
>  package/libglib2/libglib2.mk              | 12 ++++-----
>  2 files changed, 48 insertions(+), 7 deletions(-)
>  create mode 100644 package/libglib2/0002-disable-tests.patch

Applied, thanks. However, I would have preferred the patch to be in a
form that can potentially be upstreamed (i.e addition of a ./configure
option to disable tests), and the said patch to actually be submitted
upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
