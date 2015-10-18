From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 23:39:56 +0200
Subject: [Buildroot] [PATCH v2] uclibc: clean-up test suite build command
In-Reply-To: <1429521018-11517-1-git-send-email-abrodkin@synopsys.com>
References: <1429521018-11517-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20151018233956.3daf1174@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 20 Apr 2015 12:10:18 +0300, Alexey Brodkin wrote:
> Starting from uClibc 0.9.32 "test_compile" target builds tests flawlessly.
> For 0.9.31 it lead to build failure, but now when AVR32 support was dropped
> I think this change worth applying.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---

Applied, thanks. Yes, long delay, but better late than never!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
