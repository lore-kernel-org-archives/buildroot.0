From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 21:37:22 +0200
Subject: [Buildroot] [PATCH] putty: fix musl build
In-Reply-To: <04962c9264edbe6a6a2a00954c50e0ed1a78fbf4.1463942779.git.baruch@tkos.co.il>
References: <04962c9264edbe6a6a2a00954c50e0ed1a78fbf4.1463942779.git.baruch@tkos.co.il>
Message-ID: <20160522213722.39ad16a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 May 2016 21:46:19 +0300, Baruch Siach wrote:
> Add upstream patch for fixing build with musl.
> 
> Fixes:
> http://autobuild.buildroot.net/results/84b/84b8e3e73f7e70ea1f013fc7c1120cf23095a77a/
> http://autobuild.buildroot.net/results/b7c/b7cd550af983165d7d930bcc68fcab5bad00159d/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/putty/0001-uxcons-Fix-on-musl-libc.patch | 29 ++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/putty/0001-uxcons-Fix-on-musl-libc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
