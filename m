From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Feb 2018 08:58:49 +0100
Subject: [Buildroot] [PATCH 1/1] postgresql: security bump to 9.6.7
In-Reply-To: <20180209122212.27292-1-aduskett@gmail.com>
References: <20180209122212.27292-1-aduskett@gmail.com>
Message-ID: <20180210085849.70949ca7@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Feb 2018 07:22:12 -0500, Adam Duskett wrote:
> from https://www.postgresql.org/about/news/1829/
> 
> Fixes:
> [1] CVE-2018-1052: Fix the processing of partition keys containing multiple
>                    expressions
> 
> [2] CVE-2018-1053: Ensure that all temporary files made with "pg_upgrade" are
>                    non-world-readable
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

I guess this one is meant for the 2017.02.x branch ?

If so, it would be nice to indicate it in the patch prefix. Same when
you send patches intended for the next branch. Use:

 git format-patch --subject-prefix="PATCH 2017.02.x"

 git format-patch --subject-prefix="PATCH next"

This will make things a lot easier for the people reviewing/applying
patches. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
