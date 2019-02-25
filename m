From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Feb 2019 07:00:32 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-24
Message-ID: <20190225070040.17F1E226A0@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-24
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   1 |   0 |  20 |
   2018.11.x |  27 |   2 |   0 |  29 |
      master | 140 | 107 |   3 | 250 |
        next |  60 |  25 |   1 |  86 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                 mplayer-1.3.0 | 1 


Detail of failures
------------------

 powerpc64le |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a80d47df4c5d92202dedba286359913e55d71853 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

            mesa3d-demos-8.4.0 | 1 
               runc-v1.0.0-rc6 | 1 


Detail of failures
------------------

     aarch64 |             mesa3d-demos-8.4.0 | NOK | http://autobuild.buildroot.net/results/d603a16be94de9e35d45d0d45b24e1f3fb728f6f |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/8fdb59fda92de3909b5779b6a83a5eaae397e2cc |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               ibrcommon-1.0.1 | 87
                gerbera-v1.3.0 | 3 
       gst-plugins-bad-0.10.23 | 3 
           host-cryptopp-8.0.0 | 3 
                       netsurf | 2 
                 qt5base-5.6.3 | 2 
               runc-v1.0.0-rc6 | 2 
                   glm-0.9.8.4 | 1 
                      gzip-1.9 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                  libssh-0.8.6 | 1 
                  linuxptp-2.0 | 1 
                          opus | 1 
                qt5base-5.11.3 | 1 
                   tor-0.3.5.8 | 1 


Detail of failures
------------------

       sparc |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/fa4deb01fd9b7e46577ddf30f96b85a5a32f9e5d |     
   powerpc64 |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/68a5d13348ca98c8a0cb082d69102676090913c5 |     
      x86_64 |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/7c4b01a232bf6bef82e0d1e11578c60ce12036df |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/222638ef588938924587a9d7547f01df7440d56e | ORPH
 powerpc64le |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/a56378b2e1a7fe0bc605129a993255ebe01f4341 | ORPH
     aarch64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/9111b2101784f756b9a897d2aebd6eb5ead91e95 | ORPH
       nios2 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/45c2a558037b608e310df09b3b46d08851e377e3 | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/b32cc792fb64b7c4009b7484b56f9e0765193ef3 | ORPH
         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/90b2f4d8fff570645181be30776a0cd2092910fa |     
         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/20676ad78cbc95e7cc1a90a0a6c2aff290c1d7b5 |     
         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/d65b0f3e439a09138dd5c217e895814b5abf0d5e |     
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/37ad96d2058a80f44e46baf161c86c51cecc7cc7 | ORPH
         arc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/ab1fc119583f8880a4952db970b5b46682947484 | ORPH
         arc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/1d867c24029b6684fd9c11a32c5f046aaa74100a | ORPH
         arc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/a8b5bbec904d87d8be000f50f6af2e2665803b77 | ORPH
     powerpc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/6e098b9b1b8bb0c36683bfae3b101b91d0658ced | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/6886419d2b0db7a23aaba63149fe888b6e2a66b4 | ORPH
    mips64el |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/00d9db54c6ef627f25f186fa2bbfc6fd3096f456 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/3e53defb11b8476d0f847e120d93e0d981d0c64e | ORPH
     sparc64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/d5c5305ea1279bc8ce7e53901410be008509cbe5 | ORPH
        m68k |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/05026ae321cff844d62739a219749d7266689137 | ORPH
         sh4 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/d2b1172d31be74680cb97934a432555c999118b6 | ORPH
microblazeel |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/72c3e605d424b6ce097733e48f5ca4e4dd098078 | ORPH
        i686 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/50eb642574860fe9ea1a55c2154de1088d72b176 | ORPH
    mips64el |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/f01a9c418aea95b86e1797293c7035af0defbbbc | ORPH
     powerpc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/db9e0e1e774a53b4094cd2af6ab58fa49da804f1 | ORPH
        mips |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/90d0f4f02d6edff23ff1f399d2b8012db3e8517c | ORPH
    mips64el |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/2e784747f7ca2e8b913be53fea7201c8c40e2a91 | ORPH
