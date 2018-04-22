From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Apr 2018 23:38:47 +0200
Subject: [Buildroot] [PATCH v2] modem-manager: support a defaults file
 in the init script
In-Reply-To: <20180421130010.7702-1-casantos@datacom.ind.br>
References: <20180421130010.7702-1-casantos@datacom.ind.br>
Message-ID: <20180422233847.1ca55606@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Apr 2018 10:00:10 -0300, Carlos Santos wrote:
> Sometimes it is useful to pass some parameters to ModemManager when it
> starts (e.g. --log-level). Allow the user add a file with such flags in
> a MODEMMANAGER_ARGS variable. This is simpler than overriding the whole
> startup script (e.g. by means of a rootfs overlay).
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
> Changes v1->v2
>   - Rebase after commit ef0b7e7521 (modem-manager: don't test if the
>     binary exists in the init script).
> ---
>  package/modem-manager/S44modem-manager | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
