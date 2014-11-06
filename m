From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Nov 2014 18:25:18 +0100
Subject: [Buildroot] [PATCH] uclibc: respect top-level TARGET_CFLAGS
In-Reply-To: <20141106120325.GI2234@tarshish>
References: <1415274442-24547-1-git-send-email-abrodkin@synopsys.com>
 <20141106115120.GG2234@tarshish>
 <1415275171.11764.9.camel@abrodkin-8560l.internal.synopsys.com>
 <20141106120325.GI2234@tarshish>
Message-ID: <20141106182518.7107343f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 6 Nov 2014 14:03:25 +0200, Baruch Siach wrote:

> > That's why I add "Cc:" in commit message.
> > Because "git send-email" automatically adds mentioned addresses to CC.
> 
> OK then. It seems that the list handler striped the addresses of list 
> subscribers from the Cc header except that of Thomas.

Yes, the list handler does some horrible crap with Cc, it seems to
strip some of them when the recipient is subscribed to the list, but
not all of them.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
