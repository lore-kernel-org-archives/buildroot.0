From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 05 Dec 2020 08:14:54 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-04
Message-ID: <20201205081501.1A3F286D88@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 12  |  4  |  1  | 17  |
  2020.08.x  | 10  |  2  |  0  | 12  |
  2020.11.x  | 10  |  4  |  1  | 15  |
    master   | 85  | 55  |  0  | 140 |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.24 | 33
                   rhash-1.4.0 | 5 
                  ndisc6-1.0.4 | 2 
                    php-7.4.13 | 2 
              asterisk-16.14.1 | 1 
                  boost-1.74.0 | 1 
                     fmt-7.1.3 | 1 
  gobject-introspection-1.64.1 | 1 
             kismet-2020-09-R4 | 1 
                 mesa3d-20.2.3 | 1 
           python-pybind-2.6.0 | 1 
            quickjs-2020-09-06 | 1 
                samba4-4.11.16 | 1 
      trace-cmd-trace-cmd-v2.7 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
                       unknown | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/993b7feee233623329ef301a6717d4eb57e02676 |     
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0aafdba9fc2770cef546de953d4c032e73fe7118 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2581e5ef4bf0259b0064a504e8f706b7e50592c3 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/8efd6e1a659647773ad52fe2622f5ac51b4fa466 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7bf6b2091337d9bd89d1a0a363fd3aa09b4a6144 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0fe40f7433ad3f3cf4b0fbef5d6f354fef590488 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/9e65667246ee988d43c6c5d9ccd4eaae116388c2 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2da1941458a638eec9d84642076a6e1f9d339d86 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7d659f4f8a5ad95dbd84623fef3b0d4a5b35f5d4 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/aecf5281f70aef92d7b21214f2681f10611869db | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/a1a19fde8df963519ae2a32f46fb1054f7ad381d | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0f9203b4731ab696e9971cf27ed602186bfc5f67 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d21f906e9ead65b0f8acf5d99378f1f575073021 | ORPH
 powerpc64   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/50164ac3693904b9fa8da6adbf7f7baa30d71478 | ORPH
