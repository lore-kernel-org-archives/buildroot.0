From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Jul 2020 15:57:49 +0200
Subject: [Buildroot] [PATCH] package/refpolicy: enable systemd support
In-Reply-To: <20200703131922.1999898-1-antoine.tenart@bootlin.com>
References: <20200703131922.1999898-1-antoine.tenart@bootlin.com>
Message-ID: <20200705155749.42abe079@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  3 Jul 2020 15:19:22 +0200
Antoine Tenart <antoine.tenart@bootlin.com> wrote:

> This patch enables systemd support in the refpolicy by turning on the
> 'SYSTEMD' policy build option when systemd is enabled in Buildroot. This
> enables conditional rules in SELinux policy modules (by defining
> 'init_systemd'), to better support systemd.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
> ---
>  package/refpolicy/refpolicy.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
