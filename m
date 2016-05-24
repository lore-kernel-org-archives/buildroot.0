From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 15:16:23 +0200
Subject: [Buildroot] [PATCH] aircrack-ng: mention script dependencies in
 the help text
In-Reply-To: <1463599723-12836-1-git-send-email-arnout@mind.be>
References: <1463599723-12836-1-git-send-email-arnout@mind.be>
Message-ID: <20160524151623.6eb3fcbb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 May 2016 21:28:43 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> aircrack-ng has some scripts (airmon-ng, airmon-zc) that use external
> tools for their functionality. We don't select the corresponding
> packages because some of the other aircrack-ng tools don't need these
> at all.
> 
> Still, the user should be informed of this. So update the help text to
> refer to all packages used by the scripts:
> - ethtool
> - iw
> - rfkill
> - util-linux for lspci and lsusb (script uses options not available in
>   busybox)
> - wireless_tools for iwconfig and iwpriv
> 
> See also bug #8936
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: lipkegu at gmail.com
> ---
>  package/aircrack-ng/Config.in | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
