From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 20:23:55 +0200
Subject: [Buildroot] [PATCH] toolchain-external: add fortran support
 option for custom external toolchains
In-Reply-To: <20180714171542.8192-1-romain.naour@gmail.com>
References: <20180714171542.8192-1-romain.naour@gmail.com>
Message-ID: <20181020202355.4534460b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 Jul 2018 19:15:42 +0200, Romain Naour wrote:
> If a custom external toolchain is used, we can't enable the fortran
> support. Add a new option for that.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
>  .../toolchain-external-custom/Config.in.options                   | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
