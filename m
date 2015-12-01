From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Dec 2015 17:58:32 +0100
Subject: [Buildroot] [PATCH] lua: bump to version 5.3.2
In-Reply-To: <1448912908-6459-1-git-send-email-francois.perrad@gadz.org>
References: <1448912908-6459-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20151201175832.237f4de3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois,

On Mon, 30 Nov 2015 20:48:28 +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua/{5.3.1 => 5.3.2}/0001-root-path.patch           | 0
>  package/lua/{5.3.1 => 5.3.2}/0002-shared-libs-for-lua.patch | 0
>  package/lua/{5.3.1 => 5.3.2}/0004-lua-pc.patch              | 2 +-
>  package/lua/{5.3.1 => 5.3.2}/0011-linenoise.patch           | 6 ++----
>  package/lua/lua.hash                                        | 4 ++--
>  package/lua/lua.mk                                          | 2 +-
>  6 files changed, 7 insertions(+), 9 deletions(-)
>  rename package/lua/{5.3.1 => 5.3.2}/0001-root-path.patch (100%)
>  rename package/lua/{5.3.1 => 5.3.2}/0002-shared-libs-for-lua.patch (100%)
>  rename package/lua/{5.3.1 => 5.3.2}/0004-lua-pc.patch (97%)
>  rename package/lua/{5.3.1 => 5.3.2}/0011-linenoise.patch (78%)

I didn't look at the details, but this patch doesn't apply here (on
either next or master) :

thomas at skate:~/projets/buildroot (next)$ git pwam 550316
Applying patch #550316 using 'git am -s -3'
Description: lua: bump to version 5.3.2
Applying: lua: bump to version 5.3.2
Using index info to reconstruct a base tree...
error: patch failed: package/lua/5.3.1/0011-linenoise.patch:8
error: package/lua/5.3.1/0011-linenoise.patch: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0001 lua: bump to version 5.3.2
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
