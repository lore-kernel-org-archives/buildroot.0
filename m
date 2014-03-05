From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Mar 2014 19:40:23 +0100
Subject: [Buildroot] [PATCH] snmppp: bump to version 3.3.4
In-Reply-To: <1394023806.313.1.camel@phoenix>
References: <1394023806.313.1.camel@phoenix>
Message-ID: <20140305194023.2f3aebac@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Wed, 05 Mar 2014 20:50:06 +0800, Axel Lin wrote:
> Changes snmp++v3.3.4:
> - Fixed: Incorrect time values conversion in += and -= operators of the
>   msec class in msec.cpp.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  package/snmppp/snmppp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
