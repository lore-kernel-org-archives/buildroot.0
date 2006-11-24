From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Fri, 24 Nov 2006 13:50:12 +0100
Subject: [Buildroot] SDL_image, SDL_ttf & Co
Message-ID: <1164372612.4566ea842d1b4@imp2-g19.free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi !

I intend to add SDL_image, SDL_ttf (and probably some other) SDL extentions
support to Buildroot and I'd like to know if the better way is to add these
package generation inside "sdl/sdl.mk" or to create a "package/sdl_xx/"
directory for each package ?
I'm asking that because I want to commit my changes to Buildroot trunk and want
to do it cleanly before submitting you a patch.

Thanks !
Julien
