From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 15:16:58 +0100
Subject: [Buildroot] [PATCH v2,1/2] package/ncmpc: bump to version 0.33
In-Reply-To: <20190208214048.11835-1-fontaine.fabrice@gmail.com>
References: <20190208214048.11835-1-fontaine.fabrice@gmail.com>
Message-ID: <20190210151658.7d250276@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 Feb 2019 22:40:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove second patch (already in version)
> - Replace true/false by enabled/disabled, see:
>   https://github.com/MusicPlayerDaemon/ncmpc/commit/67d96543e64ec2eff2d3e9907c570ca09918c893
> - Add new boost system dependency:
>   https://github.com/MusicPlayerDaemon/ncmpc/commit/74cc24bdfcfd0ba288b78f0fb75f409832d7586d
>   https://github.com/MusicPlayerDaemon/ncmpc/commit/bef9017712da31b750799e6c7fb9d2829fa5e69c
> - Remove glib dependency:
>   https://github.com/MusicPlayerDaemon/ncmpc/commit/dfcb3ab0216d6c9ae35d06060cee806bd919c2ba
> - Disable new regex option (based on pcre)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Add a select on BR2_PACKAGE_BOOST_SYSTEM
>  - Fix patch so that it applies on current master

Both applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
