From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 2 Jul 2017 16:49:05 +0300
Subject: [Buildroot] [PATCH 3/4] toolchain-external: copy ld*.so* for
 all C libraries
In-Reply-To: <20170702134107.11488-4-thomas.petazzoni@free-electrons.com>
References: <20170702134107.11488-1-thomas.petazzoni@free-electrons.com>
 <20170702134107.11488-4-thomas.petazzoni@free-electrons.com>
Message-ID: <20170702134905.yjonqh3etsbwjhik@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Jul 02, 2017 at 03:41:06PM +0200, Thomas Petazzoni wrote:
> -define TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
> -	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-$(MUSL_ARCH).so.1
> -endef
> -endif

You should also remove the reference to TOOLCHAIN_EXTERNAL_MUSL_LD_LINK below.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
