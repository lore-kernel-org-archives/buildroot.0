From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Thu, 19 Nov 2015 12:38:46 -0500
Subject: [Buildroot] [PATCH] support/download: fetch all refs on full
	git clone
In-Reply-To: <1446871164-19229-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1446871164-19229-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20151119173846.GA26379@ketchup.mtl.sfl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Nov. Friday 06 (45) 11:39 PM, Vivien Didelot wrote:
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

Reviewed-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>

(I pasted Maxime's review here for clarity)

Guys, could you merge this patch please? Also having it applied as a fix
for 2015.11 would be a plus.

Best,
-v
