From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 15:14:05 +0200
Subject: [Buildroot] [PATCH 1/9] iMX6S-PICO: add default config file
 (imx6spico_defconfig)
In-Reply-To: <1507724378-23461-1-git-send-email-agambier.dev@gmail.com>
References: <1507724378-23461-1-git-send-email-agambier.dev@gmail.com>
Message-ID: <20171011151405.3fd491f9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Oct 2017 14:19:30 +0200, Alexandre Gambier wrote:
> Signed-off-by: Alexandre Gambier <agambier.dev@gmail.com>

Thanks for your contributions.

However, as I have written to you off list already, your patches 7/9,
8/9 and 9/9 will not make it to the list because they are too big.

And we anyway don't want such huge firmware files in Buildroot
directly, as I already explained to you. Especially without a license
file.

Can you instead work with the linux-firmware project to get those
firmware files included? This will obviously require to have a proper
license for them, but that would anyway be needed for you to be allowed
to redistribute them.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
