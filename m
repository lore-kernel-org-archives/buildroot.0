From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 06:26:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-24
Message-ID: <20200425062653.AD4B386B50@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-24
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 27  | 16  |  0  | 43  |
    master   | 181 | 185 |  0  | 366 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libtasn1-4.16.0 | 51
               apparmor-2.13.3 | 19
              ibm-sw-tpm2-1563 | 15
             paho-mqtt-c-1.3.2 | 12
     python-argon2-cffi-19.2.0 | 7 
    python-dataproperty-0.48.1 | 7 
                       unknown | 7 
              exfatprogs-1.0.2 | 6 
              host-grpc-1.25.0 | 4 
                     avahi-0.8 | 3 
             libopenssl-1.1.1g | 3 
                 mesa3d-20.0.5 | 3 
                qt5base-5.14.2 | 3 
               acpica-20191018 | 2 
                  assimp-5.0.1 | 2 
                    brltty-6.1 | 2 
              gr-osmosdr-0.2.0 | 2 
           host-nodejs-12.16.1 | 2 
                 openal-1.19.1 | 2 
     python-mbstrdecoder-1.0.0 | 2 
                 rocksdb-6.6.4 | 2 
                  zeromq-4.3.2 | 2 
                  aespipe-2.4f | 1 
               apcupsd-3.14.14 | 1 
                busybox-1.31.1 | 1 
                coreutils-8.32 | 1 
                  dnsmasq-2.81 | 1 
                    gcr-3.34.0 | 1 
 glslsandbox-player-2019.08.23 | 1 
                 granite-0.4.1 | 1 
                grantlee-5.1.0 | 1 
      gst1-plugins-ugly-1.16.2 | 1 
         host-exfatprogs-1.0.2 | 1 
                host-go-1.13.8 | 1 
                 jbig2dec-0.16 | 1 
             kismet-2016-07-R1 | 1 
         libspatialindex-1.9.3 | 1 
               libuhttpd-3.1.4 | 1 
                   mimic-1.1.0 | 1 
               mongodb-r4.0.12 | 1 
                  monkey-1.6.9 | 1 
                   mpd-0.21.22 | 1 
                    mpv-0.29.1 | 1 
                   pcre2-10.34 | 1 
               protobuf-3.11.4 | 1 
                  rygel-0.38.3 | 1 
              spandsp-20180108 | 1 
                  stella-6.1.1 | 1 
             xscreensaver-5.43 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/65e0344ecb12192b4b7e5d5db08fd5063e8b50ee |     
   xtensa    |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/b61517d98158c257f0aea3a98fcbf8f418d4ad66 |     
   xtensa    |          aespipe-2.4f          | NOK | http://autobuild.buildroot.net/results/e6c9b91596d3599884075e00b4ab915d1861bf9f | ORPH
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/494119848b2eebdb3913905e3bcc81dd08c2e3b4 |     
   mipsel    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/bedfb757cda51b7bce950a8eba778c0b2084e010 |     
  mips64el   |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/a74772aad03d245c11658fe6965ed147ecf1263a |     
    i686     |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/5beb7454a3d02f7f6063d5ca8c3ac84ef5365cf9 |     
    m68k     |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/56d1e6affa5a54806e3ad58d1cc642ff2183cbde |     
microblazeel |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/63cef6ec792b281db8d0e681ba9b97a6dee0e177 |     
    arm      |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/b1359ebf7afc3d4e09c7d2a5bb235382ff15b529 |     
  riscv64    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/55dd485905dda2621c5a34bdf75e44a7a249e91e |     
  powerpc    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/07f16fc7566710ca5d049b5d3b88aa986c300fdc |     
