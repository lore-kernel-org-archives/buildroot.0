From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Oct 2016 13:58:20 +0200
Subject: [Buildroot] [PATCH] package/libupnpp: bump to version 0.15.1
In-Reply-To: <20161011195006.24817-1-joerg.krause@embedded.rocks>
References: <20161011195006.24817-1-joerg.krause@embedded.rocks>
Message-ID: <20161012135820.2c880e5e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Oct 2016 21:50:06 +0200, J?rg Krause wrote:
> Remove patches applied upstream. No need to set AUTORECONF anymore.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/libupnpp/0001-Check-for-std-future.patch | 127 -----------------------
>  package/libupnpp/0002-Add-pkg-config-file.patch  |  63 -----------
>  package/libupnpp/libupnpp.hash                   |   4 +-
>  package/libupnpp/libupnpp.mk                     |   6 +-
>  4 files changed, 3 insertions(+), 197 deletions(-)
>  delete mode 100644 package/libupnpp/0001-Check-for-std-future.patch
>  delete mode 100644 package/libupnpp/0002-Add-pkg-config-file.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
