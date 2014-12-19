From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Dec 2014 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-18
Message-ID: <20141219073017.903631013AB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-18
===============================

        success : 300
       failures : 134
       timeouts : 2  
          TOTAL : 436

Classification of failures by reason
====================================

                   erlang-17.4 | 28
               xfsprogs-3.1.11 | 15
                  boost-1.56.0 | 13
                  guile-2.0.11 | 11
                pinentry-0.9.0 | 8 
             libxmlrpc-1.25.26 | 8 
                     gdb-7.7.1 | 6 
               ipmitool-1.8.14 | 4 
                  perl-gd-2.53 | 4 
                    libcgi-1.0 | 4 
             bluez5_utils-5.25 | 3 
                  libdnet-1.11 | 3 
                   ezxml-0.8.6 | 3 
                    vtun-3.0.3 | 3 
freerdp-440916eae2e07463912... | 2 
                    fltk-1.3.2 | 2 
              host-scons-2.3.0 | 2 
zmqpp-36413487f05b165dfc82a... | 2 
        gst1-plugins-bad-1.4.4 | 2 
                 pixman-0.32.6 | 1 
                  snmppp-3.3.4 | 1 
                  nftables-0.4 | 1 
                   perl-5.20.1 | 1 
       opentyrian-2.1.20130907 | 1 
               madplay-0.15.2b | 1 
                gptfdisk-0.8.6 | 1 
                  thrift-0.9.2 | 1 
               sdl_sound-1.0.3 | 1 
                poppler-0.24.4 | 1 
                  sispmctl-3.1 | 1 
               libsigsegv-2.10 | 1 
                 libssh2-1.4.3 | 1 

