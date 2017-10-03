From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Oct 2017 21:59:37 +0200
Subject: [Buildroot] [PATCH] qt: Allow enabling of QtWebKit with GCC 6+
In-Reply-To: <20170922125003.32618-1-didin@synopsys.com>
References: <20170922125003.32618-1-didin@synopsys.com>
Message-ID: <20171003215937.643077a7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Sep 2017 15:50:03 +0300, Evgeniy Didin wrote:
> Building Qt with QtWebKit on configuration step there is
> a check which disables QtWebKit build with GCC 6+.
> Back in the day nobody thought about building Qt with GCC
> version greater than 5.x. And now with modern GCCs like
> 6.x and 7.x this assumption gets in the way.
> 
> Given in Buildroot today we don't have GCC older than 4.9
> it should be safe to remove now meaningless check completely
> by adding patch to qt.
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../qt/0014-Enable-QtWebKit-with-newer-GCC.patch   | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 package/qt/0014-Enable-QtWebKit-with-newer-GCC.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
