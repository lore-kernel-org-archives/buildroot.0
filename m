From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 02 Oct 2020 07:09:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-01
Message-ID: <20201002070951.0DCC9204EB@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 20  | 12  |  0  | 32  |
  2020.05.x  | 20  |  8  |  0  | 28  |
  2020.08.x  | 19  |  7  |  0  | 26  |
    master   | 130 | 115 |  0  | 245 |

Classification of failures by reason for master
-----------------------------------------------

           host-elfutils-0.181 | 28
        host-sentry-cli-1.57.0 | 12
              asterisk-16.13.0 | 10
         libcpprestsdk-2.10.16 | 4 
 Makefile:753: target-finalize | 4 
               apcupsd-3.14.14 | 3 
                elfutils-0.181 | 3 
        python-m2crypto-0.36.0 | 3 
                 uclibc-1.0.35 | 3 
               apparmor-2.13.4 | 2 
                  boost-1.74.0 | 2 
docker-proxy-55685ba49593e6... | 2 
              host-guile-3.0.4 | 2 
             ipsec-tools-0.8.2 | 2 
             kismet-2016-07-R1 | 2 
                  luajit-2.1.2 | 2 
                minidlna-1.2.1 | 2 
                  ndisc6-1.0.4 | 2 
      spandsp-3.0.0-6ec23e5a7e | 2 
                       unknown | 2 
                  zeromq-4.3.3 | 2 
       docker-containerd-1.4.0 | 1 
                  ffmpeg-4.3.1 | 1 
                      gd-2.2.5 | 1 
      gst1-plugins-good-1.18.0 | 1 
                   guile-3.0.4 | 1 
                   gvfs-1.44.1 | 1 
                keyutils-1.6.3 | 1 
            live555-2020.08.19 | 1 
                    mpv-0.32.0 | 1 
               netatalk-3.1.12 | 1 
                  pango-1.46.2 | 1 
       python-matplotlib-3.0.3 | 1 
                    qemu-5.1.0 | 1 
            qt5location-5.15.1 | 1 
                rocksdb-6.10.1 | 1 
                samba4-4.11.13 | 1 
       shadowsocks-libev-3.3.4 | 1 
               target-finalize | 1 
      trace-cmd-trace-cmd-v2.7 | 1 
                    wampcc-1.6 | 1 
               wireshark-3.2.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/243cec752fc79b0cc7d65cbdbb9f7168031ff7bf |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/9e45ac44f6e1d982798b9285fda4fa396aebb9d3 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b19b8b774fb3080b1a2ec73b13678ed479d407c8 |     
  riscv64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/480cbf2133ecfba268d9c4837f004df151b7dc2a |     
    arm      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/5c35e90f68ceee2dac8706dbfd4fe89a35180de6 |     
  aarch64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/bbe131948e33070ab076cee4552f2964dcb69a96 |     
  riscv64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/3b32e69b94faa70b17754b903297ef4fdaee2c03 |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/cd67d16e4503904ec342df067b35901b614693b5 |     
  powerpc    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/12c3889fe6f499181cb998854f5a1092da94f24e |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/1086e39fd2ae533dcb7f17b8a13818601ccd6cd5 |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/5277b1b5fdc0f2230081a849cd56c7e73ae9d4ce |     
    sh4      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/3a36cffd658e6a541f5741713dffe515f7490316 |     
   mipsel    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/92da632d040630831c247b074513fbe8e7c0ba89 |     
    sh4      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/a3f7bed0f823cb95255f2788c1ef2d3b056c7229 |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/70f3be11318165749e2846353eae91b8390eb513 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/040c906b188b09e1e2eb2b5e7545ca183707b9cb |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/c2e571cc8bb162d06a95d5e11c02ce638d0924ac |     
   s390x     |    docker-containerd-1.4.0     | NOK | http://autobuild.buildroot.net/results/82c440825290804c2fd6a92d916c93d2934e0a95 |     
   s390x     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/e8f8e232fb6bf6167f25c82026f4e2321cca9c26 |     
   s390x     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/7d4137c439ade81ab7bf141ad6504a69746d6dbc |     
 powerpc64   |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/123bdb3e7244800e1717f968c1d371e51f7fff2b | ORPH
    arm      |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/8808068c2671c16c0a5e485f82b39fe98b5fcc63 | ORPH
    arm      |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/8c57d5ede1376fb8c87851f0633ce6296010bde6 | ORPH
    arm      |          ffmpeg-4.3.1          | NOK | http://autobuild.buildroot.net/results/07a3332461910b4caeb18aad89539604274339a5 |     
    arm      |            gd-2.2.5            | NOK | http://autobuild.buildroot.net/results/133ff5ca32fba13cd9e011e7125a9a98df2a34b3 | ORPH
   x86_64    |    gst1-plugins-good-1.18.0    | NOK | http://autobuild.buildroot.net/results/e8cc67014af685a7cd994f744d22195c3dae67aa |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/91ff1522a04e06a981050dd2ae2a6707fa55ef29 | ORPH
    mips     |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/461e71d2d0248f3c59b38f48b5690049f61132a5 | ORPH
    arm      |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/caff2cabc62767ed8bf2c87b93f6bb477078df28 | ORPH
    arm      |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/a1fc95ea13f88c53e70a0b1269ce7419d8edc341 | ORPH
    arm      |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/5418793975092feb3284ad369103a5702ae6f301 | ORPH
  aarch64    |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/ef00708a1c729cb578986c0e238fd2a2eaf0320b | ORPH
