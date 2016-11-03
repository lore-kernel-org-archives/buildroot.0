From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 23:35:25 +0100
Subject: [Buildroot] [PATCH 4/4] package/fakeroot: remove
In-Reply-To: <9db5c7acb037104ad296a1dc8d73ee7640417d3f.1478211656.git.yann.morin.1998@free.fr>
References: <cover.1478211656.git.yann.morin.1998@free.fr>
 <9db5c7acb037104ad296a1dc8d73ee7640417d3f.1478211656.git.yann.morin.1998@free.fr>
Message-ID: <20161103233525.3fbc41f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Nov 2016 23:21:08 +0100, Yann E. MORIN wrote:
> We've now entirely switched to using pseudo istead of fakeroot, so it is
> time to remove the fakeroot package now.
> 
> Reported-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/fakeroot/0001-hide-dlsym-error.patch | 34 ----------------------------
>  package/fakeroot/fakeroot.hash               |  4 ----
>  package/fakeroot/fakeroot.mk                 | 20 ----------------
>  3 files changed, 58 deletions(-)
>  delete mode 100644 package/fakeroot/0001-hide-dlsym-error.patch
>  delete mode 100644 package/fakeroot/fakeroot.hash
>  delete mode 100644 package/fakeroot/fakeroot.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
