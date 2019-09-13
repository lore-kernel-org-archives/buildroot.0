From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Sep 2019 06:12:53 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-12
Message-ID: <20190913061259.228B48453B@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-12
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 11  |  0  |  0  | 11  |
  2019.05.x  | 18  |  4  |  0  | 22  |
  2019.08.x  | 15  |  3  |  0  | 18  |
    master   | 134 | 64  |  0  | 198 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 apache-2.4.41 | 11
                log4cxx-0.10.0 | 7 
            wpa_supplicant-2.9 | 6 
                  luv-1.30.1-0 | 4 
             subversion-1.9.12 | 4 
                    flac-1.3.3 | 3 
            python-sip-4.19.13 | 3 
                    ffmpeg-4.2 | 2 
            host-mfgtools-0.02 | 2 
                snort-2.9.14.1 | 2 
                     apr-1.7.0 | 1 
                  exempi-2.5.1 | 1 
                   fio-fio-3.9 | 1 
       gst1-plugins-bad-1.16.0 | 1 
                 haproxy-2.0.5 | 1 
                 host-icu-64-2 | 1 
                 libdrm-2.4.99 | 1 
             libgphoto2-2.5.17 | 1 
                   libnss-3.46 | 1 
               libupnpp-0.17.1 | 1 
        ltp-testsuite-20190517 | 1 
           lttng-libust-2.10.1 | 1 
                    mpv-0.29.1 | 1 
                 qt5base-5.6.3 | 1 
                suricata-4.1.3 | 1 
                   systemd-241 | 1 
                       unknown | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
               wireshark-3.0.2 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/0ba0be6ad69cd01d088a5e32a4af6811893b0905 |     
  riscv32    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/2b556369a052ee78d4a326d1af1598b79b96fb2f |     
microblazeel |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/b3330412a4770c4b5268a6625c846f7db37825fa |     
   nios2     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/fc4efd47c5c3841758ba4aa53ae239d6e9ec890d |     
   mipsel    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/158e2eb050d70b717aa3fc4513a4dff108feb04c |     
   xtensa    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/88c3df5d01bff9c8a4538b4abb18e874c827bcfd |     
    or1k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/db0b04efd15163597cb725173cb6f3f26de67664 |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/0f058c84f88146ea035f0385144de892c28dcd83 |     
   xtensa    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/0c501048194426ad5c89b797e126216b78ebcd1c |     
   xtensa    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/e31777771399bc5edf4993ef9e5597bba65727af |     
   mipsel    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/5bbb6048a73ad40ac3bf846c5498c6b609c273c4 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/603c8a63e3735c03f0cd2b16aca3b7b452f07121 |     
  powerpc    |          exempi-2.5.1          | NOK | http://autobuild.buildroot.net/results/25b42bb98adcedcd5183ed4dcd39972a73ce7ed1 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/3fb1669171a5a48eb399a52235dbb7d47e87bac6 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/6fd9caa274d1cf1a4f2f09cfb1da2294ac17d68b |     
    arm      |          fio-fio-3.9           | NOK | http://autobuild.buildroot.net/results/771ce92fd5e5d9aa039d43b762769ee089aa5af1 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/18ff74871ad37336217f00a59ffdad27a82d4648 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/06757e1f95d4ee076a9f9405e25ca211642a2005 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/59a60d64acdb243af08cb17d39b9d18f612e50a7 |     
    arm      |    gst1-plugins-bad-1.16.0     | NOK | http://autobuild.buildroot.net/results/9f699d3d07f02884a5ba60997c4d6867057a37d2 |     
microblazeel |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/f3b57aa22f429714a3d54f4339a07213179f2549 |     
 aarch64_be  |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/7bf8ef5a818df3f0d78f4ae853bc532a84208975 | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/12bee63778b488ec5457e875f5ca3c66e4ee4db6 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/93873e4992371a24036fac563b59c9d7ee4418d2 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/5cbc74648725ddc6df07eab6a3d5029d920e2013 |     
    arc      |       libgphoto2-2.5.17        | NOK | http://autobuild.buildroot.net/results/97c25f2647c1df4b477873add5d9a927cb75adcb | ORPH
 aarch64_be  |          libnss-3.46           | NOK | http://autobuild.buildroot.net/results/6892d6c97c40ba78bcd7efa0369bdfbf1468c26b |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/32da93d6b89c482273f2d885e36789401994e2c3 |     
