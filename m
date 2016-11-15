From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 22:48:19 +0100
Subject: [Buildroot] [PATCH v1] Makefile: add missing targets to
 noconfig_targets and nobuild_targets
In-Reply-To: <1479207800-26263-1-git-send-email-Rahul.Jain@imgtec.com>
References: <1479207800-26263-1-git-send-email-Rahul.Jain@imgtec.com>
Message-ID: <20161115224819.007dc80b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Nov 2016 16:33:20 +0530, Rahul Jain wrote:
> currently some buildroot targets fails (list-defconfigs,
> graph-build, etc), if there is an issue with configuration.
> For example, enabling uboot package without providing custom
> version name results in failing of various targets.
> 
> Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
> ---
>  Makefile | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Applied to next, after adding the savedefconfig and printvars targets
to nobuild_targets, as suggested by Arnout. Thanks for the patch, and
thanks Arnout for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
