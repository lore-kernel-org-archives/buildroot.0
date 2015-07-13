From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 02:07:40 +0200
Subject: [Buildroot] [PATCH 1/3] nfs-utils: Add rpcbind as a runtime
 dependency
In-Reply-To: <1436626101-3598-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436626101-3598-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150713020740.5a4881d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat, 11 Jul 2015 16:48:19 +0200, Maxime Hadjinlian wrote:
> rpcbind is necessary for nfs_utils to works as a server
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/nfs-utils/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
