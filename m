From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 21:30:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: bump to version 1.4.14
In-Reply-To: <20200917063655.927560-1-joerg.krause@embedded.rocks>
References: <20200917063655.927560-1-joerg.krause@embedded.rocks>
Message-ID: <20200917213016.07d717c0@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 17 Sep 2020 08:36:55 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Drop upstream patch which is included in the new version.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...dapt-streamproxy-to-newer-microhttpd.patch | 106 ------------------
>  package/upmpdcli/upmpdcli.hash                |   4 +-
>  package/upmpdcli/upmpdcli.mk                  |   2 +-
>  3 files changed, 3 insertions(+), 109 deletions(-)
>  delete mode 100644 package/upmpdcli/0001-Adapt-streamproxy-to-newer-microhttpd.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
