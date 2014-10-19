From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 16:37:37 +0200
Subject: [Buildroot] [PATCH v4] rpi-userland: bump revision and add
 patch to fix compile with musl
In-Reply-To: <1413655117-28464-1-git-send-email-maarten@treewalker.org>
References: <1739784.babPHSSYPS@hyperion>
 <1413655117-28464-1-git-send-email-maarten@treewalker.org>
Message-ID: <20141019163737.0b2ece7e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maarten ter Huurne,

On Sat, 18 Oct 2014 19:58:37 +0200, Maarten ter Huurne wrote:
> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> ---
>  .../rpi-userland-003-fix-musl-compile.patch        | 113 +++++++++++++++++++++
>  package/rpi-userland/rpi-userland.mk               |   2 +-
>  2 files changed, 114 insertions(+), 1 deletion(-)
>  create mode 100644 package/rpi-userland/rpi-userland-003-fix-musl-compile.patch

Thanks, applied, after adjusting the commit log as suggested by Yann.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