microblazeel |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/61438f9b1936733dd3533e9f52be6b6e61b95239 | ORPH
    sh4      |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/e19d0f9f7928563e7daa1a6f40b9afa5cf694bdd | ORPH
  mips64el   |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/86e8a59e3df686b7198751c7fbd285d8998f7b93 | ORPH
  aarch64    |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/a66acb7534d9794ac9013533fe1acf94ae67c8d9 | ORPH
  powerpc    |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/7f63d6666904565a3c95134cb5cb6e452d24db62 | ORPH
    mips     |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/f3272f05bc30ee287e2f26168cc45c19a5df8588 | ORPH
   x86_64    |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/3882786340b3d88bd7a35a51a73ddd8ce61af978 | ORPH
  mips64el   |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/5f04fba0b43d13dadda5c45b43d6dfaa4ea0b8bc | ORPH
    arm      |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/caca9020ab34be5637491bf675098bbef6219d8f | ORPH
   nios2     |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/a076464bc24f58e923ed1e135c01a48b4b5f1892 | ORPH
  powerpc    |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/819feb3f18f638d93ee87c4e63025c8b7ccd9bc7 | ORPH
 powerpc64   |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/f9f91ad726cd5e7d149cd3e0e67e9081e58ce1c3 | ORPH
    mips     |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/1986591789c31ded7395aa55e66768622be96b60 | ORPH
    arm      |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/782599f71387424e76cbd9588424c9005ef2ab35 | ORPH
    arm      |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/8c0c350a5238a1d4ac4a9afa1f0451c369aca18a | ORPH
    arm      |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/97713c7e281313826067af559337832f22c3cb09 | ORPH
   xtensa    |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/ede3c0f540dbd4421e27fb734951ca6e6ddb9334 | ORPH
microblazeel |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/90981ef910e331f7144c7488d49c1f5a6c96af5c | ORPH
  mips64el   |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/52d031e46014d3806654f6ab52ee9dd5e7a57f8e | ORPH
  powerpc    |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/86730480813a36475941ef85a4a852ff1c99957c | ORPH
    arm      |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/46d2f9a7019bc44ec699804f2cbd581e084c1de0 | ORPH
    arm      |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/d905a8b8a4b4f16bb11728442a54604d26a46fb6 | ORPH
  powerpc    |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/223804d531ba42c684d537b9849d91f357e007df | ORPH
    i586     |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/996ba08120a5e0f105a652d18ebdf3f0ab880a06 | ORPH
   mipsel    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/45fb8e7282467108554a703f8e6c828222ced9a5 | ORPH
  aarch64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/d3e182ba6d779ed4f5bd43e78bb8c70f4c96a041 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7992de33def1e6db35fecc0d73963b41fe4c014e |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bf04472fd703cb538ca68865a2c09c0437a9413b |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/09e7bfb967ab588776e0b5a234b1c2322c7ee437 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cb32ba96a3226311b1bb0ee31b60e7bf329cbdec |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/10e28145a54c56e569a0614bc0c08eef6e6e8d13 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6205838c75df24c89df634b87b460fb476c02116 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3426185928da3ac8e90df9fba9f9b577358c674a |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6e28300f4e4a365ef4f5112ddc3d6e13dbc91f6e |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b0e40971f71c6d37eae036a92d490c27c16b5ec7 |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bca6f0ef30bc8fdfa98f48c96de368dc4644a1f5 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/49da006319baf6456816735584f3b4a43b9a98c1 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e722f92cc08c357e58484b7aecef724df0546b62 |     
    arc      |       ipsec-tools-0.8.2        | NOK | http://autobuild.buildroot.net/results/924c15c06754614a9af026ea30210513d1b1e874 | ORPH
    arc      |       ipsec-tools-0.8.2        | NOK | http://autobuild.buildroot.net/results/e46f3b50deaadfb0abb014105321a4fc69d09dfb | ORPH
