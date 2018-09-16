From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 21:57:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/mongodb: add patch to compile
 with glibc >= 2.28
In-Reply-To: <20180912083447.5169-1-F.LaRoche@pilz.de>
References: <20180912083447.5169-1-F.LaRoche@pilz.de>
Message-ID: <20180916215728.6250b363@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 10:34:47 +0200, Florian La Roche wrote:
> glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
> and therefore <sys/sysmacros.h> must be included explicitly when
> major()/minor() are used.
> 
> Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
> ---
>  package/mongodb/mongodb.patch | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 package/mongodb/mongodb.patch

Applied to master, after adding a proper description in the patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
