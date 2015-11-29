From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 18:53:11 +0100
Subject: [Buildroot] [PATCH] support/download: fetch all refs on full
 git clone
In-Reply-To: <1446871164-19229-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1446871164-19229-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20151129185311.7d227b0f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vivien Didelot,

On Fri,  6 Nov 2015 23:39:24 -0500, Vivien Didelot wrote:
> When specifying BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION, a user may want to
> specify the SHA of a reference different than a branch or tag.
> 
> For instance, Gerrit stores the patchsets under refs/changes/xx/xxx, and
> Github stores the pull requests under refs/pull/xxx/head.
> 
> When cloning a repository with --bare, you don't fetch these references.
> This patch uses --mirror for a full clone, in order to give the user
> access to all references of the Git repository.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>  support/download/git | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