microblazeel |         keyutils-1.6.3         | NOK | http://autobuild.buildroot.net/results/53ec9ca02798a88cd9ab773af10fc8f44ce9d1a2 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/6d78f940f3f031b6cd5f08ce4c0b8402832d34ce | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/1a439f37f3eb11331fd74b167f0161fb70960dc1 | ORPH
    i586     |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/3c9911db194a84889c31af7c88dbf177e2d1545e |     
 aarch64_be  |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/a842b1a6760b64701a134f4b89b6517c6977cfc8 |     
  riscv64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/02fc65b6f0cd282783330870bd4475e42d0c95c1 |     
  riscv64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/9094c1809529ef546565ce4dea5a410402fc26d6 |     
    arm      |       live555-2020.08.19       | NOK | http://autobuild.buildroot.net/results/a3947241c7c0c1f6ca192d7fc2b5bbe8caad7659 | ORPH
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/0e25a7f54377bfa3059a2cd88080df6e679b5078 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/d15eec848c02d315b181f415a309c2ddf11f0492 |     
    arm      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/1ccfb492127c6c165637c1d5dfc89c41a928c14f |     
  powerpc    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/876a6239eaf1796407589e525e11e020cb97cde3 |     
  aarch64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/1b74ae31c27ee0a9f2e7d05eacdfc6ff9a27e84f |     
  mips64el   | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/dd5501db83bd03f4760ba9c4802ad2247f232aec |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/72b821da9677dd1fbfb06d7dbbeac6d5704f55c5 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/c6fea370790315a9769c2441746d14f031111bc7 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/a3271538b4efb2769b718c83dc750e59d4ff54a0 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/8bcd5f64c6355c74f521e9c9d3686341490d82e3 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/9207e771e990463682c824b010dc3c0a3aabc0d3 | ORPH
    arm      |        netatalk-3.1.12         | NOK | http://autobuild.buildroot.net/results/c3381fd3072901871fdd491dc3d4f66e403c7a70 | ORPH
   mipsel    |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/b1171b39e7175cb5181c053bd5ae51409b945572 | ORPH
  mips64el   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/7e77c39addcf796bc19df96f61d5c43861d6e341 |     
    arm      |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/d58c9182543e61d7ebd68c3d1e171babc1f05e36 |     
    arm      |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/d28a565bf39619aef825c59a0d9d3101e4fd1912 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/25266cbe32939f613f72dafaf962856e07bfb9c8 |     
    arm      |           qemu-5.1.0           | NOK | http://autobuild.buildroot.net/results/a538167e288c14208d557cd45446df86d3d599d5 | ORPH
  aarch64    |       qt5location-5.15.1       | NOK | http://autobuild.buildroot.net/results/931ff7255c3a36d28d4488e68a522e01c6a7b878 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/3d330f6f639bc92b4af6284d8cf30fc2e772ec55 |     
  mips64el   |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/72eff626b531750babb5cead293ac33648d9c902 |     
    arm      |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/3799aff5b18ef63415b00ec6536c17088edd2570 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/e2b32091b3e74585456579f7768db49bbfb95c82 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/df53cc8ee873cbb60cd5f05786a53d02abc508d8 |     
  riscv64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/74128f80add21e404e44529a39e722427fde8323 |     
    arm      |    trace-cmd-trace-cmd-v2.7    | NOK | http://autobuild.buildroot.net/results/d1bf22500c32562e182b50497f94ebfd46a77c5b |     
   xtensa    |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/77483f1247d9fc7bcbb0649e30bc9a2ae1c03eb4 |     
    arc      |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/6317dcf92062b8514be1ba1693ddb25c0f8cb7e1 |     
