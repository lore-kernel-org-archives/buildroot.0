From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 11:35:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/igmpproxy: uses fork, needs mmu
In-Reply-To: <1465533178-28513-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465533178-28513-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160610113552.5c3e8f37@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Jun 2016 06:32:58 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/4ee/4ee081212614d86a3b2b74274f38825f7a5b3f6f/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/igmpproxy/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
