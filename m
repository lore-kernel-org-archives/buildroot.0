From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Nov 2018 21:04:20 +0100
Subject: [Buildroot] [PATCH v2] package/linux-tools: add support for
 pcitest tool
In-Reply-To: <ffbc28844740f39f96b54a32d623bd1bf8409814.1542088510.git.gustavo.pimentel@synopsys.com>
References: <ffbc28844740f39f96b54a32d623bd1bf8409814.1542088510.git.gustavo.pimentel@synopsys.com>
Message-ID: <20181113210420.2fa336f9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Nov 2018 06:55:53 +0100, Gustavo Pimentel wrote:
> Add support for selection and compiling the pcitest tool on buildroot.
> 
> This tool is available to be compiled since kernel 4.20.
> 
> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> ---
>  package/linux-tools/Config.in            |  9 +++++++++
>  package/linux-tools/linux-tool-pci.mk.in | 27 +++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 package/linux-tools/linux-tool-pci.mk.in

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
