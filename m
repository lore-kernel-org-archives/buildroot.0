From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 10:36:24 +0200
Subject: [Buildroot] [PATCH] libiio: Fix pthread linking for iiod
In-Reply-To: <1465434176-548-1-git-send-email-mfornero@mathworks.com>
References: <20160608235050.74fe60e9@free-electrons.com>
 <1465434176-548-1-git-send-email-mfornero@mathworks.com>
Message-ID: <20160609103624.2e4db9fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Jun 2016 21:02:56 -0400, Matthew Fornero wrote:
> Update the iiod CMake configuration to resolve pthread linking issues
> introduced with commit:
> 
> 17ee15da70d23c314a3264c87a785101cbd9d85d
> ("libiio: Bump version to 0.6")
> 
> Fixes:
> http://autobuild.buildroot.net/results/ffe/ffec14aa79833a6f0889a87b31dae464d083e6a8/
> http://autobuild.buildroot.net/results/49f/49f249632ed021ebe73ee7fab1b55fb3bb4c08f8/
> 
> Signed-off-by: Matthew Fornero <mfornero@mathworks.com>
> ---
>  ...IIOD-Link-pthread-with-no-network-backend.patch |   30 ++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/libiio/0002-IIOD-Link-pthread-with-no-network-backend.patch

Applied to master, thanks. Please submit upstream if not already done!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