powerpc64le  |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/533ea98e0dc675401dcded45849ea2a4642161bf |     
  riscv32    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/94732afd8e161ac41f9c996eecc6da95ccd1744b |     
    i586     |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/3ab069ee338f33344c8e9780b0fd436b656e2d96 |     
    arc      |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/4ec447db134f80b5f231950bde27cb127fd81526 |     
    i586     |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/b416be243f1338ca06e13d56829eef0b8756866b |     
  sparc64    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/3146df5ad75d927e9ca58599fb34320fe4d53fe8 |     
  riscv32    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/cfcdef090030190f915732be82cbad310125f346 |     
    or1k     |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/e5f9faf936b10327200e46be24e830482888ce4a |     
   mipsel    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/ea64fdafe99c54f3c15a7065999826049a3fdbb6 |     
    sh4      |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/d2d85e29aa4838e24af4d96e605033988a2c29f1 |     
  aarch64    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/625f079b5f03de427e23fdd462b85cdf3755d215 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/edf98a389352acac039a873cd25939b4fdd02741 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/890b9196e31f729102bdd446bc7184cdd9654b65 |     
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/12e66a2b2013707e4224bc742f66af7840deffde | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c02fecd8f4ad4166f85974b49c42365b122c1653 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2a5f8f50cdb0960a30bae33a3b1a414c3fa3908f | ORPH
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/9791a6f0daa291a36ecbb5152173a6d3366f1433 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/90b5be0a0271888f372be81c1b5c9e01a463b1a2 |     
   xtensa    |         busybox-1.31.1         | NOK | http://autobuild.buildroot.net/results/672a0b9f0e1af71b14aaacc09b02953e59a0d7f1 |     
    i686     |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/a3074ad76051e125171498390ddeb8cee3447a45 | ORPH
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/1d8a888f1da48611227b7099678d97d8b1e0e57c |     
   mipsel    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/8a319191dbf4bb09cf69e0e8d6f8e3d3151b1f1b |     
    mips     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/5c5d71fde80a4f2f027085bdb0fae9fb76ab9d32 |     
    m68k     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/667409f1d44a3f9be43aaff3f9a3426fe1386de2 |     
 powerpc64   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/c8e673e1d57a4210701ea7bd69ffd69fd333483c |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/e43519a18cf2cab513c1cb4609fff0f95c29b964 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/142e79bfe96f17d7dd3bc842b443ab294d07977d |     
  aarch64    |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/c08efff174d4773074e6cf3374228b48e057917b | ORPH
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/8167c6a1556f3baf80ccea2026f57652d4ad31bd |     
 aarch64_be  |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/3afaaee21362ace62be1066ca083efd9b4e5015a |     
    sh4      |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/f09d847f4c2e1ac3a7b0afb769473cb8d078d557 |     
    arm      |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/b41821c339c630b2012ef809cb10db3e3e8d3955 | ORPH
   mipsel    |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/4cd30e26c0ab36a6fc0d8ee6fc2e1cbbe5b9b73f |     
    arm      |    gst1-plugins-ugly-1.16.2    | NOK | http://autobuild.buildroot.net/results/8b9d7a361423d6dc24ee9e2795b0e9a9a9f3fc01 |     
    i686     |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/ddd99feb6b33f52368a2dcda2d19a7226fb082a4 |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/2167100331cc302c14fb4398088c8fefda2eafc7 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/055f903d9e3121986200e5397bc112a5b1c0267f |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/52547b1984ec3c85159e497ca0d38be77e1dce9b |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c17a89928a03a6e9fc73a48445519f2132f9dcf7 |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2ad73a5fdca4db11697f7320ac69facf1bf4fc4a |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/f4756b3792d6f2ee493b39d3284cf88da5ebf281 |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/8e9179c73c047dc10850e2163e231fdc01448402 |     
  mips64el   |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/3cda7c7f65847a794173812934e8073e70aedc57 |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/244b678e1ac5198f98dc5d25b3727fea6ffa4d1f |     
  riscv32    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/0877c95acf74aea6bf6e6362fc3a2d78854a5f71 |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/3443b039908ae9bca5bd9cd33c0be8ba956dbe49 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/53578fb0ccc59cbd50f45968b32a812379dc6a58 |     
   nios2     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d703dd91b5b8f098649104e2cf9ed11faa204cc2 |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/1b7e93ddc18dcc0f341c6401d80d78b161c5aa57 |     
  sparc64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/44d55ed08a359ea97ba8515e53eb2e3b8b6d56fc |     
    sh4      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/b27ee17980c82d971d149f8538ff1c553c44ddab |     
   mipsel    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/0125858c499d57a4fcc54a8bae53dca1ecab5d90 |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/875fc94eb83be495bdb2bded9cc0e925e4f1fa4f |     
   nios2     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/6360b324c2c7a1c432e7243070ce9eac50dc011e |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/6f557154690f24c860a470054f3b1eb641a40305 |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/4b8a0ba065f7c918a77f7e25ae879bea7516fa1d |     
  mips64el   |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d12ffd9de2964d18ada44e5aade115db2dca7ce5 |     
  aarch64    |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/6701a7f58758f781dc3297d3acc04251f2e95287 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/d21023cab2293c31963fba114734e90c4912862f | ORPH
   xtensa    |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/76ecca00bfc3a496095d7c2fea12b42b3d020d71 |     
   xtensa    |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/6ee2d118f80aca1c7fd9b50a98e58106c99dc4dd |     
   xtensa    |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/489e58835f0dd4aa2ee48b2c664bba96d8760d51 |     
