From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 21:44:26 +0100
Subject: [Buildroot] [PATCH next] libsigsegv: bump to version 2.11
In-Reply-To: <20170223235833.15578-1-gustavo@zacarias.com.ar>
References: <20170223235833.15578-1-gustavo@zacarias.com.ar>
Message-ID: <20170226214426.7a4b3513@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 20:58:33 -0300, Gustavo Zacarias wrote:
> Drop all patches, they're upstream.
> And match that by dropping autoreconf as well.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...ck-direction-for-the-AArch64-architecture.patch | 28 -------------------
>  ...direction-for-the-Microblaze-architecture.patch | 26 ------------------
>  ...k-direction-for-the-Blackfin-architecture.patch | 29 --------------------
>  ...ck-direction-for-the-Nios-II-architecture.patch | 31 ----------------------
>  .../libsigsegv/0005-fix-sparc64-stackpointer.patch | 16 -----------
>  package/libsigsegv/libsigsegv.hash                 |  2 +-
>  package/libsigsegv/libsigsegv.mk                   |  4 +--
>  7 files changed, 2 insertions(+), 134 deletions(-)
>  delete mode 100644 package/libsigsegv/0001-Add-stack-direction-for-the-AArch64-architecture.patch
>  delete mode 100644 package/libsigsegv/0002-Add-stack-direction-for-the-Microblaze-architecture.patch
>  delete mode 100644 package/libsigsegv/0003-Add-stack-direction-for-the-Blackfin-architecture.patch
>  delete mode 100644 package/libsigsegv/0004-Add-stack-direction-for-the-Nios-II-architecture.patch
>  delete mode 100644 package/libsigsegv/0005-fix-sparc64-stackpointer.patch

Applied to next, thanks. Nice to see that we can drop all those patches!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
