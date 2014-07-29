From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 23:42:35 +0200
Subject: [Buildroot] [PATCH] uclibc: build tests after uClibc libs are
 installed to staging location
In-Reply-To: <1406039278-19117-1-git-send-email-abrodkin@synopsys.com>
References: <1406039278-19117-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140729234235.74119719@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 22 Jul 2014 18:27:58 +0400, Alexey Brodkin wrote:

> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 
> Cc: Anton Kolesov <akolesov@synopsys.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/uclibc/uclibc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

After some discussion with Yann, we didn't see any other solution that
doesn't involve complex change to solve just that one specific case.
Therefore: patch applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