microblazeel |     libspatialindex-1.9.3      | NOK | http://autobuild.buildroot.net/results/e4ad8fdeafce9d4a07d5554d98dfcb2fa5c05568 |     
  powerpc    |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/a2d376ef993d8936f8c1dc40ff373d5692fa408a | ORPH
    sh4      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/cd84bd7f784e449af9e1127e0abc984d583398b6 | ORPH
  aarch64    |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/c6adf3ebfd14f6937e8547b9218811cee9053d4c | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/2cafc9752860b2be093201adc56be3a74cb8f430 | ORPH
microblazeel |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/b7041c5257cd4c2ebb3995a79d470c83142109c1 | ORPH
   x86_64    |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/e3711b2511631ad16b45924d0e71160aa909aa75 | ORPH
microblazeel |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/323ff4310d94e8528f47e553dffac856dc5a75f5 | ORPH
  mips64el   |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/3911f911746259309453c99a4ddca60006625d35 | ORPH
    m68k     |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/04c335422c0948453c2ee517616b7b8954f440cd | ORPH
    i686     |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/5eb9d244f5051f5eacb23a22d679d704351ec198 | ORPH
    sh4      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/86ab2a6990ee184e68471e3c3e9093f8ccec34ac | ORPH
   x86_64    |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/fab98971582f339c63297b96889cbac91959b074 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/e155f31104e1107578cb84c4fd3fbfeba3039641 | ORPH
    i586     |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/762a233d271a8c35e0db9a63bc433a6a09017ce7 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/d794c9d6d4c638f3f219dc3e1d7efca473d2475b | ORPH
    arc      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/28973f5a6c730f2d88abc330cc1ce248cee1f07b | ORPH
 aarch64_be  |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/d8cdc539b88896419953960b4fbef16ad7f53c11 | ORPH
   x86_64    |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/eceebc2f798e4dd94fb7f407b03903c53a63f492 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/b19f3cfa38b5850a271ecfd36547c9619df4402c | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/0030c903abf6c964806a97067af94a99867a3896 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/6a464b803e2ccb04a3f65f23d2158f6f836c1b84 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/29a393fcf06ba0ad9dd69cdfb680357f62ae2007 | ORPH
  powerpc    |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/4200d45b225b41b2e29bff3fab10833ed936f508 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/3f8474f5a7cd17046ea0f3cebe3e96f8fe72bc05 | ORPH
  riscv64    |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/8beda3ba627091655af15bce5e3ec563c6433484 | ORPH
  mips64el   |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/9cfdeba16399b06aeec4f5ef82ff7479ae3e8a4e | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/ee640d74745e21701abf3ee6e20126e663af5bd8 | ORPH
    arc      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/72d421f4d91840b156f400db2788ad78c0f4ce5f | ORPH
   mipsel    |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/6e00347b47b50372ad5c57e92e82146154b4c3a9 | ORPH
    sh4      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/512dcae7ec08c5303766c96edd522419eebe09ea | ORPH
   mipsel    |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/39331dbf0ec03abb28612ba007ba60468eb1f39a | ORPH
  aarch64    |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/257c7e4d4d34d24e2a8b3db6401777977b7378a5 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/98dcd18e9cbb61471b9341d9846dc27797724fbf | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/9b4369c57f3d578db8235f8066efa5139e40112c | ORPH
    sh4      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/c0758c5efde6b00f9e486d055f1450aae26b141f | ORPH
    or1k     |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/ac0bb0bcda6ad0400eedac78c9cc4610e1e867e2 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/b12e747db5606367a625dee90e3bbdb68857fbed | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/4c46999dbcb41a8b8ca9d4825532a8259fe7f2d2 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/94fdc63221b3bae21a2ead571297a90df95a4be7 | ORPH
  mips64el   |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/676ff98fe4f4fa794b904e3ed0c521f7f306a7ed | ORPH
