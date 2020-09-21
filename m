From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Sep 2020 22:42:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/memtester: bump to version 4.5.0
In-Reply-To: <20200920211924.1660523-1-fontaine.fabrice@gmail.com>
References: <20200920211924.1660523-1-fontaine.fabrice@gmail.com>
Message-ID: <20200921224245.2897efd5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Sep 2020 23:19:24 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patches (already in version)
> 
> http://pyropus.ca/software/memtester/CHANGELOG
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/memtester/0001-makefile-fix.patch     | 23 -------
>  .../0002-fix-build-with-gcc-10.patch          | 65 -------------------
>  package/memtester/memtester.hash              |  2 +-
>  package/memtester/memtester.mk                |  2 +-
>  4 files changed, 2 insertions(+), 90 deletions(-)
>  delete mode 100644 package/memtester/0001-makefile-fix.patch
>  delete mode 100644 package/memtester/0002-fix-build-with-gcc-10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
