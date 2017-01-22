From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jan 2017 17:47:23 +1100
Subject: [Buildroot] [PATCH 1/1]
 package/x11r7/xdriver_xf86-video-openchrome: needs DRI
In-Reply-To: <20170121205929.9516-1-bernd.kuhls@t-online.de>
References: <20170121205929.9516-1-bernd.kuhls@t-online.de>
Message-ID: <20170122174723.1aa4cfe6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Jan 2017 21:59:29 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/89c/89c9641553734495aa7844951dfd25fe0ec0d9f9/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xdriver_xf86-video-openchrome/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