Detail of failures
===================

        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/236015ea5bb4d6ab36841e13b599c3e00ef61518/
        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/f589a046f52dfb94d2ca5d305a976d858dea3070/
        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/a93b86745ff13e8e53137179ab8054aa3ad59d55/
    mips64el |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/b8c6455b3940c94e620e944dc976a0072ef03b61/
    mips64el |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/baecd81ba64e95f70146fe6e6e2e4aa8b5994f55/
         arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/d20a404c4e5e64c0f0e81bf334ad0219d46a6b0d/
        i686 |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/359759458909fefc02b2ba37a5a187aa159c1edb/
         arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/5378e70ffd3af06b94533835a5d0fcfac265377b/
         arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/0e134cb3f12d410efa95e97b22d1e308a53b1516/
     powerpc |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/3543135929040c763503a3ba44bd307889f4bec8/
         arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/b55ed4b691afcd2dc50ecfa6c39cf5549cd797b5/
      xtensa |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/4f9aec5feb80bb72bf3e4909276b73c37a1dae4c/
         arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/b74255e9921e37da157a581343a1fb187b5e8b32/
      mipsel |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/d4298515bd3b2b5c6c0a83e620a791c28b05226b/
         arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/5f93b6aa6f74609e8e60eea981cd7b17fae99ea4/
     powerpc |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/70978b35a9f1125754e1f3aefd82c86de928e6f9/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/cf1af29e37a42ea841c1e46f37b34caf538f206d/
      x86_64 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/bb2361e69c7959a7f0336bac1b5d9072377bcc6d/
        i686 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/f655f3bbb6f4272002ce19367e7a7998a56b3de2/
        i686 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/d1104ffdc701975756dc45c6a8ecede2078c6944/
     aarch64 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/03af0709ad92c008498e63470f22519af56bb857/
        i686 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/955ebc367e3591040a0b089f0ca598c0e35e5a5d/
      x86_64 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/f8043a96797c149c23ebf12f305197799357ad74/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/d0388548928ee13adebf66f6427a2568f1bd7b10/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/8dea96d6a7aebba04961dec1faebd610104d69a4/
      x86_64 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/29e909f8720cec14bb708c2846cb990ccf8a5045/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/1a264803587c531ea73ab41bc784b943036b1b5b/
     aarch64 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/baf369a96ecd32883e85cabee671eb76af31ce67/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/9ed14e37fbbcf44ba7f8440a85e1a8afec5967fe/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/d9a46d816e5ae455b749f1632b9897c48d580e97/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/cefd176da461d15e0751b31b79fdd7d83e5d50a5/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/634d004222f195ac51b5188d43005e4c717b8261/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/e17e04981480c6e04a4e2a03d37ca64b3bac4e43/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/144a504bda22fb0bc126b7090c933077de3966a0/
      x86_64 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/aa9a161503f6da8418c3695e150fc9d02f53f3ae/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/ff4cb39685060479d69bed02aca8023f06279b31/
        i486 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/377f59039bb43dbb4e3c506559c19c312dd961ff/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/89cd441410b9f9ae521db906466f8254258f99a3/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/8c80ac1beb0cf47699faa0fedfa0bcde4d62a8ec/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/e058248d713a34b23c09ccf4f19900da6e5d64e7/
      x86_64 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/96386e80f5ca3aec1b8137a02788304613701d49/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/a7cc02c7dc377f0fcdda81a880b8364615cf1b48/
        i486 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/289c7bee61350b625bba66d0b79f3fd36e47be12/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/0bbf38b0feeecdf8f57635a9d43564510c1f68ae/
         arm |                    ezxml-0.8.6 | NOK | http://autobuild.buildroot.net/results/37e9bb19bff49d7614b6631839ab4ee84a07ee35/
    mips64el |                    ezxml-0.8.6 | NOK | http://autobuild.buildroot.net/results/ffc826c0d6722b793bf188cb4d3b04d7a4ac1544/
      x86_64 |                    ezxml-0.8.6 | NOK | http://autobuild.buildroot.net/results/9c0e7e45667f5067c4a23470d61dc81f63eda9b3/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/bac2d1f69c363518d940ff4d9abba641f5f890bb/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/64a5fe78038af307032451f5ce6043edc663e78a/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/9186dffca348f8ab290e983275ba26a9b71f0b0d/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/2d704304e76484c19cbb80bab153625852214c1d/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/59cee77ccd5148e15325422f290d43224ac87916/
     powerpc |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/af04313ea93fd4bff2e5b40d86927cf747717d4f/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/ce4a1395b9a93789b4e874de95ee8b890fe26f27/
     powerpc |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/354ff2586cff7da85058069aa0b75960e2014d92/
        i686 |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/c5298478ba4542f8923c5da5de2fcc59f81c9cd4/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/af82079e3e13c5fe86c9f3296b7e784c4b0b3f8a/
        sh4a |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/6b4e7fd5d6c77549c3d02fe01614acc444275c74/
     powerpc |         gst1-plugins-bad-1.4.4 | NOK | http://autobuild.buildroot.net/results/8362b46c02f25812f8c061756d8b43b451311b56/
         sh4 |         gst1-plugins-bad-1.4.4 | NOK | http://autobuild.buildroot.net/results/0e50e184143cd6ef34716c14e0a9efbf0bebe913/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/379e78dd27a8976615a41581d9713245da98b08b/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/c25436b80fddfcc7e16496617fcef9fa1814614a/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/ba0a8ac4ac8e03447c6ed66f8158cd3e69009751/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/6d4eb5fc312da930e0f34670453bcdc50d90467f/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/7b31dcdc9d0aba95defd0d25d2f39c05f7682072/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d0b4309a3c22f708907acae463b05fb9ea5d4f5d/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b2a906c0943e7aa454248c306be3597dac3f2bc7/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/10f834e868c387c47f4529cb7fcb9b3e6b4e948e/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/a8e56c9d24e303bb658aecae11a1d0e326f716f1/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/6b9f0e6027a4ee0611e4003c498c0f0074a4f58f/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/233d8e67512237a99b22097ef82285488624cf70/
         arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/5f6f711f3437db6ac6632ff7ca8c671d35d260bb/
microblazeel |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/636000537fbbeac8fb740d0d81ef8af088bb1013/
         arm |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/e56e2d4102d99e3f77c53ddf1acb347f165db266/
     powerpc |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/7e1941f11dc10ec18829945cca0cbbff7c5263a1/
        i686 |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/8613011a7675c25b2401849783fa2cb49647d216/
         arm |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/471e0bdc9d12e35776bd03a1c6b7a6a90d40efbe/
     powerpc |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/54853aeabbbd16227d9d8cee2565e9e5fe25211a/
         arm |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/fb885095af58dd842a2100b14211084de5345188/
     powerpc |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/03234acba57b64fc96dc8c9adc1f7b3d3928a722/
      xtensa |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/75118ee36f876b3c39324e5d71cf67ce14be019d/
         arc |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/7f3af1b66fc5fa50fbb25ef3063b535bad466405/
