From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 15:02:11 +0200
Subject: [Buildroot] [PATCH v2] arc: axs10x - bump Linux kernel &
 headers to 4.2 release
In-Reply-To: <1441723429-28377-1-git-send-email-abrodkin@synopsys.com>
References: <1441723429-28377-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150920150211.7a7a602d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue,  8 Sep 2015 17:43:49 +0300, Alexey Brodkin wrote:
> Linux kernel 4.2 was finally released, so bumping from
> 4.2-rc5 to final release.
> 
> Updating Linux headers to 4.2 branch since they are introduced in
> Buildroot as well already.
> 
> Also adding 1 back-ported patch that makes SD/MMC cards usable on AXS boards.
> This patch will be a part of 4.3 (already in linux-next) and hopefully
> will make its way in 4.2.1.
> 
> Once that patch appears in 4.2.x it must be removed from here.
> 
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---

Applied after slightly tweaking the commit title, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
