From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 23:11:03 +0200
Subject: [Buildroot] [PATCH v3,
 1/2] package/kismet: bump to version 2020-09-R3
In-Reply-To: <20201004155004.1374536-1-fontaine.fabrice@gmail.com>
References: <20201004155004.1374536-1-fontaine.fabrice@gmail.com>
Message-ID: <20201015231103.498a19ae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  4 Oct 2020 17:50:03 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop all patches (not needed anymore)
> - Update help message of Config.in: kismet does not support only WiFi
>   but also Bluetooth, SDR ...
> - Remove ncurses dependency
> - libnl is now optional
> - Drop --with-netlink-version (not available anymore)
> - Add protobuf, protobuf-c, sqlite and zlib mandatory dependencies
> - kismet_client and kismet_drone have been dropped since version 2019-04-R1
> - Select libmicrohttpd for kismet_server
> - Add optional libusb and lm-sensors dependencies
> - Use --{enable,disable}-{libcap,pcre} options
> - Use the new LICENSE file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3:
>  - Bump to version 2020-09-R3

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
