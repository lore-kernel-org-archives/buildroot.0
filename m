From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 21 Dec 2015 20:51:50 +0200
Subject: [Buildroot] [PATCH 3/8 RFC] core/pkg-generic: install
 foo-config scripts in their own dir
In-Reply-To: <66985474d41d8d25b6f75560665322b88f6e6813.1450712392.git.yann.morin.1998@free.fr>
References: <cover.1450712392.git.yann.morin.1998@free.fr>
 <66985474d41d8d25b6f75560665322b88f6e6813.1450712392.git.yann.morin.1998@free.fr>
Message-ID: <20151221185150.GC1548@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Dec 21, 2015 at 04:56:54PM +0100, Yann E. MORIN wrote:
> +# foo-config scripts for the target go here
> +FOO_CONFIG_DIR := $(HOST_DIR)/opt/foo-config

That's an unusual name for "real" identifiers and directories. But maybe it's 
just me. How about LIB_CONFIG_SCRIPT_DIR instead?

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
