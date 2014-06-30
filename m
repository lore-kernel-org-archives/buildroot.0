From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jun 2014 20:07:19 +0200
Subject: [Buildroot] [PATCH] uclibc: clean-up test suite build command
In-Reply-To: <1404149181-18586-1-git-send-email-abrodkin@synopsys.com>
References: <1404149181-18586-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140630200719.1339a6ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 30 Jun 2014 21:26:21 +0400, Alexey Brodkin wrote:
> Starting from uClibc 0.9.32 this cleaned-up command builds tests flawlessly.
> For 0.9.31 it lead to build failure, but assuming there're close to zero
> users who is going to test outdated uClibc library on obsolete
> (in Buildroot) AVR32 architecture I thin it worth applying.
> 
> Still it's possible to have 2 variants at the same time until AVR32 is not gone:
> 1. Old implementation used strictly for uClibc 0.9.31
> 2. New implementation for all other versions
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Unfortunately, unless this cleaned-up version brings significant
benefits, I believe the best option is to keep things as is until AVR32
support is really deprecated and removed from Buildroot, so that we can
drop support for 0.9.31.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
