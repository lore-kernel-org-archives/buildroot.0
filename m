From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:20:46 +0200
Subject: [Buildroot] [PATCH 1/3] package/kvazaar: add host-pkgconf
 dependency
In-Reply-To: <20170704230857.7916-1-romain.naour@smile.fr>
References: <20170704230857.7916-1-romain.naour@smile.fr>
Message-ID: <20170705012046.2c1d99b9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Jul 2017 01:08:55 +0200, Romain Naour wrote:
> The build system use PKG_CHECK_MODULES.
> 
> checking pkg-config is at least version 0.9.0... ./configure: line 16886: output/host/usr/bin/pkg-config: No such file or directory
> no
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/kvazaar/kvazaar.mk | 1 +
>  1 file changed, 1 insertion(+)

All three patches applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
