From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:26:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/keepalived: bump to version
 2.0.15
In-Reply-To: <20190421174345.15284-1-fontaine.fabrice@gmail.com>
References: <20190421174345.15284-1-fontaine.fabrice@gmail.com>
Message-ID: <20190422222616.7a7248b0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 21 Apr 2019 19:43:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Remove patch (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...l_parser.c-fix-build-with-kernel-4.1.patch | 37 -------------------
>  package/keepalived/keepalived.hash            |  2 +-
>  package/keepalived/keepalived.mk              |  2 +-
>  3 files changed, 2 insertions(+), 39 deletions(-)
>  delete mode 100644 package/keepalived/0001-global_parser.c-fix-build-with-kernel-4.1.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
