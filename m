From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 23:01:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/ipmiutil: bump to version 3.1.7
In-Reply-To: <20200926195335.771505-1-fontaine.fabrice@gmail.com>
References: <20200926195335.771505-1-fontaine.fabrice@gmail.com>
Message-ID: <20200930230100.2dd2808f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Sep 2020 21:53:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (not needed since
>   https://github.com/arcress0/ipmiutil/commit/32b6e5634d773150338b60585e9c258cd575e3d9)
> - Drop autoreconf
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ipmiutil/0001-no-build-doc.patch | 31 ------------------------
>  package/ipmiutil/ipmiutil.hash           |  8 +++---
>  package/ipmiutil/ipmiutil.mk             |  4 +--
>  3 files changed, 5 insertions(+), 38 deletions(-)
>  delete mode 100644 package/ipmiutil/0001-no-build-doc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
