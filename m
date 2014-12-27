From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 20:12:12 +0100
Subject: [Buildroot] [PATCH v9 00/18] package/kodi: Bump version to
 14.0-Helix
In-Reply-To: <1419356801-31525-1-git-send-email-bernd.kuhls@t-online.de>
References: <1419356801-31525-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141227201212.74968b65@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 23 Dec 2014 18:46:23 +0100, Bernd Kuhls wrote:

>   package/ffmpeg: Add Kodi patchset

Applied, after switching to using individual patches instead of one big
patch.

>   Rename XBMC to Kodi - part I - move files
>   Rename XBMC to Kodi - part II - rename variables

Applied, after merging the two patches and adjusting the commit title.

>   package/kodi: Bump version to 14.0-Helix

Applied.

>   Rename xbmc-pvr-addons to kodi-pvr-addons - part I - move files
>   Rename xbmc-pvr-addons to kodi-pvr-addons - part II - rename
>     variables

Applied, after merging the two patches and adjusting the commit title.

>   package/kodi-pvr-addons: Bump version for Helix-compatibility

Applied.

>   Rename xbmc-addon-xvdr to kodi-addon-xvdr - part I - move files
>   Rename xbmc-addon-xvdr to kodi-addon-xvdr - part II - rename
>     variables

Applied, after merging the two patches and adjusting the commit title.

>   package/kodi-addon-xvdr: Bump version for Helix-compatibility

Applied.

>   package/kodi: New option to enable support for optical drives

Applied.

>   package/kodi: Enable install to STAGING_DIR, needed for audioencoder
>     addons

Applied.

>   package/kodi-audioencoder-flac: New package
>   package/kodi-audioencoder-lame: New package
>   package/kodi-audioencoder-vorbis: New package
>   package/kodi-audioencoder-wav: New package

Applied, after removing the redundant dependency on optical drive
support present in each individual package Config.in file, while the
inclusion from package/Config.in was already taking care of it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
