From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 15:43:22 +0100
Subject: [Buildroot] [PATCH 1/1] e2fsprogs: findfs is available in
 BR2_PACKAGE_UTIL_LINUX_BINARIES
In-Reply-To: <1480603533-34023-1-git-send-email-phil@zankapfel.net>
References: <1480603533-34023-1-git-send-email-phil@zankapfel.net>
Message-ID: <20161211154322.1d2ecdce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  1 Dec 2016 15:45:33 +0100, Phil Eichinger wrote:
> 031659024b3cf27bb68dc58d07519b563ef472a1 removed the option
> BR2_PACKAGE_UTIL_LINUX_FINDFS as it is always built by default.
> 
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
> ---
>  Config.in.legacy | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
