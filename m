From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 02 Jul 2016 16:30:14 +0200
Subject: [Buildroot] [PATCH/RFC] package/kodi: bump to version
	17.0-Krypton
References: <npc90dxkun.ln2@ID-313208.user.individual.net>
Message-ID: <movk4dx0de.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 10 May 2016 17:53:59 +0200 schrieb Bernd Kuhls:

> Hi,
> 
> on github you will find, as usual, a patch series as RFC to bump Kodi to
> current git master, to be released as 17.0-Krypton:
> 
> https://github.com/bkuhls/buildroot/commits/kodi17
> 
> 17.0-alpha1 was released nine days ago, expect a release of this new
> version in the following months. The branch kodi17 includes the ffmpeg 3
> bump because Kodi 17 depends on it.
> 
> Regards, Bernd

Hi,

Kodi 17.0-alpha2 was released two days ago. On github you will find my 
continuous updates, now including a package for the confluence skin with 
support to remove unwanted skins, like the default estuary/estouchy 
skins, from the buildroot image.

From my kodi17 branch I sent two patch series to the buildroot 
mailinglist for inclusion to prepare the Kodi 17 bump:

The first series updates the Kodi package in preparation for the bump:

http://patchwork.ozlabs.org/patch/640793/
[v2,1/4] package/kodi: re-structure dependencies

http://patchwork.ozlabs.org/patch/640796/
[v2,2/4] package/kodi: Add suboption to control MySQL support

http://patchwork.ozlabs.org/patch/640795/
[v2,3/4] package/kodi: Add suboption to control UPnP support

http://patchwork.ozlabs.org/patch/640794/
[v2,4/4] package/kodi: Add suboption to control unrar support


The second series provides support for ffmpeg 3, parts of it were 
committed today to buildroot, the remaining patches are

http://patchwork.ozlabs.org/patch/643482/
[v4,2/7] package/ffmpeg: bump to version 3.1.1

http://patchwork.ozlabs.org/patch/643480/
[v4,4/7] package/ffmpeg: default to --cpu=generic for MIPS architecture

http://patchwork.ozlabs.org/patch/643477/
[v4,5/7] package/ffmpeg: re-enable for mips64r2 and mips64r6

http://patchwork.ozlabs.org/patch/643479/
[v4,6/7] package/vlc: bump version to git master (to be released as 3.0)

The main problem with this patch series is the fact that vlc did not 
release version 3.0 yet, I could not find publicly available informations 
about a release date.

On my personal setup I switched to Kodi 17 two weeks ago with positive 
results, for details read this blog posting:
https://kodi.tv/10-days-till-first-v17-krypton-alpha-release/

Regards, Bernd
