From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Sep 2011 08:22:12 +0200
Subject: [Buildroot] [git commit] support: move package/gnuconfig to
	support/gnuconfig
Message-ID: <20110917063643.B91188D728@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=102a93bdca09742c99e110f144bf0c9267bbdd14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CONFIG_UPDATE macro is no longer defined in
package/gnuconfig/gnuconfig.mk, but instead in
package/Makefile.autotools.in. It it also changed a little bit to take
the directory of the package sources as argument, and the AUTOTARGETS
infrastructure is updated to use this macro.

[Peter: drop echo in CONFIG_UPDATE]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
