From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 25 Dec 2017 22:05:35 -0600
Subject: [Buildroot] [PATCH] libostree: add patch to fix compilation
 error
In-Reply-To: <20171221231959.31974-1-marcus.folkesson@gmail.com>
References: <20171221231959.31974-1-marcus.folkesson@gmail.com>
Message-ID: <CANQCQpbjt3xz83_AkzApncH_mZ0Z7xauM59BvaVmZyinbp9iVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcus,

On Thu, Dec 21, 2017 at 5:19 PM, Marcus Folkesson
<marcus.folkesson@gmail.com> wrote:
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

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

I did a simple build test after applying the patch to the failing build.
