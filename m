From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 19 May 2014 12:08:46 +0200
Subject: [Buildroot] Problems building for Olimex A13. A new user
 enquires ...
In-Reply-To: <0ade01cf7348$1daadc10$59009430$@novadsp.com>
References: <09d801cf72fa$f6cc2c40$e46484c0$@novadsp.com>
 <20140519025610.GE27238@tarshish>
 <0ade01cf7348$1daadc10$59009430$@novadsp.com>
Message-ID: <20140519100846.GF29466@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, May 19, 2014 at 10:52:58AM +0100, g4 at novadsp.com wrote:
> Hello Baruch.
> 
> Attached as A13.config. Modified to set up as follows:
> 
> BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="sunxi"
> BR2_TARGET_UBOOT_VERSION="sunxi"
> 
> Even though I can pull and build u-boot on its own Buildroot still fails as
> shown below. I realize this is bound to be user error so thanks again.
> 
> inux-uclibcgnueabi-" ARCH=arm A13-Olimex_config

You have to set BR2_TARGET_UBOOT_BOARDNAME to A13-OLinuXino.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140519/713f428f/attachment.asc>