powerpc64le  |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/72818b4679a2afe645af196b823165e246a567a1 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/91bfe08c3852e89fb9a37384c6ac98c4d922d44a | ORPH
  riscv64    |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/a1d3b42549b751be76e15e1aae26fb97d8cc6fe8 | ORPH
  powerpc    |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/e953e442a4fc4b7255fb87c9527307e1f97f1d32 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/b4c34e2cd13da5ce47157c9d905033a4b22c50dd | ORPH
  mips64el   |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/3d76044bbf55dee0f6ce16f37f52749e04dde188 | ORPH
    sh4      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/56e6f54fd7824c427d5595f438570e8e3a402fa5 | ORPH
  aarch64    |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/dff0ac65d16d8dc94bc18253b397c026cb80883d | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/383e3cba56894df0e3dd53bfe9cee3f4bb80d412 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/ee4aea103cfaa7e0a7bade4d1a9ae5d524b3f821 | ORPH
   nios2     |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/e8ab4e6ea8a40e99bcbce9e5839942982fc4e9e0 | ORPH
   mipsel    |        libuhttpd-3.1.4         | NOK | http://autobuild.buildroot.net/results/ce7c69ceac3390f6d22f777e4cf908188486c6b7 |     
    i586     |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/b975782147f34624324a7592c628080132e545f9 |     
    arm      |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/aa6d9ba8ecd03176a4d1450ba87a66f41dd60f69 |     
   x86_64    |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/aab7fc1200a5825c1c3e2e71f791f906a19cac1a |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/13a31de853697c441acd28d7c4b47f6f34c576cd |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/4d12e2c5eb9da424248da1392ab9580f0ee38455 |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/0a0c92984208b4b45030c1c25080e2d541f668e0 | ORPH
    arm      |          mpd-0.21.22           | NOK | http://autobuild.buildroot.net/results/b27f17f7960c5d524e0673a11e5b45a7e9c8a915 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/3f6906fb5a9560a57652049c3240805e05c90819 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/43b83cdf2ad65e63d78c886728398b98e643f252 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/3b1d075db1d1e49bbb5248058b9f1baf6f4edec1 |     
  mips64el   |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/c69f91d701171bfdf8f5a32dac204dd555eed91a |     
  powerpc    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/58b5e43d7b62799ed9e4010b08af12e59b4bb97b |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/385a090c67593f001261293542ad87f95c78b2f9 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/1a63a9c9505f35abdd2ff91ba77b6a8d77798261 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/fbe57a1602fed331ddff3ff3560dce02573816ff |     
  riscv64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/e8d79a3b5d6ede36ccc83a007f5baf5dc5f88432 |     
   mipsel    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/71f216adf818ce16613a3182e950d6900a2fd312 |     
    arc      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/bd8e9ed7c5967f701522f77a79af7814f6393265 |     
  powerpc    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/a98da0af3d282c297e2992541ace876d57a9bfef |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/4beb96d43180813906578b42875a1c3d4a905ed7 |     
    sh4      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/b29f4cd1f161935bff10b2bfc9b7f415e23e1dca |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/5273c4c71edfc7c05447dfee21b399c7b9273cc4 |     
   xtensa    |          pcre2-10.34           | NOK | http://autobuild.buildroot.net/results/ebbab3474ce99562391208d4712462aa7976a050 | ORPH
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/338a690a8b66489f7606d22334e21e29df255f1d |     
  riscv32    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/5ec7cc584b2f43d6de5bd7a8df27a1e0eaf511c9 |     
    m68k     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/a3b4f046d36f8c21d5cf3f892349351e18ade679 |     
    arc      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/96aa5669635f9a173baa667ecfbb06fa5f02efdd |     
   xtensa    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/087058c04c325b42dd41224897d6dacbdbe0c1ff |     
   mipsel    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/0ba005e4dfe19095d33203dab9f10eb5ee2beb07 |     
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/54d334821deda8348fbb08873bcda4ca1b1e7623 |     
   nios2     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/e9a3964ce9d82a1593be09a920236f6c2606db30 |     
    arc      |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/7e686a3195909a8907f80e8f248fba2cb8591024 |     
