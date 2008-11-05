From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 5 Nov 2008 14:34:10 +0100
Subject: [Buildroot] [PATCH] Install PrBoom only once
In-Reply-To: <49119FAB.8060400@free.fr>
References: <49119FAB.8060400@free.fr>
Message-ID: <20081105143410.3c2857e2@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 05 Nov 2008 14:29:15 +0100
Julien Boibessot <julien.boibessot@free.fr> wrote:

> Hi,
> 
> this trivial patch makes that PrBoom is not installed everytime we do
> a "make", but only once.
> 

Thanks, committed in rev 23939.

-- 
Best regards,
Hans-Christian Egtvedt
