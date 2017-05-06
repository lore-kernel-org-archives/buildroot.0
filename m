From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 May 2017 15:55:44 +0200
Subject: [Buildroot] [PATCH] package/openpowerlink: bump to v2.5.2
In-Reply-To: <20170506110247.17670-1-romain.naour@smile.fr>
References: <20170506110247.17670-1-romain.naour@smile.fr>
Message-ID: <20170506155544.2fe3c7c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 May 2017 13:02:47 +0200, Romain Naour wrote:
> Remove upstream patch.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  ...Veth-Fix-compilation-on-Linux-kernels-4.7.patch | 35 ----------------------
>  package/openpowerlink/openpowerlink.hash           |  8 ++---
>  package/openpowerlink/openpowerlink.mk             |  2 +-
>  3 files changed, 5 insertions(+), 40 deletions(-)
>  delete mode 100644 package/openpowerlink/0004-FIX-Veth-Fix-compilation-on-Linux-kernels-4.7.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
