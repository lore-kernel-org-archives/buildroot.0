From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:47:36 +0200
Subject: [Buildroot] [PATCH v2 15/37] toolchain/toolchain.mk: fix code
 style
In-Reply-To: <20180401050850.5701-16-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-16-ricardo.martincoski@gmail.com>
Message-ID: <20180401084736.33b401b0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:28 -0300, Ricardo Martincoski wrote:
> Rearrange the header of the .mk file so it becomes similar to a header
> from a package. It doesn't fit in one line, so split the details to a
> comment below the header.
> 
> GCONV_LIBS is only used inside this file, so rename it to start with
> TOOLCHAIN_, following the namespace convention already used by packages.
> 
> Rename the hook COPY_GCONV_LIBS to TOOLCHAIN_GLIBC_COPY_GCONV_LIBS
> following the convention used for hooks in packages.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Changes v1 -> v2:
>   - also COPY_GCONV_LIBS -> TOOLCHAIN_GLIBC_COPY_GCONV_LIBS  (suggested
>     by Thomas Petazzoni);
>   - fix commit log "it to be similar" -> "it becomes similar";
> ---
>  toolchain/toolchain.mk | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
