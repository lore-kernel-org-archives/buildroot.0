From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 10:08:03 +0200
Subject: [Buildroot] [PATCHv3 0/3] new packages: atfirmware and
 scpfirmware
In-Reply-To: <cover.1476458119.git.jpinto@synopsys.com>
References: <cover.1476458119.git.jpinto@synopsys.com>
Message-ID: <20161015100803.0a714960@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Oct 2016 16:21:08 +0100, Joao Pinto wrote:
> This patch adds to buildroot an important package for ARM64 based development 
> boards: The ARM Trusted Firmware (atfirmware).
> It also adds the scpfirmware which is a hidden package to get the System Control
> Processor (SCP) binary to be included in the bootloader (fip image), which is
> a requirement for ARM Juno's board. With this 2 packages, Juno gets fully 
> supported in the Buildroot.
> 
> Tested-by: Liviu Dudau <Liviu.Dudau@arm.com>

I sent a new iteration of your patches, see
http://lists.busybox.net/pipermail/buildroot/2016-October/174316.html.
Sorry I forgot to Cc you on this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
