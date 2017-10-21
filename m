From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 18:33:46 +0200
Subject: [Buildroot] [PATCH] uboot: Make Kconfig a default build system
In-Reply-To: <1508602460-4807-1-git-send-email-abrodkin@synopsys.com>
References: <1508602460-4807-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20171021183346.19bf1e91@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Oct 2017 19:14:20 +0300, Alexey Brodkin wrote:
> Given now default U-Boot version is 2017.09 and it requires
> Kconfig build system it makes perfect sense to have default
> build system which matches U-Boot version requirements.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

This will break all defconfigs of people that still use older U-Boot
versions. So I'm not sure if/when we want to do it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
