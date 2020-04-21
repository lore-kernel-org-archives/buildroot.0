From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 23:26:18 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/ncurses: bump to version
 6.2
In-Reply-To: <20200229232016.4174325-1-aduskett@gmail.com>
References: <20200229232016.4174325-1-aduskett@gmail.com>
Message-ID: <20200421232618.18245478@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Thomas DS, since he added all the patches for ncurses 6.1

On Sat, 29 Feb 2020 15:20:15 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>   - Update hash for the license file due to copyright year changes.
>   - Remove patches that are incorporated in this version.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

But then, shouldn't we add all of the ncurses-6.2 patches available at
https://invisible-mirror.net/archives/ncurses/6.2/. I remember Thomas
DS discussed ncurses patches during the latest Buildroot meeting, and a
number of them (at least for ncurses 6.1) contained security fixes.

It's not clear what those patches are though, as they seem to contain
also the 6.1 -> 6.2 changes.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
