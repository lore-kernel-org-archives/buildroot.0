From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 22:22:45 +0100
Subject: [Buildroot] [PATCH] shairport-sync: bump to version 3.0
In-Reply-To: <20170310204105.29179-1-joerg.krause@embedded.rocks>
References: <20170310204105.29179-1-joerg.krause@embedded.rocks>
Message-ID: <20170310222245.2494cd18@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Mar 2017 21:41:05 +0100, J?rg Krause wrote:
> Support for PolarSSL is deprecated and the usage of mbedTLS is
> recommended, if not OpenSSL is used as crypto backend.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/shairport-sync/Config.in           | 2 +-
>  package/shairport-sync/shairport-sync.hash | 2 +-
>  package/shairport-sync/shairport-sync.mk   | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
