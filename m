From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 21:12:40 +0200
Subject: [Buildroot] [PATCH] systemd: add compatibility symlink for
 'shutdown'
In-Reply-To: <20180413121830.31570-1-anssi.hannula@bitwise.fi>
References: <20180413121830.31570-1-anssi.hannula@bitwise.fi>
Message-ID: <20180415211240.4b014fc9@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Apr 2018 15:18:30 +0300, Anssi Hannula wrote:
> In addition to the 'halt', 'poweroff', 'reboot' symlinks pointing to
> systemctl, add 'shutdown'.
> 
> Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
> ---
>  package/systemd/systemd.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
