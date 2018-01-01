From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 23:04:33 +0100
Subject: [Buildroot] [PATCH] sysstat: bump to version 11.6.1
In-Reply-To: <6a909e7705ea5ef23e992b3dbdb6c1671f6bc8fb.1514834682.git.baruch@tkos.co.il>
References: <6a909e7705ea5ef23e992b3dbdb6c1671f6bc8fb.1514834682.git.baruch@tkos.co.il>
Message-ID: <20180101230433.425bf7b4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Jan 2018 21:24:42 +0200, Baruch Siach wrote:
> The isag tool has been removed in version 11.5.5; no need to avoid its
> installation anymore.
> 
> Add license file hash.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/sysstat/sysstat.hash | 5 +++--
>  package/sysstat/sysstat.mk   | 6 +-----
>  2 files changed, 4 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
