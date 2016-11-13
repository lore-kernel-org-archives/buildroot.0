From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 21:07:40 +0100
Subject: [Buildroot] Buildroot 2016.11-rc2 released
Message-ID: <20161113210740.3a8cedb2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2016.11-rc2 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2016.11-rc2.tar.gz

or

http://buildroot.net/downloads/buildroot-2016.11-rc2.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Besides fixing a number of autobuilder failures, and updates to
defconfig to get more of them to build properly, a good number of
changes are related to fixing issues with the recent replacement of
'fakeroot' by 'pseudo'. Hopefully, it now works properly in all
situations.

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -sn 2016.11-rc1..
    23  Thomas Petazzoni
    10  Yann E. MORIN
     8  Ludovic Desroches
     8  Romain Naour
     6  Vicente Olivert Riera
     5  Baruch Siach
     4  J?r?me Pouiller
     3  Bernd Kuhls
     2  Arnout Vandecappelle
     2  Ga?l PORTAY
     2  Gustavo Zacarias
     2  Julien BOIBESSOT
     2  Peter Seiderer
     2  Rahul Bedarkar
     2  Waldemar Brodkorb
     2  Yegor Yefremov
     1  Cyril Bur
     1  Francois Perrad
     1  Frank Hunleth
     1  Gary Bisson
     1  Jan Viktorin
     1  J?rg Krause
     1  Maxime Hadjinlian
     1  Philippe Proulx
     1  Sam bobroff
     1  Samuel Martin
     1  Stefan Nickl
     1  Vincent Stehl?

For more details, see the CHANGES file:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.11-rc2

Expect the final 2016.11 release by the end of the month.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
