From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:15:39 +0200
Subject: [Buildroot] [PATCH] libcoap: bump to version 4.1.2
In-Reply-To: <1504503315-8368-1-git-send-email-yegorslists@googlemail.com>
References: <1504503315-8368-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20170906221539.156f4882@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Sep 2017 07:35:15 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Remove upstreamed patch.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  ...nly-add-Wunused-result-if-supported-by-th.patch | 38 ----------------------
>  package/libcoap/libcoap.hash                       |  2 +-
>  package/libcoap/libcoap.mk                         |  2 +-
>  3 files changed, 2 insertions(+), 40 deletions(-)
>  delete mode 100644 package/libcoap/0001-configure-only-add-Wunused-result-if-supported-by-th.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
