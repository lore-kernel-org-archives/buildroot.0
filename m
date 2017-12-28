From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 23:22:10 +0100
Subject: [Buildroot] [PATCH v4 2/2] docs/manual: document meson-based
 packages
In-Reply-To: <20171029131052.18850-3-eric.le.bihan.dev@free.fr>
References: <20171029131052.18850-1-eric.le.bihan.dev@free.fr>
 <20171029131052.18850-3-eric.le.bihan.dev@free.fr>
Message-ID: <20171228232210.5dda9865@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 14:10:52 +0100, Eric Le Bihan wrote:
> Add instructions for adding a package which uses the Meson build system.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

I've applied to the master branch, after adding an entry in the
DEVELOPERS file. I also have one comment/question below.


> +27: define FOO_CONFIGURE_CMDS
> +28: 	rm -rf $(@D)/build
> +29: 	mkdir -p $(@D)/build

Is this really needed? It's not really nice to have to do this. But
perhaps meson really insists in having an empty build directory ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
