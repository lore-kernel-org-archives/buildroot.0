From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 13:20:01 +0100
Subject: [Buildroot] [PATCH] omniorb: remove autoreconf
In-Reply-To: <4898671233ed0fa441e196c13d8d64239ca7255b.1457211849.git.baruch@tkos.co.il>
References: <4898671233ed0fa441e196c13d8d64239ca7255b.1457211849.git.baruch@tkos.co.il>
Message-ID: <20160306132001.3853be5f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sat,  5 Mar 2016 23:04:09 +0200, Baruch Siach wrote:
> Commit 03ee7f9823af (package/omniorb: bump version to 4.2.1) removed the patch
> to configure.ac, making autoreconf redundant.
> 
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/omniorb/omniorb.mk | 3 ---
>  1 file changed, 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
