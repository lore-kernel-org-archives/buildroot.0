From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 23:33:22 +0100
Subject: [Buildroot] [PATCHv4] wine: Bump to version 1.8.1
In-Reply-To: <1455052258-5463-1-git-send-email-nerv@dawncrow.de>
References: <1455052258-5463-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20160216233322.1af14181@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

On Tue,  9 Feb 2016 22:10:58 +0100, Andr? Hentschel wrote:
> Bumping to stable version 1.8.1
> 
> Upstreamed patch is finally dropped.
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  ...llow-to-override-the-location-of-the-conf.patch | 109 ---------------------
>  package/wine/wine.hash                             |   2 +-
>  package/wine/wine.mk                               |   4 +-
>  3 files changed, 2 insertions(+), 113 deletions(-)
>  delete mode 100644 package/wine/0001-configure-allow-to-override-the-location-of-the-conf.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
