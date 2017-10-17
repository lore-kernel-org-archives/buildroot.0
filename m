From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 08:32:56 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-16
Message-ID: <20171017063256.8E7742083D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-16
================================

      successes : 158
       failures : 33 
       timeouts : 0  
          TOTAL : 191

Classification of failures by reason
====================================

      host-uboot-tools-2017.07 | 6 
            libtomcrypt-1.18.0 | 4 
                     nmap-7.60 | 4 
             dbus-python-1.2.4 | 3 
                openjpeg-2.2.0 | 3 
pdbg-77158819158d1d7053a737... | 3 
                    ipset-6.34 | 2 
                 msgpack-2.1.5 | 2 
           argp-standalone-1.3 | 1 
                  cc-tool-0.26 | 1 
                openobex-1.7.2 | 1 
         python-gobject-2.28.6 | 1 
             qt5location-5.9.1 | 1 
               wireshark-2.2.7 | 1 


Detail of failures
===================

         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/7a06f6321490c3bdbfb304ebd10587e34399f434 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/93d3fefbeb5f16c6abf3feafb676e21a66bf88d1 |     
       nios2 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/0d1459155ab6ad2e126e0845ecf6ba2f9381ec8b | ORPH
     aarch64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/86bfc42c0627c9073bad7a2799245c64a0d8f888 | ORPH
      x86_64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/838b995e3e7ecf6fe49b8668d66a53fa54260fb3 | ORPH
        m68k |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/ec852fc55abbecf67175ac5a8895330492f7be37 | ORPH
       nios2 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/c6a6044eb097480e1e33d223f8c212ffe3df593e | ORPH
      x86_64 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/b08e60bbfe62f449cbfa92b4d9ba848512f7fe9e | ORPH
        or1k |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/b9e04d732993b03749e5a932b361017d6c65cf80 | ORPH
        or1k |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/189e33c24557b1f00676f2b2493b49fb487746df | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/0ccebb0f8396dd37bc22fe4ae3f081e5e7661911 | ORPH
      x86_64 |                     ipset-6.34 | NOK | http://autobuild.buildroot.net/results/126c97db87cd3bdc6d222982a53d871387cc9b50 |     
         arm |                     ipset-6.34 | NOK | http://autobuild.buildroot.net/results/22dcb72e75d1844828ba344f5ed126de06d2ab82 |     
microblazeel |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/6af9672f87a176690cb44086d806f512274511e9 |     
microblazeel |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/6bcea1399ccf0f872c2c63330bec4cb41249c398 |     
         arm |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/83f433bcb608b341fca2180afa57fc81495bc3b4 |     
     powerpc |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/4592e68cbbd87c7e0d98c63389d755a94c3760e0 |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/81387649d9dbdfe4ccba9c7d0885aa8bd5239938 |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/f5d493dbe65cbe58d0924176efbd12e4a078f3ee |     
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/7c1d0525c402e1aee6a60038546f9103cc3e36f2 |     
     sparc64 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/07bbfb7590a23cd3bb59e699c2cd79363b71879a |     
     sparc64 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/de4601750655a30127a18ad14e3efcd837bc8894 |     
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/50dad62bef52b5b5a27e7eb5227c326cd3758732 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/65cac8797f8cdfb4550a7ee868d9333b2bec1846 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/7c9d629a5611af4450a267059d1605f87557d16e |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/548d0339aa756af6f8ec535b02b6060de137a288 |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/c46d54da359c083d9bfd02829318df9a81853cfa |     
        bfin | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/3ab88eb86fd321bb4fa3d73e89318172f9fbe620 |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/35304364cf15c427cc5f2a702f2b53e6a394eca5 |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/8da54a50bf18d366163199cef13b0d511c0d23ba |     
microblazeel |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/ac6cf59125ba57402f926e6c65ffe19e065001b5 |     
      x86_64 |              qt5location-5.9.1 | NOK | http://autobuild.buildroot.net/results/6f4c7d7d1d0bd103692a70564f717238e3f2e8e9 |     
     aarch64 |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/c7a0ed2e83428e398749cc1ba26b73fc72538b69 |     

-- 
http://autobuild.buildroot.net
