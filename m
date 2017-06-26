From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jun 2017 08:31:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-25
Message-ID: <20170626063116.17C0B20872@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-25
================================

      successes : 100
       failures : 79 
       timeouts : 1  
          TOTAL : 180

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 25
knock-258a27e5a47809f97c2b9... | 10
linuxptp-97c351cafd7327fd28... | 5 
                  cppcms-1.0.5 | 4 
           host-doxygen-1.8.13 | 4 
                  cc-tool-0.26 | 3 
                 mesa3d-17.1.3 | 3 
                dbus-cpp-0.9.0 | 2 
              dieharder-3.31.1 | 2 
dropwatch-7c33d8a8ed105b07a... | 2 
                kvazaar-v1.1.0 | 2 
                 openvpn-2.4.3 | 2 
           python-pynacl-1.0.1 | 2 
       python-smbus-cffi-0.5.1 | 2 
                busybox-1.26.2 | 1 
                  bwm-ng-0.6.1 | 1 
                collectd-5.7.1 | 1 
                  ffmpeg-3.3.2 | 1 
               gnuradio-3.7.11 | 1 
                irrlicht-1.8.4 | 1 
make[7]: *** wait: No child... | 1 
                 sngrep-v1.4.3 | 1 
              syslog-ng-3.10.1 | 1 
               util-linux-2.30 | 1 
              webkitgtk-2.12.5 | 1 
                      x265-2.4 | 1 


Detail of failures
===================

         arc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/3c5fb827dd8dea30c2e6a64580198701d09dd9be | ORPH
         arm |                   bwm-ng-0.6.1 | NOK | http://autobuild.buildroot.net/results/66147c3db0656a540cf6f1da508571beaf4f455a |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/9e7395bf5265fcefc9b1c1fc821f8157a2d9e038 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/8c76ec08857746aba757818ec9922b082d81d238 |     
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/73213a1a38dfde1da1016e08173cf87328093f61 |     
         arm |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/3d624f5ecb885280ea71d25dcc28cbb6b4bae743 |     
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/94a4c2c0e1f2df36534ee06f2f836c2c21df277c | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/b12c53709cbe7df4c27d22de6ad0edd897244526 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/3c8b44718df156df5d214db2b75420e97dbaaee9 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/c0a85b8ef4afc723305bb17e33bab899e00f1202 | ORPH
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/36b015fa1e746c5d6e5ca16c71292a170d9a3637 |     
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/4aae26b9f0a9d5ba0779c89b8ac156ccef2e828e |     
         arm |               dieharder-3.31.1 | NOK | http://autobuild.buildroot.net/results/e02325e06866618d9d3ee90600dc3326465c56a1 |     
         arm |               dieharder-3.31.1 | NOK | http://autobuild.buildroot.net/results/c1db73dcb25ea1db4be0f9d6ce2bf2d02f5bd5bb |     
      x86_64 | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/e10259cf346cafd6c03acb818df26e5b899e92b5 |     
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/3cb9fd758b138e572c59c2df6e4fbd68e09e6bc6 |     
         arm |                   ffmpeg-3.3.2 | NOK | http://autobuild.buildroot.net/results/44d53e4c5d4570507c7e8856fb9dd0a477dcdf63 |     
       sparc |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/84d5f49798106eb6cda5bff6b2daa19a17da40a9 |     
     powerpc |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/f1a27119045d9676f49ace6a0447ce144c73a02c |     
         arm |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/c6ab20fe09d2019ed0f693a8d0c657e50ef13804 |     
     sparc64 |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/1c005180ae7843ef5beaa432d6edeb5244c3dbf1 |     
        mips |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/5b8d097942836b34fa169cf10a87ce613952ab1b |     
      mipsel |                 irrlicht-1.8.4 | NOK | http://autobuild.buildroot.net/results/c93ee8cdd063901ff23257aebac7e4d129ce389f |     
     powerpc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/2aa458a72e658f66655f9ff4a99bb9a309e321d3 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/c3799ee400e9033cca1d3edf17ad1f89b0cdf08a |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/85b56be6ea3cae044360e46c79d85a95b6979356 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/32cbb55243220d5177d5dd56fefc79b5a6557ac3 |     
      mipsel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/eb710dcb8758213d2023e37753e0660ac4c0d973 |     
      mipsel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/6e59b47e1222375e9197b714f656d4791061eb4b |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/06ebd6d68c60144e0a56548e9ff2b3cee97456cc |     
         sh4 | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/15bf410e65a83afabe1aab682b93d2b40ba67b78 |     
    mips64el | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/bb5c05ac02edc6d3c0ae20d3332da91685115ed0 |     
         sh4 | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/3ee44d58b0cd7d480165c54c86d8ed9d6232424c |     
        m68k |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/c032577802477a07df3e494e01fa868ae8bbbd94 |     
 powerpc64le |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/7a3f7129fee2df979ebac44fef3b5fb661aea209 |     
        mips | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/ba82f50cb80eee30e48ca550f60e0ada3741a93a |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/70d65fc700772240e745ddfce936a16fd63fc927 |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/efaa55d76f5210722613589ed4e61a964e2bdba9 |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/8c8f7b0947bc195f3ac64051d16045117b035c49 |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/664787704e779f9aebaea9d642ea5f4e5c99baa2 |     
