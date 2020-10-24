From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:55:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: fix SSP build
In-Reply-To: <20201020111647.1605963-1-egorenar@linux.ibm.com>
References: <20201020111647.1605963-1-egorenar@linux.ibm.com>
Message-ID: <20201024225556.2140e616@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 20 Oct 2020 13:16:47 +0200
Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.net/results/f906ca8650a7a9ccca4a2ee359a807d08a7763b9
> 
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  .../0001-zipl-boot-disable-SSP.patch          | 28 +++++++++++++++++++
>  .../0002-genprotimg-boot-disable-SSP.patch    | 28 +++++++++++++++++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 package/s390-tools/0001-zipl-boot-disable-SSP.patch
>  create mode 100644 package/s390-tools/0002-genprotimg-boot-disable-SSP.patch

Applied to master, thanks. Could you make sure to get the two patches
applied to the upstream project ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
