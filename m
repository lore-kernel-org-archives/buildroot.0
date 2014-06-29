From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:55:12 +0200
Subject: [Buildroot] [Patch v3 1/1] systemd: rework network/tty units
 installation
In-Reply-To: <1403517126-5776-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1403517126-5776-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140629105512.0670fc4e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Mon, 23 Jun 2014 11:52:06 +0200, Eric Le Bihan wrote:
> The installation of the network.service and serial-getty.service unit
> files are now performed via the <pkg>_INIT_SYSTEMD mechanism instead of
> an installation hook.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/systemd/systemd.mk | 35 +++++++++++++++++------------------
>  1 file changed, 17 insertions(+), 18 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
