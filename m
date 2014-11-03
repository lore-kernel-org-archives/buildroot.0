From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Nov 2014 22:31:16 +0100
Subject: [Buildroot] [PATCH 1/1] adwaita-icon-theme: depends on
 host-libgtk3
In-Reply-To: <1415021155-29232-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1415021155-29232-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20141103223116.1d6f3efb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Mon,  3 Nov 2014 14:25:55 +0100, Eric Le Bihan wrote:
> The adwaita icon theme can only be selected with libgtk3 and depends on
> host-libgtk3 to build.
> 
> Fixes http://autobuild.buildroot.org/results/f8d/f8d0e2198fa54f9141512e2db6dc46e3cee1cd44/
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/adwaita-icon-theme/Config.in             | 1 +
>  package/adwaita-icon-theme/adwaita-icon-theme.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
