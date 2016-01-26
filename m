From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 22:44:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/odhcp6c: bump version to fix
 musl build
In-Reply-To: <1453591294-24061-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453591294-24061-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160126224456.2f73d395@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 24 Jan 2016 00:21:34 +0100, Bernd Kuhls wrote:
> The autobuilders did not catch the error yet because they failed
> earlier with other packages, but I am continuing the build using
> the defconfig from:
> http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/odhcp6c/odhcp6c.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks. As suggested by Arnout, please send a follow-up patch
to add a hash file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