microblazeel |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/79443542ab2fb4a9e785805455d5d1fafe429eb1 | ORPH
     aarch64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/2bf21a8b0f11c1f6cd882a53b6f82b63c090de35 | ORPH
     powerpc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/97df8d044286b010e955d2ff46e510f705e2fc76 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/d4d5be25e399bc24074568408ec721e16111cfc2 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/61b6cdad82f19c3bbab6152c4a16b5b661db6d1d | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/8fbaca52304d08a1414d21a1cf13bb1aa7921191 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/8396197f3c9b852af83b6f4b53a5a9e4759e9fe7 | ORPH
     powerpc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/6b95870f19175f1adf2dc036d56a769a364e1157 | ORPH
      x86_64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/a683d8b0501bfab6654373508809459544138729 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/cef528c2bc97460c95065f23a38eb7641673a02e | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/04eb4d2a2e891acc16e7da58624bf8d960a37836 | ORPH
        or1k |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/2eb18556eca4551d4c3150eb22606c285e5f48ab | ORPH
      x86_64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/d07f155deb0575fe69ca605155e265553fe4fe57 | ORPH
     aarch64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/671cf8c95281c65e292ac8cf17aaa6a1be09265a | ORPH
     powerpc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/ca095bff4377d2ca454abdd86bcdf2ffb761404e | ORPH
         arc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/9518ca7aa56b01892760636a49d0e3a0bf7a1543 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/b30515461b327772b0b78edee5dd13f1111fd923 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/2bd742828cd893c07c659669ab33ae336d7fc5fe | ORPH
  aarch64_be |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/3a975bad2e41c90d52e49e5c76d01a5d1b40c2af | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/1d64399ba2b454f86bd1a52389ba3950733427f7 | ORPH
microblazeel |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/0c4ab41a28fc8b8d240a4491a8b56907524615ff | ORPH
         arc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/58f72281019fda8bc0f4f0ff8c175f42998cb5f0 | ORPH
    mips64el |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/30296fc3fd9b4178c054d445b3fde6edbc85f7b6 | ORPH
        m68k |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/9c39572ec57e1eb46e503936816878d44de4c6d2 | ORPH
      xtensa |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/f75ecdc8fdab57845f16704cbc9e8d15461fa066 | ORPH
      xtensa |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/bb5476be1f5ffd19a75c94a457fdae3e5aa99d71 | ORPH
     powerpc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/1c93aaf6bc98c7c56dcc27d7e1a126302a244307 | ORPH
         arc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/9376b1c3beda8b3d3a1100e9a97ff10ee2e37175 | ORPH
    mips64el |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/8cf2fc80152a9b3596d26693dfa8eca0e52f3fd3 | ORPH
     riscv64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/45741441dffe16178672cc50afae9e89d46c27dc | ORPH
    mips64el |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/6134e626bdc7748fa732dc6b398048cd722057ee | ORPH
       nios2 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/77227910cb426990d4fd6720475a4af78ee3ed85 | ORPH
    mips64el |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/8dbc90ff18b7fd67be2bb58acf26ecd1898d5b6d | ORPH
        or1k |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/e679fb3d2f91045f3d0fc1b175585e415eb7972e | ORPH
         arc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/5cf3fc05f83d1db6285fc34c14732fc9e2ef27be | ORPH
        m68k |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/322f6cc3a59fdfec6789ce0d4b63237595de3db3 | ORPH
   powerpc64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/33de3db316342f8e81cd91ce48272a4f9bee5cd6 | ORPH
         arc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/3825a8a92d841840bc3370c39bb84fd9d14e8924 | ORPH
    mips64el |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/2d436f084092ae933533789d64ebbf718ad628f9 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/e881667f388eea4cce2f804b373af4e3038e7b52 | ORPH
    mips64el |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/c765458fc984169bb259fee6acf01d9e2573abd1 | ORPH
        i586 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/3d799d39e334b39f8d99db93b2ca58d1edcc7ed8 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/65275dbd62858d88f253bf47d6ff42d64aca87fc | ORPH
        i686 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/f10ec2dcbae578fb1074e2ba35532a7e238576d1 | ORPH
     sparc64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/ac2df1b8521177113749e31a6973bdb6a0e64927 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/47a279b9eacb62a09bcf7bbf2ec6e5a6f45e83bc | ORPH
     riscv64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/c96b8564ee753263bae0f9bc2491276c40baa20f | ORPH
      mipsel |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/9292056088e2e7dd48ae59d8daa87e788bc5c4c2 | ORPH
         sh4 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/1235656e0a72303f304cfc94ad22ed6cecd663b5 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/5fa19cbe532881a4b16abd0401234b1da3495e6d | ORPH
      x86_64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/93384b37832d698b491529cd87ba977d37a1f43c | ORPH
         arc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/54942377a893089a16768ad5e510713ce13fae18 | ORPH
        i686 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/43ee95750b950a99e4f00a0f495a1ebb6faee09c | ORPH
      x86_64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/a4d92a22f63e13ef12d9dab5f336148f5001e888 | ORPH
 powerpc64le |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/99ffe80b3424cfca0ceecc1bee8a3609391e6dda | ORPH
     aarch64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/bfb1cf7958f9ee6d78253ff573a8cfc1aa7635dd | ORPH
      x86_64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/8ee01eb9bc6cbe54b3d15be4ee4ffc868d26b068 | ORPH
    mips64el |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/2859886bca5a21920f8e9a3f815e2f9bcf67cc70 | ORPH
        m68k |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/87550e4d875021f4f328a81b57c337058476aa6b | ORPH
      xtensa |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/72d38cf9e34e333b03c7dc7b4bbd381d28a35fd4 | ORPH
    mips64el |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/d5b5e18cb066b77ebb6edf347d0c64c429ba8e64 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/1bbff3c037b90b7f6689b6da6d98b7fd738a2f93 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/620a4e40842dfb0933cc6646a398a744e3bfd407 | ORPH
       sparc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/5707b2a739b3b6faac5d11aa2b7896c60af9baea | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/c138e658fe456f4c8e78f97d690e4b0bec39141e | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/279f727a2e166d2dd940f4a6a0175c16ffa537b3 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/4e1e1ffe654a9ceb16a4e6dccbb5f691c445d423 | ORPH
       nios2 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/703b3a104079b5d2f719e76999d6fb8b3e179226 | ORPH
         arc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/9669bdd4cbc3682933eaabdab89c0d9c74759b20 | ORPH
         sh4 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/9cb5acd9943d435efe307772a9a49031a168cbf2 | ORPH
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/90d4dfaee4e852de114624c52b9503323b03d79e |     
         arm |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/281cb7b940178e4fe98940ddeed07ad546b23931 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/0210894da49eac8398afc3ad53bcd9fd404365a1 |     
      xtensa |                        netsurf | TIM | http://autobuild.buildroot.net/results/0d7ee69bce19ecdecce7ca0f21c080463276b1fe |     
        mips |                        netsurf | TIM | http://autobuild.buildroot.net/results/6bee10db705e93662d1eefe437c2456142632ed7 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/183ce0e906dfb708a26ce7f5c0fd15d0accf1b20 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/5a2981630b04ec01f03fca50db362ac957e1ce07 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/c3ed34e8b6adbd8e79a0f6b72fd5f0edea2d6e24 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/fa8a37a72e480e10f96ce5bf95740d26b47b33ad |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/294006739b3df40dc35940e66eec55c45fe83f65 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/832581eca7ca8afeeae54ce807ae7e1e3cbe3e43 |     
