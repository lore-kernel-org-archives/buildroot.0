From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 11:38:57 +0100
Subject: [Buildroot] [PATCH] shairport-sync: bump to version 3.0.1
In-Reply-To: <20170311080024.24528-1-joerg.krause@embedded.rocks>
References: <20170311080024.24528-1-joerg.krause@embedded.rocks>
Message-ID: <20170312113857.53a11b31@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Mar 2017 09:00:24 +0100, J?rg Krause wrote:
> Support for PolarSSL is deprecated and the usage of mbedTLS is
> recommended, if not OpenSSL is used as crypto backend.
> 
> Also change the direction of the OpenSSL/mbedTLS package selection to
> be the same as in ustream-ssl to prevent a circular dependency.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/shairport-sync/Config.in           | 2 +-
>  package/shairport-sync/shairport-sync.hash | 2 +-
>  package/shairport-sync/shairport-sync.mk   | 8 ++++----
>  3 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
