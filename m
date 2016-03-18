From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 23:29:40 +0100
Subject: [Buildroot] [PATCH 06/14] kernel-module-imx-gpu-viv: bump
	version to 5.0.11 p7.4
In-Reply-To: <1458140214-22303-7-git-send-email-gary.bisson@boundarydevices.com>
 (Gary Bisson's message of "Wed, 16 Mar 2016 15:56:46 +0100")
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
 <1458140214-22303-7-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <874mc31ktn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > In order to match the imx-gpu-viv graphics libraries version.
 > This patch is based on the Yocto equivalent:
 > https://github.com/Freescale/meta-fsl-arm/commit/dcfa6752

 > This package has been tested with the following commands:
 >  # modprobe galcore
 >  # cd /usr/share/examples/viv_samples/vdk/
 >  # ./tutorial7

 > Signen-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
