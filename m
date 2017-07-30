From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jul 2017 08:30:48 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-29
Message-ID: <20170730063048.EF4EE21F2D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-29
================================

      successes : 181
       failures : 21 
       timeouts : 0  
          TOTAL : 202

Classification of failures by reason
====================================

                  dbus-1.10.22 | 4 
python-libconfig-b271c3d9da... | 3 
                  cc-tool-0.26 | 2 
                    ficl-4.1.0 | 2 
                     gpsd-3.16 | 1 
                   mp4v2-2.0.0 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.25.0 | 1 
                    norm-1.5r6 | 1 
     python-cryptography-1.7.2 | 1 
       python-smbus-cffi-0.5.1 | 1 
                    qemu-2.8.0 | 1 
                 qt5base-5.9.1 | 1 
             qt5location-5.6.2 | 1 


Detail of failures
===================

       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/596f97364bb2c7598b0646da8160939356f0d2c6 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/19f293028999485ccf373c59d165f70470b49ca2 |     
        i586 |                   dbus-1.10.22 | NOK | http://autobuild.buildroot.net/results/2a7e8e377b13bbc7625b7f860ea7749a91fc2c25 | ORPH
        m68k |                   dbus-1.10.22 | NOK | http://autobuild.buildroot.net/results/28c956ba73172b80b71bafc64e34a30bd722bc31 | ORPH
        i686 |                   dbus-1.10.22 | NOK | http://autobuild.buildroot.net/results/c02873a9687d011a321dc3e4d751fe7accd8e04b | ORPH
      xtensa |                   dbus-1.10.22 | NOK | http://autobuild.buildroot.net/results/b5d23136f148b29fb35e206b3903a7110fa39148 | ORPH
         arm |                     ficl-4.1.0 | NOK | http://autobuild.buildroot.net/results/fb4c867b2cfaaf5c4778f2e3244064cfcd159281 |     
         arm |                     ficl-4.1.0 | NOK | http://autobuild.buildroot.net/results/c61ec95faa934c2d21a1ca4e15bf6b32c0c47278 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/970afaa86167bc742dd91814fef5f083ab6cb2ca |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/24a2c62df1307dada33b9682d03850c29bb5e7e9 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ec7873d57102915333dfbc3c0a8a98e3ad56ac7f |     
         arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/5baf46b5e65902851494d4c3f18b81511fcc8d2c |     
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/a9019922ca6dac3a49c5f09abd4f5ebebd23e5ed |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ee3e33e648e967d34b1382e1c25d55cc84033a4e |     
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/b6c8961e536479b0348f2739247a356225df0819 |     
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/7c73b950365be691c4bcf8202d51fc6c5fd45d93 |     
   powerpc64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/132f225422cd2780404c4ea487e977c4c451a5a5 |     
      x86_64 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/4d2502c3899f5dbbd2c27a3a92593d16668ee723 |     
         arm |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/ae0994eeed00c181fdaa20a0e067c28fe2e6ef4d |     
     aarch64 |                  qt5base-5.9.1 | NOK | http://autobuild.buildroot.net/results/fd260828e19a288c3e86bb8e4614a9629fa7958a |     
       nios2 |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/87a93c09c683868df1b287f5186781737db7c47d |     

-- 
http://autobuild.buildroot.net
