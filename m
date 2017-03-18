From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 15:03:14 +0100
Subject: [Buildroot] [PATCH] s6-rc: expose the host variant in menuconfig
In-Reply-To: <20170316213758.1362-1-eric.le.bihan.dev@free.fr>
References: <20170316213758.1362-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170318150314.316e5412@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Mar 2017 22:37:58 +0100, Eric Le Bihan wrote:
> Some users may want to build the s6-rc service database offline using a
> post-build script. So make the host variant visible in menuconfig.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/Config.in.host       | 1 +
>  package/s6-rc/Config.in.host | 8 ++++++++
>  2 files changed, 9 insertions(+)
>  create mode 100644 package/s6-rc/Config.in.host

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
