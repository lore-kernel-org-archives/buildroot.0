From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 23:01:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: bump to version
 1.3.4
In-Reply-To: <20200615160952.101687-1-titouan.christophe@railnova.eu>
References: <20200615160952.101687-1-titouan.christophe@railnova.eu>
Message-ID: <20200617230140.23f12c71@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jun 2020 18:09:52 +0200
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> This is a crucial bugfix release that fixes a backward incompatible ABI
> change introduced in 1.3.2.
> 
> Also drop patches that are now applied upstream.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  ...ists.txt-fix-build-on-uclibc-or-musl.patch | 45 ------------------
>  ...X-language-to-support-using-Generate.patch | 46 -------------------
>  package/paho-mqtt-c/paho-mqtt-c.hash          |  2 +-
>  package/paho-mqtt-c/paho-mqtt-c.mk            |  2 +-
>  4 files changed, 2 insertions(+), 93 deletions(-)
>  delete mode 100644 package/paho-mqtt-c/0001-src-CMakeLists.txt-fix-build-on-uclibc-or-musl.patch
>  delete mode 100644 package/paho-mqtt-c/0002-Revert-Enable-CXX-language-to-support-using-Generate.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
