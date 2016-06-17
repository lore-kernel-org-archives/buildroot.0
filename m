From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 17 Jun 2016 18:01:17 +0300
Subject: [Buildroot] [PATCH 1/1] libvdpau: new package
In-Reply-To: <1466173136-25627-1-git-send-email-damien@kal-host.com>
References: <1466173136-25627-1-git-send-email-damien@kal-host.com>
Message-ID: <20160617150116.GT2749@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Damien,

On Fri, Jun 17, 2016 at 04:18:56PM +0200, Damien Lanson wrote:
> +LIBVDPAU_VERSION = 1.1.1
> +LIBVDPAU_SOURCE = libvdpau-$(LIBVDPAU_VERSION).tar.bz2
> +LIBVDPAU_SITE = http://people.freedesktop.org/~aplattner/vdpau
> +LIBVDPAU_LICENSE = NVIDIA Corporation

The copyright is of NVIDIA, but the license looks like MIT. See 
https://opensource.org/licenses/MIT.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
