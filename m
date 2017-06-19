From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Jun 2017 22:09:27 +0200
Subject: [Buildroot] [PATCH] irssi: drop obsolete configure option
In-Reply-To: <20170619060243.4696-1-rprebello@gmail.com>
References: <20170619060243.4696-1-rprebello@gmail.com>
Message-ID: <20170619220927.4b2dd51a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Jun 2017 03:02:43 -0300, Rodrigo Rebello wrote:
> The configure option --with-ncurses has been removed in version 1.0.0
> and thus is no longer needed.
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> ---
>  package/irssi/irssi.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
