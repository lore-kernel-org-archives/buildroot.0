From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 22:26:18 +0200
Subject: [Buildroot] [PATCH] pkg-utils: update comments after renaming
 of package infra macros
In-Reply-To: <1428918801-19631-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428918801-19631-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150413222618.58565ec4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Apr 2015 11:53:21 +0200, Thomas Petazzoni wrote:
> The package infrastructure macros have a long time ago been renamed
> from GENTARGETS, AUTOTARGETS to generic-package and
> autotools-package. However, one comment in pkg-utils.mk keeps a
> reference to these *TARGETS macros. This commit updates this comment
> to match the new name of these macros.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
