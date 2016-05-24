From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 15:16:56 +0200
Subject: [Buildroot] [PATCH] qt5serialbus: depend on toolchain headers
 >= 3.6
In-Reply-To: <1463557550-3622-1-git-send-email-yegorslists@googlemail.com>
References: <1463557550-3622-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160524151656.65ff9aa2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 May 2016 09:45:50 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> qt5serialbus requires CAN FD support, that was introduced
> in kernel 3.6. Add appropriate toolchain headers dependency.
> 
> Fixes:
> http://autobuild.buildroot.net/results/617/6176a24799b5d80312be954089efbbb498fa1571/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/qt5/qt5serialbus/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
