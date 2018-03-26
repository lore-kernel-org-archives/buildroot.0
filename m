From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 23:04:23 +0200
Subject: [Buildroot] [PATCH] package/avahi: Set the path to D-Bus
 system.d directory
In-Reply-To: <20180123231723.5923-1-chris.lesiak@licor.com>
References: <20180123231723.5923-1-chris.lesiak@licor.com>
Message-ID: <20180326230423.5b4bfc08@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Jan 2018 17:17:23 -0600, Chris Lesiak wrote:
> Add --with-dbus-sys=/usr/share/dbus-1/system.d to configure
> the path to D-Bus system.d directory.  Without this option,
> distribution provided configuration files were unnecessarily
> stored in /etc.
> 
> Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
> ---
>  package/avahi/avahi.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master after improving the commit log. As Peter Korsgaard
said, a number of other packages still install their D-Bus files
in /etc. Could you look at fixing those as well ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
