From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 17:53:20 +0100
Subject: [Buildroot] [PATCH] package/fail2ban: add fixup for default
 configuration
In-Reply-To: <1553780460-1429-1-git-send-email-angelo@amarulasolutions.com>
References: <1553780460-1429-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20190328175320.4fb79531@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 Mar 2019 14:41:00 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> fail2ban default configuration is not compatible with buildroot as is.
> In order to not force the user to overwrite it in an overlay and having a
> fail2ban service running out of the box, this patch adds a fixup step to
> adapt the default configuration to running on buildroot.
> 
> The dbfile is None to not add a dependency on BR2_PACKAGE_PYTHON_SQLITE.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/fail2ban/fail2ban.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
