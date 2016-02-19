From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2016 22:40:47 +0100
Subject: [Buildroot] [PATCH v5 18/20] python-service-identity: new
 package
In-Reply-To: <1455188328-7595-1-git-send-email-mc5686@mclink.it>
References: <1455188328-7595-1-git-send-email-mc5686@mclink.it>
Message-ID: <20160219224047.6276af21@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mauro,

On Thu, 11 Feb 2016 11:58:46 +0100, Mauro Condarelli wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>

Just a quick comment: it is really horrible for people
reviewing/applying your patches that you sent this patch separately
from the rest of the series. Now I have to manually figure out that
this patch labeled 18/20 in your v5 is in fact needed for patch 09/17
in your v4.

Please resend full series, so that the dependencies between patches
remain explicit. Or if you don't do that, resend the new iteration of a
patch as a reply to the previous patch and with the same sequence
number.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
