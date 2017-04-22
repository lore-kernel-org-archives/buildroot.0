From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 15:59:07 +0200
Subject: [Buildroot] [PATCH 3/7] package makefiles: clean up backslash
 spacing.
In-Reply-To: <20170421152452.11236-3-aduskett@codeblue.com>
References: <20170421152452.11236-1-aduskett@codeblue.com>
 <20170421152452.11236-3-aduskett@codeblue.com>
Message-ID: <20170422155907.63cfc4cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Apr 2017 11:24:48 -0400, Adam Duskett wrote:
> The check-package script when ran gave warnings on only using
> one space before backslashes on all of these makefiles.
> This patch cleans up all warnings related to the one space before
> backslashes rule in the make files in the package directory.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> ---
>  package/amd-catalyst/amd-catalyst.mk     |  2 +-
>  package/bluez5_utils/bluez5_utils.mk     |  6 +--
>  package/bluez_utils/bluez_utils.mk       | 24 +++++------
>  package/cegui06/cegui06.mk               | 28 ++++++-------
>  package/celt051/celt051.mk               | 12 +++---
>  package/connman/connman.mk               | 10 ++---
>  package/directfb/directfb.mk             |  2 +-
>  package/duma/duma.mk                     |  4 +-
>  package/efibootmgr/efibootmgr.mk         |  4 +-
>  package/giflib/giflib.mk                 |  4 +-
>  package/git/git.mk                       |  2 +-
>  package/gvfs/gvfs.mk                     |  4 +-
>  package/i2c-tools/i2c-tools.mk           |  2 +-
>  package/keyutils/keyutils.mk             | 10 ++---
>  package/kodi/kodi.mk                     |  2 +-
>  package/lesstif/lesstif.mk               |  2 +-
>  package/linux-firmware/linux-firmware.mk | 64 ++++++++++++++--------------
>  package/mplayer/mplayer.mk               |  6 +--
>  package/ngrep/ngrep.mk                   |  2 +-
>  package/ola/ola.mk                       |  2 +-
>  package/poco/poco.mk                     | 40 +++++++++---------
>  package/python-pyqt/python-pyqt.mk       |  2 +-
>  package/python-sip/python-sip.mk         |  2 +-
>  package/python/python.mk                 | 56 ++++++++++++-------------
>  package/python3/python3.mk               | 44 +++++++++----------
>  package/qemu/qemu.mk                     | 72 ++++++++++++++++----------------
>  package/rt-tests/rt-tests.mk             | 12 +++---
>  package/rtai/rtai.mk                     | 10 ++---
>  package/sdl2/sdl2.mk                     |  2 +-
>  package/skeleton/skeleton.mk             | 16 +++----
>  package/spice/spice.mk                   | 24 +++++------
>  package/squashfs/squashfs.mk             | 16 +++----
>  package/systemd/systemd.mk               |  2 +-
>  package/tvheadend/tvheadend.mk           | 32 +++++++-------
>  package/tz/tz.mk                         | 18 ++++----
>  package/tzdata/tzdata.mk                 | 18 ++++----
>  package/udisks/udisks.mk                 | 20 ++++-----
>  package/usbmount/usbmount.mk             |  4 +-
>  package/wpa_supplicant/wpa_supplicant.mk |  8 ++--
>  39 files changed, 295 insertions(+), 295 deletions(-)

Applied to master, after checking that "git diff -w HEAD^.." returned
nothing, i.e your patch contains only whitespace changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
