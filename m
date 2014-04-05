From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 14:45:03 +0200
Subject: [Buildroot] [PATCH] ptpd2: handle snmp optional dep
In-Reply-To: <1396650586-19093-1-git-send-email-gustavo@zacarias.com.ar>
References: <1396650586-19093-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140405144503.3c4d808c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  4 Apr 2014 19:29:46 -0300, Gustavo Zacarias wrote:
> Handle the optional net-snmp dep or be explicit in disabling it since
> since it can pick up a distribution net-snmp-config and pollute
> everything. Hopefully fixes:
> http://autobuild.buildroot.net/results/5bd/5bdfcf544a83e18d12e27c598084c0ad520d6164/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/ptpd2/ptpd2.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
