From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 16:00:17 +0100
Subject: [Buildroot] [PATCH] pkg-generic: run $(PKG)_PRE_RSYNC_HOOKS
 before checking for the existence of $(SRCDIR)
In-Reply-To: <1481479965-26226-1-git-send-email-tal.shorer@gmail.com>
References: <20161211174528.GD3599@free.fr>
 <1481479965-26226-1-git-send-email-tal.shorer@gmail.com>
Message-ID: <20161217160017.69dc0667@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Dec 2016 20:12:45 +0200, Tal Shorer wrote:
> This will allow packages to define their pre-rsync hooks which will be
> guaranteed to run even if the source is missing.
> 
> Signed-off-by: Tal Shorer <tal.shorer@gmail.com>
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
