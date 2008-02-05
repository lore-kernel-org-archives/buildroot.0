From: Albert Causing <albertcausing@gmail.com>
Date: Tue, 5 Feb 2008 11:12:36 +0800
Subject: [Buildroot] GRUB GRAPHICS.C problem - solved - please add to auto
	patch
Message-ID: <afc3bae70802041912q36043f78g805557148136eece@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wget http://aur.archlinux.org/packages/grub-gfx/grub-gfx/grub-0.97-graphics.patch
mv grub-0.97-graphics.patch build_ARCH/
cd build_ARCH/
cat grub-0.97-graphics.patch | patch -p0


please include this on the auto patch for grub.. THANKS!