microblazeel |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/8450fede6c236effc485a56fa2d3e01561e7dab1/
         arc |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/9e165187b11beb0ee8a05227435b3b8c44269be8/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/662080649b0de2c8afb4200fcb1d1057721beb8e/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/d43ac8c4b4be983a2b04c57a6bf954b1366554b8/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/5d6d1e6015d761766395cbff6b3615f64f513eb5/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/eae1e970e6f6c10756e15cea3e4c32158758c5bf/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/cb70deb4e3c7272ca7f71cce71d0bff5cacafb61/
        i486 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/9fedf6567c67cbcd04f484cd1fb18c5770be5288/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/34a560b69e78f8eeca1c4e57692be1b43288e40b/
      mipsel |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/7357ad0b64ff79ec87500ff6012362db40ad92b1/
      mipsel |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/2b1f912a7d490d6ba7233d74d8d2677d81ebba7c/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/901cf4757e5df2557ed9a1d7c00475e718870539/
        bfin |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/069fd09e40045e30abe454433b65b5769e5e6a8d/
        bfin |                   nftables-0.4 | NOK | http://autobuild.buildroot.net/results/07b6aaf4ae46aa6e6d5a12e455d70d7a5f73eb20/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/3df6115ef007f51a5df9d8939b936155822489d7/
         arc |                    perl-5.20.1 | TIM | http://autobuild.buildroot.net/results/33373b7c0f67af3ad3290ea0ec2b9dd005cdbf73/
    mips64el |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/1a11af748a1cde51655a0cff4374b3cc7a596934/
     powerpc |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/4ac55d8a3167a8f179fe3a67498137d09fa3e547/
      xtensa |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/751b303c75009d154a99ea141a640549de690294/
    mips64el |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/6014d65f9c00234d49ba5d3d16a30e2aedb922db/
      x86_64 |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/cbb947d503a5775b5d6f1421ea2adf8b22b3683d/
        i686 |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/1456206fd250bc6c35feff01e0d6f33353e7b899/
     powerpc |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/db597b01edfcfc64f0bae0ce219a70e4823ca3a9/
      xtensa |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/7ab232e7c792dfd446724d8378ae6a2ee4cedf94/
     powerpc |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/ffad3e3a62b42aac84ea60825b9c1863721fc519/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/7770b53d31c9aeedb07ffa692d80bd02f1e7d197/
         sh4 |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/ef7fd8d2c4d801d0cfe932f227b5ce6772be2ac6/
     powerpc |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/356d4c3f92287df4ad0347af6fa820d46f771da9/
      x86_64 |                  pixman-0.32.6 | TIM | http://autobuild.buildroot.net/results/59d226ee21dbfcd8dc991fc52161ad8543c6008b/
        i686 |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/2f941ddf93a7af9c7bc8673db4fb6a23bb2c9b3c/
     aarch64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/302286327e788e3bc5f9dc9bc625c48091bfb5a5/
    mips64el |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/d3fc077d1035798fb769f262d57221c3392f56e8/
      x86_64 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/cc15ee9dac3ed060b666d95d0398438a2950e806/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/be74bf5afe40a7fcb5b6724c61b0d3307e08c598/
        mips |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/73a2ba52cc6671aaa021d062c908fd08ae45e3d9/
         arm |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/e16af8b4f4acd53923af856f0344a1b3a8a764d5/
microblazeel |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/86fd65d20ef9687b8442536e87e442c8cf7110b8/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/e055e44432153ebedb79dd14ee36b20635a56695/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/fdf1fb2ad26c55f8bc7e8591034109e110ee6b35/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/f029c08763a3f30ceb8e414aa9010270e5eb8530/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/a961262dabae8f5ee31cf29a54aa7a00a5870c3e/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/3c9b5a6299f22a4dd63e4717bf1e59506c3eca3a/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/db48f716d5f62f9e0d381802a6d8d0422d6c8cec/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/b5dba86d76b46aa0f4e00009d6c98b431eba4d33/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/7bbdf050c4647763b6af8409a743118eeb39886c/
      x86_64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/9097aee1bcfae826c45c046da9568a43f75abd9c/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/92c911b09582064608aca927a715d61228b9e88b/
     aarch64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/fcb57120ea6a790ccf9d5f9814209b4c86936519/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/654d69cfdbb9e146ca9cf496223aa46ceb632c52/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/dfbdfc88d3a4c627c8848a0736077d733a92f4d9/
microblazeel |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/56981e0278ff5a9e644fa2b62bfc8cb8e79099bf/
     aarch64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/6ede99fcec4e60c6e315db68dee73019984791e5/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/20002f71c0d40d9ff7d7e84323c567bff185e67a/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/99eadecf46993f575598a955ac456f1eca33c21b/


-- 
http://autobuild.buildroot.net