microblazeel |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/a1b0f4c0b92dffcde5c04f536dfdcc65bf482f2e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/87d81650a627cbd4af2b9a557e734ae24d85e242 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/ee46e35208cab484f551ce36554e327d8eb10afd |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/46a5a2c1a30e8ae3b4da279bbe20571e73a09c25 | ORPH
  powerpc    |        wireshark-3.2.6         | NOK | http://autobuild.buildroot.net/results/4b0f4f295745cf4285fcc835447fb4aa0ab7e74b | ORPH
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/f2759f61be546775fc2c1adacd2f8a0cd739c863 |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/f5bed3bbc68cce8a7a1f43ea47d08911a59396be |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              host-grpc-1.25.0 | 2 
         libcpprestsdk-2.10.14 | 2 
               target-finalize | 2 
 glslsandbox-player-2019.08.23 | 1 
               log4cplus-2.0.5 | 1 
                  luajit-2.1.2 | 1 
 Makefile:753: target-finalize | 1 
                  ndisc6-1.0.4 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/d406ae32616b088b5547fd8f9edef1cba2628f78 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b00576ac59018d00d1a6a3ff9fac112e36fc51d0 |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/fdbe4ef6f765e37cccf9cefc3c65bdba9ca57537 |     
 aarch64_be  |     libcpprestsdk-2.10.14      | NOK | http://autobuild.buildroot.net/results/ad80b0cb4643f585e7095b9f1edab060556ef17a |     
 aarch64_be  |     libcpprestsdk-2.10.14      | NOK | http://autobuild.buildroot.net/results/bf48a1ab26a257b3997b0425ec2f33c474843292 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/81467fa50dcea2377436e0f9812c8faac86b22f9 |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/d25074e58e66d5db909c5cf02d14043344f7297d |     
   x86_64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/aad42f4bbbd0c30f5d4578a9943b57f98db5c665 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/06ec64eebc7299f9237c2debe10cd49c98f87a04 | ORPH
   x86_64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/72e0cc78194a1b93bf26a50742e59a1e93bde1d1 |     
powerpc64le  |        target-finalize         | NOK | http://autobuild.buildroot.net/results/4ca459d54545c0e20b0f0cdc63bd81844ecd7f36 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/95e73bcd090968d15a896e0d0ecf54e7b43488aa |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

                qt5base-5.14.2 | 2 
              host-grpc-1.25.0 | 1 
         libcpprestsdk-2.10.15 | 1 
              luabitop-1.0.2-1 | 1 
 Makefile:753: target-finalize | 1 
                  ndisc6-1.0.4 | 1 
                       unknown | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/111303adc8e563b6d39ef4430310324586169b8a |     
   xtensa    |     libcpprestsdk-2.10.15      | NOK | http://autobuild.buildroot.net/results/c2101750a87421e2308dbfc2a91b184dc3739a37 |     
    arm      |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/3ad6a650d5e33f47e317304ce47d7803e96e597d |     
  riscv32    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/3428972bbee67b9526951e918443394384d55e06 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/40a788f2c1ec3f2b152afe9560854e914483e314 | ORPH
  mips64el   |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/928b56feae20b7e822043d0df6e569dd26f0b179 |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/12eab7a9e2a9296b50ed22fc81b775e6754bd519 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e4821aff4db8e956d56fc1019245ebcc9a493033 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               apparmor-2.13.4 | 1 
             kismet-2016-07-R1 | 1 
         libcpprestsdk-2.10.16 | 1 
               libupnpp-0.19.2 | 1 
                  luajit-2.1.2 | 1 
                      tio-1.32 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/7458010e08f3b9840bfca8c66d8e968e7ef31686 |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/b7595502ac95b754bf27e46bdb1394970280b8e8 | ORPH
   nios2     |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/b23f508c7f42d97cf7352b0de4f2fb9b74e6c9ab |     
    arc      |        libupnpp-0.19.2         | NOK | http://autobuild.buildroot.net/results/566485640aebde864b8a1cc3d5c81e113320df7a |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/88ca0e40aa294d9f73ea205690365353ae6af30b |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/d8ccc0237b82e142adbbc542cdbbc9e1ba05371f |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/a49a8425984475b75457ab877bc3e482732c675b |     


Gitlab CI results for 2020-10-01
================================


-- 
http://autobuild.buildroot.net
