From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 17:01:16 +0100
Subject: [Buildroot] [PATCH] package: qemu: bump version to 2.8.0 from
 2.7.0
In-Reply-To: <20170210190815.10517-1-yurovsky@gmail.com>
References: <20170210190815.10517-1-yurovsky@gmail.com>
Message-ID: <20170211170116.6c2601cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Feb 2017 11:08:15 -0800, Andrey Yurovsky wrote:
> This adds a CPU definition for the Cortex A7 along with improvements described
> here: http://wiki.qemu-project.org/ChangeLog/2.8
> 
> Tested on an ARM Cortex A7 target (both target and host builds). The change log
> does not describe any incompatible changes that would affect buildroot targets
> as far as I am aware.
> 
> Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
> ---
>  package/qemu/qemu.hash | 2 +-
>  package/qemu/qemu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks. I've just removed the "from 2.7.0" part of the
commit title, since we generally don't indicate this in commit title of
package bumps.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
