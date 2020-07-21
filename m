From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Jul 2020 09:45:49 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/cryptodev-linux: bump to
 version f2927e3
In-Reply-To: <20200720211114.689018-1-alejandro.gonzalez.correo@gmail.com>
References: <20200720211114.689018-1-alejandro.gonzalez.correo@gmail.com>
Message-ID: <20200721094549.3d88acf9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Jul 2020 23:11:14 +0200
Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com> wrote:

> This version mainly fixes build issues with more
> recent kernels.
> 
> 98b163a cryptlib.c: fix build on kernel v5.5+
> 7e72f67 enabled the support for TLS1.1 - AES128-SHA1 - AES256-SHA1
> 9e76506 Fix build for Linux 5.8-rc1
> 
> Signed-off-by: Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com>
> 
> ---
> Changes v1 -> v2:
> 	- Fix download tarball hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
