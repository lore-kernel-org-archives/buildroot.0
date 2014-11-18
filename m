From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 14:21:23 +0100
Subject: [Buildroot] [PATCH] kmod: bump to version 19
In-Reply-To: <1416243576-42474-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1416243576-42474-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141118142123.47e08033@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 17 Nov 2014 16:59:36 +0000, Vicente Olivert Riera wrote:
> - Bump to version 19
> - Rename 0001 patch to follow the new name convention
> - Adapt the 0001 patch to the new version
> - Remove the already-upstreamed 0002 patch
> - Update the hash value
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Applied to next, thanks. After changing just one thing.

> diff --git a/package/kmod/kmod-0001-fix-O_CLOEXEC.patch b/package/kmod/0001-fix-O_CLOEXEC.patch
> similarity index 83%
> rename from package/kmod/kmod-0001-fix-O_CLOEXEC.patch
> rename to package/kmod/0001-fix-O_CLOEXEC.patch
> index 4861c57..e09372c 100644
> --- a/package/kmod/kmod-0001-fix-O_CLOEXEC.patch
> +++ b/package/kmod/0001-fix-O_CLOEXEC.patch
> @@ -1,3 +1,7 @@
> +Adapt this patch to version 19
> +
> +Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

I don't think this should go here, otherwise the patch isn't a proper
git patch anymore. Instead, I modified the commit log to add the fact
that you updated the patch to version 19, and added your SoB below
Thomas DS one.

See:
http://git.buildroot.net/buildroot/tree/package/kmod/0001-fix-O_CLOEXEC.patch?h=next.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
