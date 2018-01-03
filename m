From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 22:52:28 +0100
Subject: [Buildroot] [PATCH v5 2/2] zlib-ng: new package
In-Reply-To: <20171129211714.1326-2-stefan.froberg@petroprogram.com>
References: <20171129211714.1326-1-stefan.froberg@petroprogram.com>
 <20171129211714.1326-2-stefan.froberg@petroprogram.com>
Message-ID: <20180103225228.7276bfc7@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Nov 2017 23:17:14 +0200, Stefan Fr?berg wrote:
> zlib-ng, a fast Zlib replacement
> 
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> ---
> Changes v4 -> v5:

I've applied, after dropping the host variant of zlib-ng, since
host-zlib always builds host-libzlib.

I've also dropped empty newlines in the hash file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
