From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 23:25:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/openvpn: Use start-stop-daemon
 to perform start/stop actions
In-Reply-To: <20201002064721.1641311-1-fido_max@inbox.ru>
References: <20201002064721.1641311-1-fido_max@inbox.ru>
Message-ID: <20201008232501.2f765dcb@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  2 Oct 2020 09:47:21 +0300
Maxim Kochetkov via buildroot <buildroot@busybox.net> wrote:

> Using 'start-stop-daemon' prevents multiple instances creation by '/etc/init.d/S60openvpnv start'.
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/openvpn/S60openvpn | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
