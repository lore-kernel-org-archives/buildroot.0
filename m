From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Nov 2020 22:46:26 +0100
Subject: [Buildroot] [PATCH v6 4/4] package/environment-setup: adding
 custom PS1
In-Reply-To: <1588085161-28104-4-git-send-email-angelo@amarulasolutions.com>
References: <1588085161-28104-1-git-send-email-angelo@amarulasolutions.com>
 <1588085161-28104-4-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20201103224626.5bd491bd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Apr 2020 16:46:01 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> In order to simplify the usage of a buildroot toolchain within
> the buildroot shell, a custom PS1 is optionally available.
> This PS1 will show the sdk version actually loaded, this can
> be useful to not confuse this shell with a normal one.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/environment-setup/Config.in.host       | 10 ++++++++++
>  package/environment-setup/environment-setup.mk |  3 +++
>  2 files changed, 13 insertions(+)

I've marked this one as Rejected: since the beginning Yann has
expressed that changing the PS1 of the user was not acceptable, and we
believe indeed it shouldn't be changed. Also, it's probably not the
most important aspect of environment-setup.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