microblazeel |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/e09b6a02bd08dee767af56b414346351d4582b02 |     
 powerpc64   |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/a50d296678db0727422fc253cf7ce5256a533d0f |     
  powerpc    |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/719ff889b31f9d0c40134a15572fe9887b8e9284 |     
    arc      |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/77ada0b61e85b9c51d02e136525d7588ad5670ce |     
    arc      |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/f291ede8b3664edd62907a122832e1a355f0c8d9 |     
    arm      |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/396e511aa5c85af1d44f4d1449c98d5163b967a6 |     
    arm      |   python-mbstrdecoder-1.0.0    | NOK | http://autobuild.buildroot.net/results/0594c43918fcbada0ca56eabad51adc11ac87ce9 |     
  riscv64    |   python-mbstrdecoder-1.0.0    | NOK | http://autobuild.buildroot.net/results/ed509316d2e6682e08c3b91dc23d9c6fcf5e0ce4 |     
   nios2     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/babeefc955c6796a90e5a16941fe11587da35c72 |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/bd536110b93bbab5bef848f88c97978705593ef2 |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/b5ab5cd0055dc763badad6e817f05fd2ccc9303d |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/6b9faef9375636f5afeed52860249446e28b5fdf |     
 aarch64_be  |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/3545774258babc3584f69e7d523efdf7fff1acb5 |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/6bd4b062617a391aa385b55f575b79a41e0e54d7 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/8d06126246ae968784c2b789f92edcd48738f381 |     
    mips     |          stella-6.1.1          | NOK | http://autobuild.buildroot.net/results/a40f19b8abf18a89a63d465ba539c4c4ccf920d3 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a7c3119f2e7bb0d7f08a2cb8e2436ef62d9c26e9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/927d0d703c0135d5e37d1ff175f056d85c0b8e75 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/2d14a3d07e61f42ca7360b8f23133df2903f0ded |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/40dce85069f7c7c8e9ea82a14f2acce431bc7a47 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/5a848ed35b79331f5592151d7673f0ec4bfbfcff |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/630a0a1fa9e0c8ccf55b91e7870a563b9a6b05ed |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/3cef026200ee5c3975b0c579a8cb4866fbff2111 |     
  mips64el   |       xscreensaver-5.43        | NOK | http://autobuild.buildroot.net/results/759c7eba946382660177a70495b7881d6d2146df |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/b410d4be0f7733dadab63936e3163d69b618993b |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/d803b422232f137aa1f721f2580429d1fd05efb5 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                  boinc-7.16.3 | 3 
gr-osmosdr-46698a67e7e06419... | 2 
 glslsandbox-player-2019.08.23 | 1 
                 gnutls-3.6.13 | 1 
              host-grpc-1.25.0 | 1 
jq-a97638713ad30653d424f136... | 1 
             kismet-2016-07-R1 | 1 
               libtheora-1.1.1 | 1 
               log4cplus-2.0.5 | 1 
                   mpd-0.21.19 | 1 
                  ndisc6-1.0.4 | 1 
               qt5webkit-5.9.1 | 1 
                 rocksdb-6.6.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          boinc-7.16.3          | NOK | http://autobuild.buildroot.net/results/cf8b5c2ea7ffaefad5b66c0c0b07cdf65ec567b2 |     
    arc      |          boinc-7.16.3          | NOK | http://autobuild.buildroot.net/results/7af1cec19eaafddc4b7c6a266bc02a0879fdad8f |     
    i586     |          boinc-7.16.3          | NOK | http://autobuild.buildroot.net/results/91f2d7895eb292f163813bb5edadec3fb1f0a5b0 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/80e6e772a6fd9193e414ddc240a09ad6df4bf7a2 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/f9dcd9c716c5e5e79b48ad40905de1c85720b8e4 |     
    arm      | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/b38703c690e1785432f09568dc6ae65e7d796d33 |     
   sparc     | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/c42ce513c886080be3779c8bf3834f9ce168e429 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/364fb97721a745b28d027e6d22f26f3cd2033c57 |     
    m68k     | jq-a97638713ad30653d424f136... | NOK | http://autobuild.buildroot.net/results/5c4608be7039d178d503390a16b91fff479a7fcf |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/034a9ad11f12e219b51eb4c424e4b3b511a21266 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/ec8a8c3f58bd7f79f3216bc042d7b53c4310d1ef | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/e8becfc21709b8ce4cac9727bc131629c6ea2b37 |     
   xtensa    |          mpd-0.21.19           | NOK | http://autobuild.buildroot.net/results/f75ffd27358a7e941073d87c5c8dab6ccf237cce |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/5294f6a03be74e58a5983afd569add882845424a | ORPH
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/ddf16f30f11f94aa5c789a1447545b8c5ed9c8ba |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/17a262099e7141b5a510625b1933921c768e59e8 |     



-- 
http://autobuild.buildroot.net
