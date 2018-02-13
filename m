From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 22:55:59 +0100
Subject: [Buildroot] [PATCH] package/mesa-demo: remove duplicate osmesa
 option
In-Reply-To: <20180212215931.6105-1-audrey.motheron@gmail.com>
References: <20180212215931.6105-1-audrey.motheron@gmail.com>
Message-ID: <20180213225559.4aa1f993@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Feb 2018 22:59:31 +0100, Audrey Motheron wrote:
> --disable-osmesa option is unconditionally added to CONF_OPTS
> even if --enable-osmesa is used latter.
> 
> Signed-off-by: Audrey Motheron <audrey.motheron@gmail.com>
> ---
>  package/mesa3d-demos/mesa3d-demos.mk | 1 -
>  1 file changed, 1 deletion(-)

As Adrian said, the commit title should match the package name:
mesa3d-demos. I've fixed that up and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