microblazeel | make[7]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/e1bbb464550dd69664df626fe97175c0c12241b0 |     
      x86_64 |                  mesa3d-17.1.3 | NOK | http://autobuild.buildroot.net/results/99d87a2f3975c30127998b1bd0a2793a02ab1ad0 |     
         arc |                  mesa3d-17.1.3 | NOK | http://autobuild.buildroot.net/results/eddc2f83abb10317cfc491dea080d2d019493760 |     
   powerpc64 |                  mesa3d-17.1.3 | NOK | http://autobuild.buildroot.net/results/50be84bed8d4e78dfae1667abaf52e2469350de8 |     
       nios2 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/ee12a9cf676a2d8e04ad138b1d4ab9e6a53989ed |     
        i686 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/d2a6d4e36a43c52811ae8e934c2e0a15fa9393be |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/fb79e1d0fd74c65084e70e40a9c2cd4d9606fed2 |     
        or1k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d1d8bb7f6cd69fb457c2731df01dafec4ff3bd47 |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/584a5b909b84b187f2bffa8727aa02cb2807d1d2 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1705ca1036ac399f2b4cf5b34baa114c5ad27b4c |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f2574d6ef515b19e35c90c2e0f6e060cd175a861 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b29a18186ef9657a78a17d433e870d085f6a2d3d |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c852675ea76e644a94e0ef27ab2b98a6299c97d5 |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f41bb9334bec75e223ca6bfce351fa91ecebeaa9 |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/903b60f8656b1dfcc0eb61a177136ddd4cf95d4b |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/98203a0561850bdb866953631798f87f0609d71c |     
        i586 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a6e48bd17955e486e795c840e9fe2b80773a935a |     
 powerpc64le |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1cd3a0e314122099e8a7d2285d469630fdb09e63 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b183024c52d1a935946764b920daa8b569b4fd6a |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/767bea5988b5bca1b4c38c3c9762e8d1b1a2faff |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d510b806c2e94e56cc1c7d6baf463a4f7828b005 |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/54927d7921f333f0c352b64dd380dff302b72a09 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b9d4ce2d66ff4e1e748279cc4274e98ead32e096 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/839fae3dbb65854aed0fb9934eb40544ce622b54 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e8745feac2b66e82f421f94b5e5038e169da3d91 |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/230e78be24b92f45228fbb31a2aadaceab78c2de |     
microblazeel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/2023b2286b6fc73530d232cb93d6d65bdfb02bd8 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/71a87dcade8c96fbafa56055df4cb8846115e3e4 |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/34ac59df7b3b161a2eedb31673b584706d48c5d7 |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/575552f267aca99ddc1b190340fe790c8b38059a |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/308cfec3575cb7638ee1aca395a7efb1fd16b2ef |     
     sparc64 |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/27b7edbfb5d81bf71d01de3f0d1b67875bb6200c |     
    mips64el |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/777754e356f20a8426b74b9409b6bb19350e643e |     
         arm |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/e59a40c4d443270d1c09de96a51d041a232f690e |     
    mips64el |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/0e667d35f3748f0974fbba86dcd7ed54435f75f0 |     
        bfin |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/13ef4ef27dd7f40d7e745ca8694b60ae2696eeb6 |     
      x86_64 |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/e718aab76d41c9c1aa5f9e3e74fb48b63038f254 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/04411b7280dc51ecd51236967981a42352bbeb3e |     
         arm |               webkitgtk-2.12.5 | NOK | http://autobuild.buildroot.net/results/48c6aeee1a607e611494ba37f16193632155079a |     
 powerpc64le |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/42df603136b468919459e735e872619d4f52c0f1 |     

-- 
http://autobuild.buildroot.net
