From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 11:17:35 +0200
Subject: [Buildroot] [PATCH v3 1/7] package/libcutl: new package
In-Reply-To: <20200706153040.427457-2-kamel.bouhara@bootlin.com>
References: <20200706153040.427457-1-kamel.bouhara@bootlin.com>
 <20200706153040.427457-2-kamel.bouhara@bootlin.com>
Message-ID: <20200712111735.36efb97f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  6 Jul 2020 17:30:34 +0200
Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:

> From: Adam Duskett <aduskett@gmail.com>
> 
> libcutl is distributed in source code and includes the standard autotools
> build system as well as the VC++ project files. It is a dependency for odb.
> 
> Because ODB is a host-only package, and no other package depends on libcutl,
> this package will also be a host-only package.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
>  DEVELOPERS                   |  1 +
>  package/libcutl/libcutl.hash |  6 ++++++
>  package/libcutl/libcutl.mk   | 15 +++++++++++++++
>  3 files changed, 22 insertions(+)
>  create mode 100644 package/libcutl/libcutl.hash
>  create mode 100644 package/libcutl/libcutl.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
