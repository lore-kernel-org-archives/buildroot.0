From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 16:40:34 +0200
Subject: [Buildroot] [PATCH/RFC] package/kodi: bump to version
 17.0-Krypton
In-Reply-To: <movk4dx0de.ln2@ID-313208.user.individual.net>
References: <npc90dxkun.ln2@ID-313208.user.individual.net>
 <movk4dx0de.ln2@ID-313208.user.individual.net>
Message-ID: <20160702164034.76b8530e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

First of all, thanks for this status report! Please try to Cc me on
such e-mails in the future.

On Sat, 02 Jul 2016 16:30:14 +0200, Bernd Kuhls wrote:

> Kodi 17.0-alpha2 was released two days ago. On github you will find my 
> continuous updates, now including a package for the confluence skin with 
> support to remove unwanted skins, like the default estuary/estouchy 
> skins, from the buildroot image.
> 
> From my kodi17 branch I sent two patch series to the buildroot 
> mailinglist for inclusion to prepare the Kodi 17 bump:
> 
> The first series updates the Kodi package in preparation for the bump:
> 
> http://patchwork.ozlabs.org/patch/640793/
> [v2,1/4] package/kodi: re-structure dependencies
> 
> http://patchwork.ozlabs.org/patch/640796/
> [v2,2/4] package/kodi: Add suboption to control MySQL support

I made a comment on this one, asking why we add a sub-option instead of
using an implicit, not sure I got a reply.

> The second series provides support for ffmpeg 3, parts of it were 
> committed today to buildroot, the remaining patches are
> 
> http://patchwork.ozlabs.org/patch/643482/
> [v4,2/7] package/ffmpeg: bump to version 3.1.1
> 
> http://patchwork.ozlabs.org/patch/643480/
> [v4,4/7] package/ffmpeg: default to --cpu=generic for MIPS architecture
> 
> http://patchwork.ozlabs.org/patch/643477/
> [v4,5/7] package/ffmpeg: re-enable for mips64r2 and mips64r6
> 
> http://patchwork.ozlabs.org/patch/643479/
> [v4,6/7] package/vlc: bump version to git master (to be released as 3.0)
> 
> The main problem with this patch series is the fact that vlc did not 
> release version 3.0 yet, I could not find publicly available informations 
> about a release date.

Is ffmpeg 3.x mandatory for Kodi 17 ?

> On my personal setup I switched to Kodi 17 two weeks ago with positive 
> results, for details read this blog posting:
> https://kodi.tv/10-days-till-first-v17-krypton-alpha-release/

Cool! It's really very useful to have a contributor like you very
active on keeping our Kodi support up to date!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
