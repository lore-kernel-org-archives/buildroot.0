From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 00:12:32 +0200
Subject: [Buildroot] [PATCH] raspberrypi,
 raspberrypi2: document the two consoles (UART+HDMI)
In-Reply-To: <1461015690-31329-1-git-send-email-luca@lucaceresoli.net>
References: <1461015690-31329-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20160419001232.22d82779@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 23:41:30 +0200, Luca Ceresoli wrote:
> The defconfigs for the Raspberry Pi boards start a console on HDMI in
> addition to the classic one on UART. Document this feature in the
> readme.
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  board/raspberrypi/readme.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
