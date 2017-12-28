From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 22:57:43 +0100
Subject: [Buildroot] [PATCH] libostree: add patch to fix compilation
 error
In-Reply-To: <20171221231959.31974-1-marcus.folkesson@gmail.com>
References: <20171221231959.31974-1-marcus.folkesson@gmail.com>
Message-ID: <20171228225743.60a1fd60@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Dec 2017 00:19:59 +0100, Marcus Folkesson wrote:
> Fix the following compilation error:
> src/libostree/ostree-repo-pull.c:1493:1: error: no previous prototype
> for '_ostree_repo_verify_bindings' [-Werror=missing-prototypes]
> 
> The patch is submitted upstreams (8d3d14503b3105f93db635022e881e02688f2db4)
> and should be removed in the next version bump.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3fc91565cb2d0fabe566c109257a616bd57cb08c
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  ...llways-include-ostree-repo-pull-private.h.patch | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/libostree/0001-lib-pull-allways-include-ostree-repo-pull-private.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
