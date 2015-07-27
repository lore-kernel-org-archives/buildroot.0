From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-26
Message-ID: <20150727063018.97F39102C8B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-26
===============================

        success : 148
       failures : 116
       timeouts : 2  
          TOTAL : 266

Classification of failures by reason
====================================

                busybox-1.23.2 | 50
             libselinux-2.1.13 | 7 
                   audit-2.4.3 | 5 
                 qt5base-5.5.0 | 4 
filemq-482797b8aa30fcc9ea13... | 4 
                 empty-0.6.19b | 3 
                  snmppp-3.3.5 | 3 
                      atf-0.21 | 2 
                  ffmpeg-2.7.1 | 2 
           aircrack-ng-1.2-rc1 | 2 
                  cppcms-1.0.4 | 2 
       host-erlang-rebar-2.5.1 | 2 
libatomic_ops-libatomic_ops... | 2 
                 setools-3.3.8 | 2 
                   argus-3.0.8 | 2 
                 libebml-1.3.1 | 2 
                  mono-4.0.2.5 | 2 
                  midori-0.4.6 | 2 
                     rpm-5.2.0 | 1 
             exfat-utils-1.1.1 | 1 
                openntpd-5.7p4 | 1 
               libglib2-2.44.1 | 1 
                sysstat-11.0.5 | 1 
                  zeromq-4.0.5 | 1 
               libsigsegv-2.10 | 1 
                  bcusdk-0.0.5 | 1 
         qt5imageformats-5.5.0 | 1 
