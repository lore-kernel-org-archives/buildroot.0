From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jan 2017 14:12:27 +1100
Subject: [Buildroot] [PATCH] busybox: add comment that other packages
 are needed
In-Reply-To: <20170117225854.2544-1-arnout@mind.be>
References: <20170117225854.2544-1-arnout@mind.be>
Message-ID: <20170120141227.3d600cac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Jan 2017 23:58:54 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Inspired on the confusion in [1], we want to warn the user that building
> without busybox may not lead to a working system.
> 
> [1] https://bugs.busybox.net/show_bug.cgi?id=9526
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Better wording is certainly welcome!
> ---
>  package/busybox/Config.in | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