microblazeel |                    tor-0.3.5.8 | NOK | http://autobuild.buildroot.net/results/5cf8f7accf9d7db11898fe7fbfdf64ecb2117f2d |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

            optee-client-3.4.0 | 6 
host-imx-mkimage-rel_imx_4.... | 5 
      host-uboot-tools-2019.01 | 3 
       gst-plugins-bad-0.10.23 | 2 
                 qt5base-5.6.3 | 2 
           uboot-tools-2019.01 | 2 
                 ibrdtnd-1.0.1 | 1 
                       netsurf | 1 
                   netsurf-3.8 | 1 
                    ofono-1.28 | 1 
                   tor-0.3.5.7 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

     riscv32 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/b92d7d9688a7f2232fd829158c641cbc840ede7c | ORPH
   powerpc64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/c6e8a38f69efa6bd58e5959c3ef6e78976caf525 | ORPH
        i686 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/99e0f834b1689185b35684106369ed2f94a99ca1 |     
      x86_64 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/5ff1edb53b7bdf78e29a79b8d3121b3d4460445d |     
         arc | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/7983cc6550e8302cc7f70f031b6f225758101bd8 |     
 powerpc64le | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/1b3c74c9dbdf75ca7cbe7c64f8ee8ba7799027de |     
      x86_64 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/a9919d1645769452dbfc3558018098f93acb6471 |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/c798d4659e5027d90b66c042303681fe5607772e |     
        or1k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3f72ea5359948568e8bdefcdcdb305066c59c548 |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/7e84920a7370044660ff6b61cd9472074d2aad51 |     
        m68k |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/06aeb43a23695dc816a1dc1bc012d41f930bb06c | ORPH
    mips64el |                        netsurf | TIM | http://autobuild.buildroot.net/results/e338fcdfd150ba9b63f46c6616f1d1ee977a657b |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/22f55e0692ee790ae0db115ea1b399bc4ef82506 |     
    mips64el |                     ofono-1.28 | NOK | http://autobuild.buildroot.net/results/9e14489c7d769175908b97ef666a8d36addb50bc |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/6de2366fdaf06ad7dc1e1c510f60de6579fa1b89 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/7412bb7c084087114e431144b3a868dc76281c7d |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/e797f8a90f5cd2c1306fe8d864a1b7b2f04ba8ff |     
     powerpc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/c14fc53f04499c9aefd4872f7e72e52030ea5924 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/47974bec92d5564f358017b74530864c4873982a |     
     powerpc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/5dd965a57697498560f537377040a47eb1c4b151 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/dc4998236585369ef7c2a5a14ceff2ca430d45e1 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/a652409c60cfe8623bf836d0a3ded1694bf8dd8e |     
         arm |                    tor-0.3.5.7 | NOK | http://autobuild.buildroot.net/results/8e55b939d6abbe7aa3a55083e4d3cae4bb2c8ba6 |     
     aarch64 |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/4ebde0c8617c26f88cf4ecae635c31e915ab2033 |     
microblazeel |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/ebbef1316e2422504db4e166940a347f8d823261 |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/9c99cefac4a1b17054e3c5bd73f6947b6ab87ba6 |     


-- 
http://autobuild.buildroot.net
