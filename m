From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jun 2016 09:52:11 +0200
Subject: [Buildroot] [PATCH 1/2] beaglebone: Use default U-Boot version
In-Reply-To: <1465075749-31837-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1465075749-31837-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20160605095211.48d06937@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Jun 2016 18:29:08 -0300, Ezequiel Garcia wrote:
> There's no reason to use a specific U-Boot version, given
> we are using upstream. Leave the default version get selected.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

No, that's not our policy. Our policy is to use a fixed version (even
if an upstream one) to make sure that people using the defconfig in the
future will have a known-working version.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
