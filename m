From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Nov 2016 15:30:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/qemu: add option to include
 tools
In-Reply-To: <00428a8b4d56493b9a3f68349b42bf9b71f6055e.1479860211.git.sam.bobroff@au1.ibm.com>
References: <00428a8b4d56493b9a3f68349b42bf9b71f6055e.1479860211.git.sam.bobroff@au1.ibm.com>
Message-ID: <20161126153028.7d5e543b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 11:16:52 +1100, Sam Bobroff wrote:
> Add an option to QEMU to include the "tools" (configure option:
> --enable-tools) in the target. This adds a dependency on pixman, but
> that's already present.
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---
> Hi Buildroot,

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
