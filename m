From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 08:44:55 +0200
Subject: [Buildroot] [PATCH] quagga: disable PIE on ARC
In-Reply-To: <559EE7E6.401@mind.be>
References: <1436436011-8126-1-git-send-email-abrodkin@synopsys.com>
 <559EE7E6.401@mind.be>
Message-ID: <20150710084455.3462000c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Alexey,

On Thu, 9 Jul 2015 23:30:14 +0200, Arnout Vandecappelle wrote:
> On 07/09/15 12:00, Alexey Brodkin wrote:
> > Even though ARC gcc understands "-pie" option and attempts to generate
> > PIE binaries as of today PIE is not really supported for user-space
> > applications.
> 
>  Wouldn't it be better then if we would patch gcc to remove the -pie option?
> That removes all these special cases in one fell swoop, and is much easier to
> un-disable once PIE _is_ supported for ARC gcc.

It would indeed be a lot better.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
