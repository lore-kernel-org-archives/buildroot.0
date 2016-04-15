From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 09:36:46 +0200
Subject: [Buildroot] [PATCH] memcached: fix musl build
In-Reply-To: <1163900c34d6fa034bcb8defc1b0f6578a293b28.1460697551.git.baruch@tkos.co.il>
References: <1163900c34d6fa034bcb8defc1b0f6578a293b28.1460697551.git.baruch@tkos.co.il>
Message-ID: <20160415093646.4571d2c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Apr 2016 08:19:11 +0300, Baruch Siach wrote:
> Add a patch fixing pre-processor warnings that breaks the build. The patch is
> pending upstream.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../memcached/0001-fix-build-with-musl-libc.patch  | 78 ++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 package/memcached/0001-fix-build-with-musl-libc.patch

I've added a reference to the autobuilder failure being fixed by this
patch, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