microblazeel |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/85ddc5a2c8250a15c1a5cb5d8a2759ecaaa2cfbf | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/750afc6803bdbeb8ba7ab4b1dbae25502a75342f | ORPH
   nios2     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/41ccc352d8eb86da1ac2e83e595566442624a1c8 | ORPH
    sh4      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/38a61a7fa673ff744571e9a6c68efe81ca5698ae | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/5c201e7f10e65e49b622e266df8faaaf16e43e96 | ORPH
    mips     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/8f74224a936838d45a0d984cd3b03abb7eabe86b | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/acf45bd4cb943eb2da29540ae31d620a217896f2 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/711e5b8dabd4f29f2e819115c8f8580e7badbc63 | ORPH
    i586     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/ad87e2ca386363825b9ba81d52d19a26c77cff3c | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/aa382b53bb3aa3fed653b246936b1a1efeef7b8a | ORPH
    i586     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/5525afb0351abe3780f4d431cadd577aa91efd0e | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/06627c0164310fb9060e75e6ca7e68760bbbaaf8 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4804510a498327ca022b058fcf2e0a41f01474bb | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d364c03207bf15006127969e6aae62f1fd4b6ee2 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/06bb0505160a98e324ce73480c1b32229270827d | ORPH
    mips     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/764b4270b75450284d647bf5e00683c31def5612 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4f36ab865fea5c067e97f4eedaf8b4b6f9260d3d | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/80cc23b36f09ea6c003af0898b6150bb60b47421 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2f516e6a2aa6366b469da28c1c528bdf8a34a177 | ORPH
    mips     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/3d41df7a18214151891f5eadfd2f98612ad363b2 | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/65a9e687e45570e86c579c66fa79b6da16346d13 |     
  powerpc    |           fmt-7.1.3            | NOK | http://autobuild.buildroot.net/results/fcd0813d13aca8d5c094511f18cc14504884ae6a |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/7ede5bcbd67c82c3ce6d1b354d0dc78bc02ee008 | ORPH
    arc      |       kismet-2020-09-R4        | NOK | http://autobuild.buildroot.net/results/a4b47789d1413e103ccc59662329b1f8a9340f80 | ORPH
    arm      |         mesa3d-20.2.3          | NOK | http://autobuild.buildroot.net/results/01918f6924c0410a1b0155ba14c5fa58e1b6c152 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/ea073b5d61fc916d8ec32a8539bd0189e633e455 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b5d1c64d8420ef6bae68dcd2f33372612f60d9da | ORPH
  mips64el   |           php-7.4.13           | NOK | http://autobuild.buildroot.net/results/2de8dd846f25de024e63eaa2fb6dfb4c08c2a64c | ORPH
   mipsel    |           php-7.4.13           | NOK | http://autobuild.buildroot.net/results/4bbcb68bd8b52605161dd31c21521c21d38a9035 | ORPH
    arc      |      python-pybind-2.6.0       | NOK | http://autobuild.buildroot.net/results/2e2ee57c649dea733e0417d0995cb9d3d9628a63 |     
  riscv64    |       quickjs-2020-09-06       | NOK | http://autobuild.buildroot.net/results/917f7283980d98ad8d19377fe11ddc388dc5e2bb |     
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/d10ad3ff8bd884cfdbcd9479d1e405e719cf2a99 | ORPH
   x86_64    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/19d0234c864feb6d005154ed3213deb152c22bc6 | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/7a0aabe0f1d894f724c9a4732fd9a28d658a88ee | ORPH
  mips64el   |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/1245e70b7dd3ad7f667ccbea979bbf0d5ca08fd3 | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/3cde148ea1c797d2015a57f9b64198ead4dcb966 | ORPH
    arc      |         samba4-4.11.16         | NOK | http://autobuild.buildroot.net/results/12f20ebed0585a1d7b2dcf6776ca33806758b7e6 |     
    arm      |    trace-cmd-trace-cmd-v2.7    | NOK | http://autobuild.buildroot.net/results/8b67d8dc48c1a6f1652c90f5ff198b4ebbc645c5 |     
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/e56a10f47072b75d2c97c0905a13fc33009201b3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/16ece3494b74763926665a600a0ba09c18c2bf4f |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/18dceb40f6087dae8b81f10c3d7650256b2b8d6d |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                        bustle | 1 
             host-pango-1.44.6 | 1 
                 opencv3-3.4.9 | 1 
              spandsp-20180108 | 1 
                    vnstat-2.6 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |             bustle             | TIM | http://autobuild.buildroot.net/results/6559cc17ea6f821ef5a694ae3403f25ae6d6c4a0 |     
  aarch64    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/3e1a833b6492ead5cb580efaeced47dc1113c4d6 | ORPH
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/c3056c0e647c8466eb4de68354b35b5c3cb258c6 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/73fc767e7dff2db6c9232a1e1327f0456dd71c9a |     
  sparc64    |           vnstat-2.6           | NOK | http://autobuild.buildroot.net/results/1a50e3f91204ef5ee6290312876793409f64715d |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

             kismet-2016-07-R1 | 1 
                   nanocom-1.0 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/876d5dacfc42272c69edba39242ed2272d02f06b | ORPH
    arm      |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/c091c5a82410234d0a794f9722bc4195cab0dd59 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                  boost-1.74.0 | 1 
                        bustle | 1 
 xdriver_xf86-video-ati-19.1.0 | 1 
                xenomai-3.0.10 | 1 
                  xvisor-0.3.0 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/99f57dc2d4f7b6ae0bc40011324fea7a830be87c |     
    mips     |             bustle             | TIM | http://autobuild.buildroot.net/results/ca3fe60298c80d67c22fb3dc6238bbe23b294ff3 |     
   mipsel    | xdriver_xf86-video-ati-19.1.0  | NOK | http://autobuild.buildroot.net/results/601552e6b6f7b6786f9f828cfa742bb5451efa37 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/b2c92786ea2b2630ebc6be147c1c35dfade3922d |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/d6b29945130fd00c6814886221f2e9ad6387b608 |     



-- 
http://autobuild.buildroot.net
