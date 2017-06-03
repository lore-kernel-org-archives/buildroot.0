From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jun 2017 17:07:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/vdr: needs headers >= 3.9
In-Reply-To: <20170603141540.25469-1-bernd.kuhls@t-online.de>
References: <20170603141540.25469-1-bernd.kuhls@t-online.de>
Message-ID: <20170603170759.27801028@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Jun 2017 16:15:40 +0200, Bernd Kuhls wrote:
> DVBv5 statistics properties were added in kernel 3.9:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/include/uapi/linux/dvb/frontend.h?h=v3.9
> 
> Fixes
> http://autobuild.buildroot.net/results/c6c/c6ce6ca1986f2b82ff03e55dc650484f858b7e32/
> http://autobuild.buildroot.net/results/208/20887b7161d895c2348c29f91e3d4b3f1c6f25e0/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vdr/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
