From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Feb 2016 09:53:46 +0100
Subject: [Buildroot] [PATCH v2] kernel-module-imx-gpu-viv: add new
 package
In-Reply-To: <1454369891-27330-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1454369891-27330-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160202095346.05bd3a05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Tue,  2 Feb 2016 00:38:11 +0100, Gary Bisson wrote:
> This is the Vivante kernel driver split from the kernel source code in
> order to make it possible to be used in any kernel source since 3.10.53.
> 
> The driver source code provided by Freescale needs fixes so the
> community forked the code to allow faster development and easier
> integration of fixes from the community.
> 
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/32cf391
> https://github.com/Freescale/meta-fsl-arm/commit/4249193
> 
> This package has been tested with the following commands:
>  # modprobe galcore
>  # cd /usr/share/examples/viv_samples/vdk/
>  # ./tutorial7
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
