From: Kevin Wilson <wkevils@gmail.com>
Date: Tue, 5 Jun 2012 08:36:19 +0300
Subject: [Buildroot] adding a package
Message-ID: <CAGXs5wXdM_jfwH-9C=j=Oz=4L0dpF2pDAucqx9kYaTBy3MJAJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I succeeded with booting with buildroot on ARM processor with the default
settings (only selecting CPU as ARM).
Now I want to add packages (like rp-pppoe)
What is the proper way to do it ?
I of course know about the possibility of selecting the rp-pppoe package from
"make menuconfig" and creating rootfs tar again, delete the original
rootfs and installing
the new rootfs over the old one,
Is there a more efficient way ? like using some package manager?

rgs,
Kevib
