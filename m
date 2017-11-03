From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 18:53:01 +0100
Subject: [Buildroot] [PATCH] package/mono: bump to version 5.4.0.201
In-Reply-To: <1509720211-9625-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1509720211-9625-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20171103185301.6fb471ca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Nov 2017 15:43:31 +0100, Angelo Compagnucci wrote:
> This patch bumps mono to version 5.4.0.201 and monolite
> to version 1050400003.
> It also removes a patch not needed anymore.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  ...-monodoc-Fixing-wrong-monodoc-search-path.patch | 29 ----------------------
>  package/mono/mono.hash                             |  2 +-
>  package/mono/mono.mk                               |  2 +-
>  package/monolite/monolite.hash                     |  2 +-
>  package/monolite/monolite.mk                       |  6 ++---
>  5 files changed, 6 insertions(+), 35 deletions(-)
>  delete mode 100644 package/mono/0008-monodoc-Fixing-wrong-monodoc-search-path.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
