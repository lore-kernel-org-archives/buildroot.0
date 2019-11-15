From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 09:45:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/dtc: bump version to 1.5.1
In-Reply-To: <2e17e96615b10c843fa81e291fedc48749bd98c0.1573797870.git.sbobroff@linux.ibm.com>
References: <2e17e96615b10c843fa81e291fedc48749bd98c0.1573797870.git.sbobroff@linux.ibm.com>
Message-ID: <20191115094502.478cc28b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sam,

On Fri, 15 Nov 2019 17:04:34 +1100
Sam Bobroff <sbobroff@linux.ibm.com> wrote:

> Updated patch 1 to handle changed context.
> Removed patch 2 which is now upstream.
> 
> The update allows QEMU's configure script to successfully detect libfdt.
> 
> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>

We did update to 1.5.1 some time ago, but had to revert, as it was
causing too many problems.

See the revert comit b78eecb2c2a97742cf5cb7e526dffe01d881e753 for more
details.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
