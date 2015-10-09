From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 23:02:03 +0200
Subject: [Buildroot] [PATCH v3] board: add support for Synopsys VDK
 Software Development Platform
In-Reply-To: <7cfe6681e738e9696eba42b8128eea1da7d3eb30.1444400688.git.jpinto@synopsys.com>
References: <7cfe6681e738e9696eba42b8128eea1da7d3eb30.1444400688.git.jpinto@synopsys.com>
Message-ID: <20151009230203.60d73fec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joao Pinto,


> +CONFIG_DEFAULT_MMAP_MIN_ADDR=32768
> +CONFIG_TRANSPARENT_HUGEPAGE=y
> +CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
> +CONFIG_CMDLINE="Image console=ttyAMA0 earlyprintk=pl011,0x1c090000 debug user_debug=31 loglevel=9 root=/dev/vda"

The "Image" option looks weird. What does it do?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
