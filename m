From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 12:28:11 +0200
Subject: [Buildroot] [PATCH v3 6/6] package/amd-catalyst-driver: Add AMD
 proprietary graphic stack support
In-Reply-To: <20160728161258.GA5862@free.fr>
References: <1469521290-20446-1-git-send-email-romain.perier@free-electrons.com>
 <1469521290-20446-7-git-send-email-romain.perier@free-electrons.com>
 <20160726203918.GE5925@free.fr>
 <20160727093523.34b01c10@free-electrons.com>
 <20160728161258.GA5862@free.fr>
Message-ID: <20160805122811.45883223@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jul 2016 18:12:58 +0200, Yann E. MORIN wrote:

> What if the kernel is built outside of Buildroot? We can't build the
> kernel module in that case, but we still want to be able to build the
> userland. So, the split *does* make sense.

Yes, it does, you are completely right. Romain is reworking the patch
series to take this aspect into account. I originally asked him to make
the kernel module option a blind one, but I forgot about the use case
of "I build my kernel outside of Buildroot", which is a perfectly valid
use case.

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
