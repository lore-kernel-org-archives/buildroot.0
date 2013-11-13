From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Wed, 13 Nov 2013 22:11:34 +0000
Subject: [Buildroot] [PATCH v3 0/7] Add Microblaze internal toolchain
In-Reply-To: <1384378130-8599-1-git-send-email-spenser@gillilanding.com>
References: <1384378130-8599-1-git-send-email-spenser@gillilanding.com>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D685F178EF@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Subject: [PATCH v3 0/7] Add Microblaze internal toolchain
> 
> This patch series adds a Microblaze internal toolchain from the sources at
> http://github.com/Xilinx .
> 
> This series requires that the arc toolchain patches and github helper patches
> are applied.
> 

Tried it here, and everything builds fine. I even enabled a couple of random packages, and no problems seen. Note that I don't have a platform to actually run the binaries on, so this is a build-only test.

Tested-by: Mischa Jonker <mjonker@synopsys.com>

Thanks,

Mischa
