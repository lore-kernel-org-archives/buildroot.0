From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 01 Sep 2018 00:34:21 +0200
Subject: [Buildroot] Buildroot 2018.08-rc3 released
Message-ID: <87k1o65fo2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2018.08-rc3 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2018.08-rc3.tar.gz

or

http://buildroot.net/downloads/buildroot-2018.08-rc3.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Another week, another release candidate.

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -sn 2018.08-rc2..
    10  Peter Korsgaard
     9  Mirza Krak
     9  Yann E. MORIN
     7  Fabrice Fontaine
     5  Baruch Siach
     5  Thomas Petazzoni
     4  Bernd Kuhls
     2  Christopher McCrory
     2  Fabio Estevam
     2  Giulio Benetti
     2  Matt Weber
     1  Adam Duskett
     1  Brad Love
     1  Carlos Santos
     1  Frank Hunleth
     1  Gary Bisson
     1  Gwenhael Goavec-Merou
     1  Hollis Blanchard
     1  J?rg Krause
     1  Keith Mok
     1  Laurent Hartanerot
     1  Mark Corbin
     1  Peter Seiderer

For more details, see the CHANGES file:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.08-rc3

There are unfortunately still some unresolved issues related to U-Boot
and host-dtc (libfdt), but expect the final 2018.08 release soon.

-- 
Bye, Peter Korsgaard
