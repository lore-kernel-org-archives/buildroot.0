From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 22:51:50 +0100
Subject: [Buildroot] [PATCH v5 1/2] zlib-ng: rename zlib to libzlib
In-Reply-To: <20171129211714.1326-1-stefan.froberg@petroprogram.com>
References: <20171129211714.1326-1-stefan.froberg@petroprogram.com>
Message-ID: <20180103225150.3fdc1a79@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Nov 2017 23:17:13 +0200, Stefan Fr?berg wrote:
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> ---
> Changes v4 -> v5:

I've applied, after adding BR2_PACKAGE_PROVIDES_HOST_ZLIB as suggested
by Yann E. Morin, and reworking the commit title and commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
