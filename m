From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jan 2016 13:54:05 +0100
Subject: [Buildroot] [PATCH v3] netsniff-ng: check if linux-headers are
 v3.0 or higher
In-Reply-To: <1452870220-1045-1-git-send-email-joris.lijssens@gmail.com>
References: <1452870220-1045-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <20160116135405.4e9079d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joris Lijssens,

On Fri, 15 Jan 2016 16:03:40 +0100, Joris Lijssens wrote:
> netsniff-ng uses the TP_STATUS_VLAN_VALID define, provided by the
> kernel headers. This definition has been added in the kernel by commit
> a3bcc23e890a6d49d6763d9eb073d711de2e0469 ("af-packet: Add flag to
> distinguish VID 0 from no-vlan"), which was merged in v3.0.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c87/c87a440e29ae387f600cb6ecce3caaa08557f4f0/
> 
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
>  package/netsniff-ng/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
