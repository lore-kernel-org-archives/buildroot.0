From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 21:39:11 +0100
Subject: [Buildroot] [PATCH] assimp: remove dead "depends on" dependency
In-Reply-To: <1488147748-9833-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488147748-9833-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170227213911.6767faac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Feb 2017 23:22:28 +0100, Thomas Petazzoni wrote:
> BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX has been removed in commit
> 311bc137da2952445683413794f3ebc8e477c9ef ("toolchain: kill ADI
> Blackfin toolchain"), so this "depends on" is useless.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/assimp/Config.in | 5 -----
>  1 file changed, 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
