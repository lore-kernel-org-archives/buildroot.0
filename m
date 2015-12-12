From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 16:59:16 +0100
Subject: [Buildroot] [PATCH] netsnmp: enable tsm + DTLSUDP/TLSTCP with
 openssl
In-Reply-To: <1449685823-30946-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1449685823-30946-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20151212165916.52fe10eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Wed,  9 Dec 2015 15:30:23 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Otherwise the openssl support is basically unused.
> 
> net-snmp provides a stripped-down openssl implementation that can be
> used to enable tsm/DTLSUDP/TLSTCP but given it's security track record
> it's best to rely on the external one, it also saves space.
> 
> usm is the user validation module, it's default on, however when passing
> --with-security-modules we must keep it otherwise it won't be.
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/netsnmp/netsnmp.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
