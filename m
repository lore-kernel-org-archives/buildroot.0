From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Apr 2019 15:01:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/cmocka: bump to version 1.1.5
In-Reply-To: <20190413193949.2227-1-fontaine.fabrice@gmail.com>
References: <20190413193949.2227-1-fontaine.fabrice@gmail.com>
Message-ID: <20190414150122.3beb9c49@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 13 Apr 2019 21:39:49 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patch (already in version)
> - Use WITH_EXAMPLES=OFF (option added with
>   https://git.cryptomilk.org/projects/cmocka.git/commit?id=ee264da1aa222b354cee36184ab48c2072f62243)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ime-include-stdint.h-before-cmocka.h.patch | 35 -------------------
>  package/cmocka/cmocka.hash                    |  2 +-
>  package/cmocka/cmocka.mk                      |  3 +-
>  3 files changed, 3 insertions(+), 37 deletions(-)
>  delete mode 100644 package/cmocka/0001-examples-uptime-include-stdint.h-before-cmocka.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
