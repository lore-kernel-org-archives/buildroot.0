From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 21:35:02 +0200
Subject: [Buildroot] [PATCH] package/upmpdcli: bump to version 1.4.2
In-Reply-To: <20190403184253.17934-1-joerg.krause@embedded.rocks>
References: <20190403184253.17934-1-joerg.krause@embedded.rocks>
Message-ID: <20190403213502.5ce747f4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  3 Apr 2019 20:42:53 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Drop upstream patch 0001, which is included in the new version.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...01-Use-uint64_t-instead-of-u_int64_t.patch | 72 -------------------
>  package/upmpdcli/upmpdcli.hash                |  4 +-
>  package/upmpdcli/upmpdcli.mk                  |  2 +-
>  3 files changed, 3 insertions(+), 75 deletions(-)
>  delete mode 100644 package/upmpdcli/0001-Use-uint64_t-instead-of-u_int64_t.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
