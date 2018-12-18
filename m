From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Dec 2018 22:47:18 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/weston: bump to version 5.0.0
In-Reply-To: <1545165872-20832-1-git-send-email-james.hilliard1@gmail.com>
References: <1545165872-20832-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <20181218224718.3a6c4b15@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Dec 2018 04:44:32 +0800, james.hilliard1 at gmail.com wrote:
> From: James Hilliard <james.hilliard1@gmail.com>
> 
> removes rdp-compositor: fix compilation against FreeRDP 2.0.0 rc2
> backport which is now included in 5.0.0
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> 
> ---
> Changes v2 -> v3:
>   - wrap commit message
> ---
>  ...tor-fix-compilation-against-FreeRDP-2.0.0.patch | 181 ---------------------
>  package/weston/weston.hash                         |  10 +-
>  package/weston/weston.mk                           |   5 +-
>  3 files changed, 6 insertions(+), 190 deletions(-)
>  delete mode 100644 package/weston/0002-rdp-compositor-fix-compilation-against-FreeRDP-2.0.0.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
