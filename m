From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 21:13:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/squid: bump to version 4.6
In-Reply-To: <20190413150541.30291-1-fontaine.fabrice@gmail.com>
References: <20190413150541.30291-1-fontaine.fabrice@gmail.com>
Message-ID: <20190413211341.3d9f1ca9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 13 Apr 2019 17:05:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patch (already in version):
>   https://github.com/squid-cache/squid/commit/c34582b9e8c40529db7eb9c490b081a37972f6d4
> - Drop autoreconf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...re.ac-use-pkg-config-to-find-libxml2.patch | 79 -------------------
>  package/squid/squid.hash                      |  8 +-
>  package/squid/squid.mk                        |  4 +-
>  3 files changed, 5 insertions(+), 86 deletions(-)
>  delete mode 100644 package/squid/0001-configure.ac-use-pkg-config-to-find-libxml2.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
