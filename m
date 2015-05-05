From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 18:42:04 +0200
Subject: [Buildroot] [PATCH 2/2] package/libtirpc: Add patches to fix
	musl build
In-Reply-To: <1430843074-30355-2-git-send-email-joerg.krause@embedded.rocks>
References: <1430843074-30355-1-git-send-email-joerg.krause@embedded.rocks>
 <1430843074-30355-2-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150505184204.594030c6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Tue,  5 May 2015 18:24:34 +0200, J?rg Krause wrote:
> Add patches to fix several build issues with the musl C library. To distinguish
> the musl patches from the other patches start the patchset with a number of 10.
> 
> Fixes:
> http://autobuild.buildroot.net/results/54b/54b519d67447d02bc3962511c894741172d56a0c/
> http://autobuild.buildroot.net/results/b1d/b1d31727a60f1d5a435dd07dacf1e463f0f8ccde/
> http://autobuild.buildroot.net/results/a10/a10c9766151916ee9055ee72c44283ceb9401e88/
> 
> and more.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

After those patches, did you test building libtirpc with glibc and
uClibc?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
