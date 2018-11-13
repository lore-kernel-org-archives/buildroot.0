From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 00:09:48 +0100
Subject: [Buildroot] [PATCH 1/2] qemu: sdl frontend needs x11
In-Reply-To: <20181030082755.13043-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 30 Oct 2018 09:27:54 +0100")
References: <20181030082755.13043-1-fontaine.fabrice@gmail.com>
Message-ID: <87d0r8wp4z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Since qemu 2.12.0 and
 > https://github.com/qemu/qemu/commit/2ec78706d188df7d3dab43d07b19b05ef7800a44,
 > x_keymap.h has been converted from "SDL display driver" to "X11 keymaps"

 > So add a select on BR2_PACKAGE_SDL_X11

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1908d2d7de8d3aff11ed6fbb8fe4cf3eff54b5a5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