make: *** [qt5websockets-le... | 1 
           dmraid-1.0.0.rc16-3 | 1 
                  c-icap-0.3.5 | 1 
            gst-ffmpeg-0.10.13 | 1 
                cppunit-1.13.2 | 1 
                  boost-1.58.0 | 1 
             expect-2014-05-02 | 1 
                  opencv-3.0.0 | 1 
libsigrok-fe473123ba836445d... | 1 
               arptables-0.0.4 | 1 
          usb_modeswitch-2.2.5 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/4b6a853603f67b2a1f78b3d70cc3aec1b68ac7fd/
         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/989b8acdfb6aace4550cfc00d22207e025820545/
        i686 |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/d0098618963bb85af9c4bbb93ee7a3eccd21024d/
         arm |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/b105be80c37f21967ae03c4d0dbf1befc71744bb/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/621c0bd0f87e057a3c3f359caf4543fa15d3f898/
         arc |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/1761a0fa0453718f7f9f9c4e0d55a41bdeb6749b/
        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/e1382fa2efd3830521bed80dab623cdd9571b067/
         arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/2ef99894d6a965001a5c4f396b4dae631124d1a5/
         arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/53b088d3c00cf89a2cb19312356c740ff7499a44/
      x86_64 |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/dec14e32491cf72f8bf4b9709b8a1bcb9c535314/
        i686 |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/bfebaf2d8941385418cf7546a4dd512816c02f5d/
      x86_64 |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/d0aea621b8c6aac3f1b1f24cdb39fa338e4e27cf/
         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/b86b50e63bdc63c2a627a5a7e7127bd52756dd86/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/cf9fce72891855a0bc909b9394e323c2cc8d4d3d/
    mips64el |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/dc44604688a67d2424f4d1b4ca8f1b73245fa848/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/f5eb01bf206597f55fa0144c53cd3af93ac1f5c5/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/dd64a508fb748e8b12da6c4b5c95a072dd0dbda3/
    mips64el |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/78e3fe1fb479a5a8c1d4cc803e060df63d82864c/
         sh4 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/8fc098a8b24449634b2fe426b6360a2ac3d2227a/
     aarch64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/efcb83748548b1daa452188780ae3f6c3e7ea950/
         arc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/601095702adbd79543bd9ece732c88ebf47b7f75/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/aec2d03685426ace3fb7a4608a29910f294c0357/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/921853d53808ab360c140a6ed1b989248c18af19/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/ec651ccedb2308bb641127d2b4c0d132479a9900/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/d051db8e51ea45dd5a60bd7aa315807f06725a1a/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c68f1cfd235e536fbbe3e757b1af03b1484e41e6/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/fe4ec184ad7175d60254a130f1c26336109a1c31/
        mips |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/cb5b0aab9c6aa948f49196b1ef264fac47a43e33/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c5ba6813ecf98dcf111c41a3e36097003dd85d50/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/88d04db99ec4b34bfa83291a8111578ada7e512d/
    mips64el |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/83b3e131a9d3d5fdfa643224b14d9ac196bc926a/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/3450e264403978d9fbacced127b4491045d7be80/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/d7b3942b47e6c126ea29b0ed855abe4563d9aec0/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/3a1754fd52edf00fdc1d45d4ae8432b7c35117f1/
         sh4 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/dd685fc18d3c8fafdd3a9a9a2b0aaf3bff4f8c43/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/fd2c9b31a1d5a3a22deb9016005fe8bcf7897956/
        sh4a |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/66ba87fbebb0778844d941ec797e0e6cf048542e/
      mipsel |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/125a7edb9ec386e90edd02633ca3794269e20695/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/ab0782beab81cba503a83cc52c0a62aee8922738/
       nios2 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/4b0f830fe1d3351aca87927a85099aa76e84692f/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/a7927fdf497eaa1a6f71df74aeea5aa74bfdff4d/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/1d90b5382b5f63a54edaf87d04284f8b11c654d0/
      mipsel |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/5309b3140c523f0d188544fbf6baa12dea5f0d78/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/8381dc0df3c1cbe3c5f3377eddab616894f51905/
microblazeel |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/f0fd0c2fc2becd3829adfb5cdc33eaf7cd106f36/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/6d608162358b72b20832b02a9924131be3d9cf54/
      xtensa |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/512b6cc45c7a7a106819d5e0d48fc149a980df92/
      xtensa |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/09524c652f9bc5e261b832e556b8a9ef58dbbac3/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/5f656b575a889e896d5ac67b896b8d17068dffe0/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/51f1fbfd7dfe1de5803eb519a430e0fe75702d1a/
        i686 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/73572abb7c301cd9df4ddc08a015e731e3b262f5/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/3d7b109de71376a36b5c08e81158923a2dc7c9ff/
    mips64el |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c709bee884ec7c5af3aff5cfc96919466fc60698/
      mipsel |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/dfdb312222077018fdcffe86cf12e9a8ceb3c5a3/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/cb73b137fd0babb7b0a3aab74c56dd1879d3c7c0/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/5f6b0e98bd19b697f1d4b353b3d8224bc6c66881/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/086eebfa5454a8a67a884f1345f9852f08257d1b/
        mips |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/a538243f07fe1212e8ee35c9f45e3dc46c32cd6f/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/d1404da2501ecb06549d71b507c6afef410169c6/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/b5aff4920698b6e5f10067276eff1c5601fef0ba/
microblazeel |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/507e3d096e10191d387f6417d43f6e971bd23c7b/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/3e5504e0c84c20f3c10996f0085d197b31d7072f/
         sh4 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/8a087e1a5799314e0b8d8686a585e68b652c5d6b/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/d0dea12a48ab3b2a8643c579d4f614a0c2597bc8/
         arm |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/b0b679d95ee5b35d6bd340a49794c43768a9adc4/
         arc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/c71e0172e5c25865490d31b04074f7ce16aa99a8/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/065862ece7f3bea7f1d56eea834c35f33e9751d6/
         arc |                 cppunit-1.13.2 | NOK | http://autobuild.buildroot.net/results/d779ac18873c3859dc78b3b07798c8d2881e76c4/
       nios2 |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/a7e2631d06634d768faf5c1d02712cc9b38562c6/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/228270d0b5fceca95332a7ab93ed96ddee13f62b/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/eb3be602f4d01264518a56b13653f2bd9f415e94/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/fb78ec1f6443afcae1a39d2101de56ce94ab43e3/
         arm |              exfat-utils-1.1.1 | NOK | http://autobuild.buildroot.net/results/0efa0bdfd71e092f14099c4cfb76e8cacff464a9/
     powerpc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/a0611684879c2456adccdf2cde87e601e773622b/
        mips |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/666bb50e358a597a71acac15f9d84f31e9f70057/
      mipsel |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/fc31c196f9d4551b75104e23ce85b255b0c0e5bc/
         arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/f39c9cb43a5476987246124a56cb2532c4dcf8dd/
         arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/c273d924c51e0e06b5020d85303f346fc79282e3/
         arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/1564573385dedbf53633a5bb427a6f2e2f085f7e/
         arc | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/7246c0932e4dc7cef716485519d430432be12286/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/4ddc55ff527a4c8023af5a55c0130e60329e5ade/
      x86_64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/ceb8a7ddb9399fc3f33cfe1e2f646ec07e35cd7f/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/d4a274eddd24ebd74a5ff38a8f8b15221852a72c/
       sparc | libatomic_ops-libatomic_ops... | NOK | http://autobuild.buildroot.net/results/a689e7d277e8f732009dba5562f1e4f60aa20f67/
       sparc | libatomic_ops-libatomic_ops... | NOK | http://autobuild.buildroot.net/results/0adf3f1c0a0ccbd2436bae0babf704636490ec00/
     powerpc |                  libebml-1.3.1 | NOK | http://autobuild.buildroot.net/results/47734604c31516218c9c5d9ff8aa5c53b3e20b61/
     powerpc |                  libebml-1.3.1 | NOK | http://autobuild.buildroot.net/results/d0f94bab02f4e20c4a45dfb5ac481abba341c791/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/61a345c8bb6d8c85c3aefff7c1991d9d8df104ed/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/9e61a56c2a7e823ef9af6e8b209dcef1b4c2c0c1/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/ed4bb539738f05277d6ce5eb0c9a5e77605ece58/
      x86_64 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/d4d209719d1ce5219f84719ad72fcb6a0c684007/
      x86_64 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/1a65cc3d2c23a3c17c605788be62dbd18cbdaf76/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/07a6cccfc07f46620eb1afd66417eda4ace9cda7/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/1b5eebcdb3b7127ae2bc74011630a6f9c34cd7a6/
      x86_64 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/0d0e4713833182d0f634b9b39b2c56f2bc0adcac/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/724fea12e2d8cf10fab8deff9164416291c051ca/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/6771cfe4f25a0fd24624237d2b9bfe37cf553429/
         arm | make: *** [qt5websockets-le... | NOK | http://autobuild.buildroot.net/results/2ffe76af8382b4102a2bf76c80b6b65af5174a95/
         arm |                   midori-0.4.6 | NOK | http://autobuild.buildroot.net/results/6571b04609b170c42ef23a63a9e3d8ea1501e723/
        i686 |                   midori-0.4.6 | NOK | http://autobuild.buildroot.net/results/261522f17d0b78ad582cf5145ab05d8c3b05ba57/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/a0fc33a4ed90844f9529acc76a6ba183fe253771/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/faa85f868e4040cb5c52b9502e0427100f345773/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/76e4a3a7e34d2961c7626e54f6e2483da8d4bf0a/
     powerpc |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/0704a37621d2a091e033bdeb20c6196e3c5cf8bf/
      mipsel |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/a57b7035562a3fba1dfba9f7dd0320d654511fc7/
      x86_64 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/90b9de86719523c4b9d21be7a47df0f31725d218/
      mipsel |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/85af6876b5de63a0945362a624d50bd52611bbf9/
      xtensa |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/0245bc9d255c631799ed5b0ae034854a7f86e5b3/
     aarch64 |          qt5imageformats-5.5.0 | NOK | http://autobuild.buildroot.net/results/6f8cace33af02c8f6248d0e473c638dad37007b4/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/0a303cd1516c71ee0456317493fa0ce2425c0cc4/
     powerpc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/416bf51e97207e9e990d97f71b0c958af5aa245a/
     powerpc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/2587fd25f02963472cc022e66c869be19d2584ae/
         arc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/af8722e8b9378c2c115eb066c05510af26df0788/
         arc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/19dc9d320bafccea7874450dd6db39713191036d/
         arc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/827b996dbb925d0b55605330728bcba105ec948c/
         arm |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/67ac843ac4ac788a3f7d966a94e871b4355b7f2f/
        bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/869a0c4c2d78d613955e512a58d461f565ef354d/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/8b5e53d794f98c7371e1b4cd5d0abb48762d911e/


-- 
http://autobuild.buildroot.net
