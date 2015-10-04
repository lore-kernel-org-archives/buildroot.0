From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 17:48:45 +0100
Subject: [Buildroot] [PATCH 1/2] nfs-utils: Bump version
In-Reply-To: <1443900549-9696-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443900549-9696-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151004174845.35add710@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat,  3 Oct 2015 21:29:08 +0200, Maxime Hadjinlian wrote:
> Remove patch as it was backported from upstream:
> http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=17a3e5bffb7110d46de1bf42b64b90713ff5ea50
> 
> Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  .../0004-statd-Fix-test-for-foreground-mode.patch  | 30 ----------------------
>  package/nfs-utils/nfs-utils.hash                   |  4 +--
>  package/nfs-utils/nfs-utils.mk                     |  2 +-
>  3 files changed, 3 insertions(+), 33 deletions(-)
>  delete mode 100644 package/nfs-utils/0004-statd-Fix-test-for-foreground-mode.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
