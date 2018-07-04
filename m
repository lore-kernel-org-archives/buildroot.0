From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Jul 2018 22:30:29 +0200
Subject: [Buildroot] [PATCH 2/5] pigz: new package
In-Reply-To: <20180704070739.7259-3-thomas.de_schampheleire@nokia.com>
References: <20180704070739.7259-1-thomas.de_schampheleire@nokia.com>
 <20180704070739.7259-3-thomas.de_schampheleire@nokia.com>
Message-ID: <20180704223029.288baa38@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Jul 2018 09:07:36 +0200, Thomas De Schampheleire wrote:
> From: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>
> 
> A parallel implementation of gzip for modern
> multi-processor, multi-core machines.
> 
> Signed-off-by: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/Config.in      |  1 +
>  package/pigz/Config.in | 14 ++++++++++++++
>  package/pigz/pigz.hash |  2 ++
>  package/pigz/pigz.mk   | 21 +++++++++++++++++++++
>  4 files changed, 38 insertions(+)
>  create mode 100644 package/pigz/Config.in
>  create mode 100644 package/pigz/pigz.hash
>  create mode 100644 package/pigz/pigz.mk

I've applied, with the following changes:

    [Thomas: add entry to DEVELOPERS file, add hash for license file.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
