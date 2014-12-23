From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 11:19:40 +0100
Subject: [Buildroot] [PATCH] system: add "askfirst shell" as an option
 for busybox init
In-Reply-To: <1419327626.2781.2.camel@synopsys.com>
References: <1418633784-7709-1-git-send-email-abrodkin@synopsys.com>
 <20141216081450.6438bdb6@free-electrons.com>
 <1418828592.4132.7.camel@synopsys.com>
 <20141217161406.1f418842@free-electrons.com>
 <1418829884.4132.13.camel@synopsys.com>
 <20141217163652.3812739e@free-electrons.com>
 <1418831416.4132.19.camel@synopsys.com>
 <20141217170826.075c6d48@free-electrons.com>
 <1418833123.4132.22.camel@synopsys.com>
 <20141217172818.250714b4@free-electrons.com>
 <1419327626.2781.2.camel@synopsys.com>
Message-ID: <20141223111940.63de9e01@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 23 Dec 2014 09:40:27 +0000, Alexey Brodkin wrote:

> So then I think it's time for a patch that by default selects:
> 1. BR2_TARGET_GENERIC_GETTY_PORT="console"
> 2. BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP=y
> 
> Any objections?

I'm fine with that. Maybe we'll need the ACK from Peter on this,
though, but I would personally support such a change.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
