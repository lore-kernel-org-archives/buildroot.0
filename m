From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2020 00:45:28 +0100
Subject: [Buildroot] [PATCH] package/avahi: drop most of the
 AVAHI_CONF_ENV vars
In-Reply-To: <20200218094600.31221-2-joerg.krause@embedded.rocks>
References: <20200218094600.31221-1-joerg.krause@embedded.rocks>
 <20200218094600.31221-2-joerg.krause@embedded.rocks>
Message-ID: <20200219004528.6c65a5a1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Feb 2020 10:46:00 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Most are legacy from when the package was added and not really necessary.
> 
> This commit is based on dropping the CONF_ENV vars in libgtk2 [1].
> 
> [1] https://git.buildroot.net/buildroot/commit/package/libgtk2/libgtk2.mk?id=4d80cbdf6c2c186da26f36575d6635604f00d29a
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/avahi/avahi.mk | 51 +-----------------------------------------
>  1 file changed, 1 insertion(+), 50 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
