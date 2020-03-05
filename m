From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Mar 2020 09:03:22 +0100
Subject: [Buildroot] [PATCH 1/2] package/libtirpc: fix build with gcc 10
In-Reply-To: <20200305043708.GA2841817@x230>
References: <20200228173052.5128-1-petr.vorel@gmail.com>
 <20200305043708.GA2841817@x230>
Message-ID: <20200305090322.5b1e5fcc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 5 Mar 2020 05:37:08 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

> > This issue seems to be happening only on the next branch. Why? Anything
> > special in next compared to master?  
> No idea why, libtirpc itself it's the same. It'd help if I could find builds for
> master, but autobuild search doesn't help to search packages, which does not
> fail, there is only search for failed packages:
> 
> http://autobuild.buildroot.net/index.php?reason=libtirpc-1.2.5
> 
> Is it running for master?

You can search the autobuilders for successful build results, filtering
per config options. See http://autobuild.buildroot.net/search.php.

For example:

  http://autobuild.buildroot.net/index.php?status=OK&symbols%5BBR2_PACKAGE_LIBTIRPC%5D=y

will search all successful builds that had BR2_PACKAGE_LIBTIRPC enabled.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
