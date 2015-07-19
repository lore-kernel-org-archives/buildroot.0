From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jul 2015 14:37:55 +0200
Subject: [Buildroot] [PATCH v4 1/2] boot/uboot: add support for the
 kconfig infrastructure
In-Reply-To: <1437074345-28332-1-git-send-email-joerg.krause@embedded.rocks>
References: <1437074345-28332-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150719143755.45ac0a25@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 16 Jul 2015 21:19:04 +0200, J?rg Krause wrote:
> With the patchset "kconfig: turnaround into single .config"
> [http://lists.denx.de/pipermail/u-boot/2015-February/205490.html]
> U-Boot switched to a single .config file for board configuration. This allows
> us to use the kconfig-package infrastructure.
> 
> For providing backward compatibility with older U-Boot version a user choice
> between the new Kconfig and the legacy build system is introduced.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> Changes v3 -> v4:
>   - check for config file before calling kconfig-package
>   - remove misleading text from commit log

I've applied with some minor changes:

    [Thomas:
      - make use of the legacy build system the default, to not break
        existing configurations.
      - add some comments in the code checking all the configuration
        options, in order to hopefully make it a bit clearer.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
