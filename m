From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 11:10:29 +0100
Subject: [Buildroot] [PATCH] libgpgme: fix build on MIPS with older
 kernel headers
In-Reply-To: <2e227ffb5d56b6d3b40306b14c32e1b6aaa4accc.1513456961.git.baruch@tkos.co.il>
References: <2e227ffb5d56b6d3b40306b14c32e1b6aaa4accc.1513456961.git.baruch@tkos.co.il>
Message-ID: <20171218111029.73a55f79@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Dec 2017 22:42:41 +0200, Baruch Siach wrote:
> MIPS N64 ABI has been missing getdents64 wire up until kernel version
> 3.10. Disable use of getdents on older kernels.
> 
> Fixes:
> http://autobuild.buildroot.net/results/961/9619062ce6642ae4121d7debb3b4c632c88723d5/
> 
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Cc: Philipp Claves <claves@budelmann-elektronik.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libgpgme/libgpgme.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