microblazeel |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/0e01ddab88e8c01791aed39c7230ff3dc979b93c |     
    m68k     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/a6f206fd0b0f85bff365981cf3418df837d32b9a |     
    arc      |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/02542adf56c478306fefe0b2aec1f0fa8b671b3c |     
   mipsel    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/aead85e254877f341576c58a12e3f3f95a719e9a |     
    mips     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/4de73967941f670d710941f724b48d24eb0d8570 |     
    arc      |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/ebabcee5eadd7e2439dc6db244fc08308df01e18 |     
    arc      |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/3c125c36df948cae43ff0d565284dcc4a256fab4 |     
    arm      |     ltp-testsuite-20190517     | NOK | http://autobuild.buildroot.net/results/2517e4a32d8bce2c6d240f29f602e0942cb895d2 |     
    arm      |      lttng-libust-2.10.1       | NOK | http://autobuild.buildroot.net/results/23334631e1df73492ba1e1211e660a3ca5530a0e |     
    mips     |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/fd9e020aa163d960aa205d6a535ac9c10b55ae15 |     
    arm      |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/ce9f9d9a50de5b4b8aa79d81fcd1ab009f4c0104 |     
    mips     |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/8a458f80ac95805b60733b8b40bc6faf5f2e3ccc |     
    arm      |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/6c18eb473ee897152896d2e952efe3a0cea697e0 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/1b2e5d329368899affc301dee9aa0c84fc35fe2b |     
  riscv64    |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/05f85efaf60180e4cbbc000adc29a5428c8c35d5 |     
    sh4      |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/17fd22b9ee73b80a7de5f5e275b2d5465e344c4b |     
    or1k     |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/e1295783dfabece30f6e878f6894661bda19f8a3 |     
    arm      |         qt5base-5.6.3          | NOK | http://autobuild.buildroot.net/results/6abe2a7e0ac3a06a9e772be6f4766487b8cc241f |     
  aarch64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/00212c293aea76a739e50c8db9163d2251555878 |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/fd700e6d330155cc91c419df0c455a6b10cc125b |     
   nios2     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/83d62fb552901d14381f3662aa6e002752971972 |     
  riscv32    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/327bdc3ee8a4be4f95920954cab51ad8bda34e80 |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/9c516d9a1b63982a07f773edd74354e8b66464ce |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/5977ba535f168e39bddce776ae18fc2c5c0e288f |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/2e19f0a91b0cc35c26c4ed8f3cb87c0641c176e3 |     
   mipsel    |          systemd-241           | NOK | http://autobuild.buildroot.net/results/347f9515b2274d1fc09f9fe375ccf6355eaf2c2a |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ca9c8ae47793cabc47e426fdd1a652c79beac568 |     
  mips64el   |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/556704f352726f4233c0e2ea6a03995f3706cd3d |     
    arm      |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/8dd99820b8d4b7a7e700fcddb3d9a4fa09d152be | ORPH
  mips64el   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/a953c177e0757deb100e74bb4dbc47e15589ca6a |     
    or1k     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/6bbfa66316c439c75d05b7c5577f797d47ee3e7a |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/4920f4e099af59ced6024ff94465695aabc84c5a |     
   x86_64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/81bf0004a0e015d1233edaa8ce3edb2c2092513a |     
  powerpc    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/552ad9e42db9b2a3d2b009a6a17d248c39a3be03 |     
 powerpc64   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/cd90b8a0a4eea0ba2caa96a252688353321f2281 |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/e6f4bcc64b1083ff41bd3a900b774d856bbb4925 |     




Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.35 | 2 
           host-mfgtools-v0.02 | 1 
               host-qemu-3.1.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/f006a6bfa45c374e6f325c2ad9dfca9efd710b18 |     
   sparc     |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/db66a07658bf28f92e0107a7acf61c648e3d4a1b | ORPH
    arm      |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/e42abab9725bf45b37a98f8a7d8f34c30b77810d | ORPH
  mips64el   |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/89a4e07fa91eb467d3e1baa53b9b0606d21cdccd | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.36 | 1 
               libsigsegv-2.12 | 1 
                qt5base-5.12.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/5acab0a417df8e2136b3278fd6e158e6622b8769 | ORPH
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/7fcac87209dc739aa2c5bbf52df8a09c999d3d8f |     
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/bb7a5388e05769db2704c5eb546c40c4b66b3cd7 |     



-- 
http://autobuild.buildroot.net
