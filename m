From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 22:22:54 +0100
Subject: [Buildroot] [PATCH 1/1] ncurses-next: fix build failure with 6.1
In-Reply-To: <20180206174035.1683-1-aduskett@gmail.com>
References: <20180206174035.1683-1-aduskett@gmail.com>
Message-ID: <20180208222254.3f21c3b0@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The commit title shouldn't contain "next". If you want to tag a patch
for next, use:

 git format-patch --subject-prefix="PATCH next"

Indeed we don't want "next" in the commit title to be present forever in
the Git history.

On Tue,  6 Feb 2018 12:40:35 -0500, Adam Duskett wrote:
> Ncurses 6.1 introduces the config option --disable-stripping which is set
> to no by default.
> 
> Set this option to ensure that ncurses doesn't try to strip the executables.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3a5/3a5ddfcf7cd3a5c2bc068e3e33c823d6bcd3e79b

An empty line here is good to have, to separate the commit log from the
SoB line.

> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/ncurses/ncurses.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to next with those minor nits fixed.

-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
