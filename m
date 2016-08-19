From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 11:25:07 +0200
Subject: [Buildroot] [PATCH] libiio: Add a patch to fix compilation with
 old glibc
In-Reply-To: <1471591558-25611-1-git-send-email-paul.cercueil@analog.com>
References: <1471591558-25611-1-git-send-email-paul.cercueil@analog.com>
Message-ID: <20160819112507.50614d26@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Aug 2016 09:25:58 +0200, Paul Cercueil wrote:
> Cherry-picked from upstream.
> 
> Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
> ---
>  .../0002-CMake-Link-with-librt-if-found.patch      | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/libiio/0002-CMake-Link-with-librt-if-found.patch

You forgot to add a reference to the autobuilder failure, so I've added
that and applied your patch to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
