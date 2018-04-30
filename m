From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Apr 2018 08:00:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-29
Message-ID: <20180430060020.05D622076B@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-29
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  37 |   2 |   0 |  39 |
      master | 217 |  48 |   2 | 267 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   flann-1.9.1 | 1 
                 mesa3d-17.3.6 | 1 


Detail of failures
------------------

   powerpc64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/4a44b25ab31a3ae04d3dd005db0ad0883bfad3e3 |     
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/ee1739ec2e7451d8f3c1519f737f2a00fe89aefc |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     lxc-3.0.0 | 14
           libfreeimage-3.17.0 | 6 
              dropbear-2018.76 | 5 
                  host-go-1.10 | 4 
                cifs-utils-6.7 | 3 
                 libcue-v2.2.0 | 2 
                  udftools-2.0 | 2 
                  zeromq-4.2.5 | 2 
               asterisk-14.7.6 | 1 
                         boost | 1 
                  flare-engine | 1 
      gst1-plugins-ugly-1.12.4 | 1 
                 host-rauc-0.4 | 1 
                   jamvm-2.0.0 | 1 
       kompexsqlite-v1.10.12-1 | 1 
                 libebml-1.3.6 | 1 
                 mesa3d-18.0.1 | 1 
                     php-7.2.5 | 1 
                     vlc-2.2.8 | 1 
                   woff2-1.0.2 | 1 


Detail of failures
------------------

      x86_64 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/5599d723542e02808e97df5d1ecb1b9a5d13e05c |     
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/ff408721b5d4f210df66fced0274c481aa21f662 |     
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/f0ab0a817440a4d208866e0a4f1ae8be6d3c3a1e |     
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/f6aa256c5453d024fd5daa0656dbc769399468ef |     
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/7907ae10cf33ca82e58b9da696f7487d8508bec5 |     
     powerpc |               dropbear-2018.76 | NOK | http://autobuild.buildroot.net/results/956d254675e6500c19c3bb7ccdf12ce136858720 |     
    mips64el |               dropbear-2018.76 | NOK | http://autobuild.buildroot.net/results/2157679e276623ae875d1b31f3e5a68caf586536 |     
    mips64el |               dropbear-2018.76 | NOK | http://autobuild.buildroot.net/results/4549df44267f763085df1954468de3efb695a9f2 |     
        i686 |               dropbear-2018.76 | NOK | http://autobuild.buildroot.net/results/01ec89a81c4ec6e36e2f81b5a9394050a91df654 |     
    mips64el |               dropbear-2018.76 | NOK | http://autobuild.buildroot.net/results/1837d784c629939b4e82eef91f4ed835a34e0287 |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/220748676d0b40801152d046ebfa93a54405cb17 |     
         arc |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/a766a28c584534b6a30839cfd98428d840bce3f2 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/208e6a9fcaaa5897fa2d562fac8320840672183a | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/4d96b3b11bb9a158ccce6445aee0b7bcba37397f | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/7d6eac88e3b8dbfe0db9498bd0fcb63c026b1922 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/45b16c1fb26d5854792f627d1301246729d78e7f | ORPH
      mipsel |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/892bc595ce304a427f8a8d44bf14eee4577c501c |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/264f757ecbfbc99059e1673641c1503c4b4aff23 | ORPH
      xtensa |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/aa853e424b89347d323540780704c73e2f36d05b | ORPH
microblazeel |                  libcue-v2.2.0 | NOK | http://autobuild.buildroot.net/results/0ea56b030762214dc5d7866943de2c33dae1fc89 |     
microblazeel |                  libcue-v2.2.0 | NOK | http://autobuild.buildroot.net/results/a5344d18dbdc86705853fbf8a66d5304de07a9b2 |     
    mips64el |                  libebml-1.3.6 | NOK | http://autobuild.buildroot.net/results/3c2402a7052acb67fc7e03ad2ff27e84534aaa36 |     
      mipsel |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/747288db1ef63a89c1a3a03b807fe9c8141acb65 |     
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/d7f2579937f0da217803fde0f302a2ab0cf889f6 |     
       nios2 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/975d791a002171d2c6c55bec77a0c5726af5204f |     
   powerpc64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/ca9a403956c9f17ca1f3651d6ea8a4e0c7a54bb5 |     
 powerpc64le |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/1387ccddab7f40f5ef160e591fd043af3aa7f579 |     
 powerpc64le |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/3814f19398e2874e8c8aa264e04dadd310bad421 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/2e5d209c872ff722ab1681d269302a3ab3538335 |     
        or1k |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/892d9648120d98b5662672cb72f3c2ee0093f6d9 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/3f763ed58e1944cfbb0d26cfa0fa97a14f1633f2 |     
 powerpc64le |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/db909a408a60fcc37c98440da2a158c8805220e9 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/98a2ec1df2b672bc79a4f78472c779145404db62 |     
     sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/cc1af839f5853176216b6a839c60dd54b11d9722 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/a0b4f36d15324e28043e34d22e943b48d9015dbc |     
     sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/3aa8335f42df067d7f453501c19e478e94e554b3 |     
     aarch64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/1a5be42e2c438ab3e3b28d4e6e1fa4b4750900f8 |     
     powerpc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/b05c8b9a8ff53ead36603b01d97d3ef1765e10d4 |     
        i686 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/3d736629d26ab07378d33cbb08e42d82a6d44cb8 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/22968c4801e5179c986000586e509b2c7604be62 |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/7e463a2377a831f4cd093ce5e1b53936fda2e8a5 |     
        mips |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/9c8ca84947f77860a0e29e94515bb9ff3f07172a |     
      x86_64 |                  mesa3d-18.0.1 | NOK | http://autobuild.buildroot.net/results/29e1d383daf87f43cf44d1e8884de1dba72e33d2 |     
      xtensa |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/cb0fd2f684bc4a192e634ae3f62c7bc0bae578b3 | ORPH
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/2017e395e1b81e1762f3f1558744c94a27a4052d |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/1c628bda53a8e9c861ad36f42346da9af06bebff |     
      x86_64 |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/c2e60cef60f15d3aba6a0d701e2d968a0213864e |     
        m68k |                    woff2-1.0.2 | NOK | http://autobuild.buildroot.net/results/6de03af5832dc719f2dc073c40b325eba443388a |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/cab0392e9c5a62205dbc89db36e87ba213c5633f |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/696ffe553a67b38af8e52e89747412893222d7d8 |     


-- 
http://autobuild.buildroot.net
