From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Nov 2016 00:18:10 +0100
Subject: [Buildroot] Buildroot 2016.11-rc3 released
Message-ID: <87y403chxp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2016.11-rc3 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2016.11-rc3.tar.gz

or

http://buildroot.net/downloads/buildroot-2016.11-rc3.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

A good number of fixes, all over the tree.

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -sn 2016.11-rc2..

    15  Peter Korsgaard
    14  Arnout Vandecappelle
     7  Vicente Olivert Riera
     6  Waldemar Brodkorb
     6  Zakharov Vlad
     4  Baruch Siach
     4  Fabio Estevam
     4  Thomas Petazzoni
     3  Peter Seiderer
     2  Danomi Manchego
     2  J?rg Krause
     2  Max Filippov
     2  Romain Naour
     2  Sam bobroff
     1  Alexey Brodkin
     1  Francois Perrad
     1  Ga?l PORTAY
     1  Gustavo Zacarias
     1  Gwenhael Goavec-Merou
     1  James Knight
     1  Jerry Evans
     1  Joao Pinto
     1  J?r?me Pouiller
     1  Masahiro Yamada
     1  Nicolas Cavallari
     1  Pieterjan Camerlynck
     1  Yann E. MORIN

The biggest change since RC2 is that we have gone back to use fakeroot
instead of pseudo. For more details, see the CHANGES file:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.11-rc3

Expect the final 2016.11 in a few days.

-- 
Bye, Peter Korsgaard
