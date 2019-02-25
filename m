From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Feb 2019 22:31:33 +0100
Subject: [Buildroot] [PATCH-for-master 2/2] package/iproute2: backport
 patch to fix compilation under glibc < 2.18
In-Reply-To: <20190225211147.14947-3-patrickdepinguin@gmail.com>
References: <20190225211147.14947-1-patrickdepinguin@gmail.com>
 <20190225211147.14947-3-patrickdepinguin@gmail.com>
Message-ID: <20190225223133.700ed8da@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 25 Feb 2019 22:11:47 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> When compiling iproute2 using a toolchain containing glibc 2.17 and older, it fails due to a missing definition of AF_VSOCK.

So you're no longer wrapping your commit logs ? :-)

> 
> Add a submitted and accepted upstream patch to fix this issue.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  ...-ss-fix-compilation-under-glibc-2.18.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/iproute2/0002-ss-fix-compilation-under-glibc-2.18.patch

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
