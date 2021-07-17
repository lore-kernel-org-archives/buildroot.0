From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:02:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtipc: renumber patches
In-Reply-To: <20210716221328.347351-1-fontaine.fabrice@gmail.com>
References: <20210716221328.347351-1-fontaine.fabrice@gmail.com>
Message-ID: <20210717100236.7fcac4d2@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 17 Jul 2021 00:13:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 883a33ece55c6ef23c33a41196fddabadf140427 forgot to renumber
> remaining patches
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-Automatically-generate-XDR-header-files-from-.x-sour.patch} | 0
>  ...02-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch} | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/libtirpc/{0003-Automatically-generate-XDR-header-files-from-.x-sour.patch => 0001-Automatically-generate-XDR-header-files-from-.x-sour.patch} (100%)
>  rename package/libtirpc/{0004-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch => 0002-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
