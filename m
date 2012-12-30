From: Willy Lambert <lambert.willy@gmail.com>
Date: Sun, 30 Dec 2012 18:18:39 +0100
Subject: [Buildroot] Bootloader
Message-ID: <CAKvQZ_069zGz=-uY_uTP90ycd8+S9LBXiR_RuOUYrtZW4g3WEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm having very hard time for some weeks now with action to do after
the "make" to play with generated stuff. The better hints I found on
the web was this :
http://osmz.mrl.cz/buildroot.html
I managed to create a "partitionned" image file but it fails on my
machine with grub install.

It makes me wonder what is the default way to go with bootloaders with
buildroot generated stuff.
I tried several options but none worked, I'm missing some
documentation to start with anything.

The one I know the most is grub, but I need a "grub-install" phasis
but no "host-tool" seems to be provided.

Is there any documentation on how to use bootloaders with buildroot ?
