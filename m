From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Jan 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-09
Message-ID: <20160110073022.4D41E101BCF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-09
===============================

        success : 232
       failures : 80 
       timeouts : 3  
          TOTAL : 315

Classification of failures by reason
====================================

                  libffi-3.2.1 | 9 
                   assimp-v3.2 | 8 
host-vboot-utils-bbdd62f9b0... | 7 
                python-nfc-212 | 6 
                  boost-1.60.0 | 6 
                      qt-4.8.7 | 5 
                  ffmpeg-2.8.4 | 3 
                 opencv3-3.0.0 | 2 
               libcap-ng-0.7.4 | 2 
            gst-ffmpeg-0.10.13 | 2 
              gst1-libav-1.6.2 | 2 
                       unknown | 2 
                bind-9.10.3-P2 | 2 
             host-gauche-0.9.4 | 1 
                iptables-1.6.0 | 1 
                 gnuplot-4.6.6 | 1 
 make[1]: *** [all] Terminated | 1 
                 setools-3.3.8 | 1 
               dvbsnoop-1.4.50 | 1 
          sane-backends-1.0.25 | 1 
               qt5webkit-5.5.0 | 1 
                   erlang-17.5 | 1 
                 libdrm-2.4.65 | 1 
               nfs-utils-1.3.3 | 1 
                 dropwatch-1.4 | 1 
make[2]: *** wait: No child... | 1 
                pinentry-0.9.4 | 1 
         qt5connectivity-5.5.0 | 1 
 toolchain-external-legal-info | 1 
              strongswan-5.3.5 | 1 
                 opencv-2.4.10 | 1 
                    ruby-2.3.0 | 1 
               trousers-0.3.13 | 1 
                  prboom-2.5.0 | 1 
             webkitgtk24-2.4.9 | 1 
                    vpnc-0.5.3 | 1 
make[2]: *** [code/CMakeFil... | 1 
                 mesa3d-11.1.0 | 1 
         xdotool-v3.20150503.1 | 1 
                   libnss-3.21 | 1 

Detail of failures
===================

       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/0737eea1c909efc1bbb24ab778703537ecb01ac4/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/d30df3d7d8ab64720c5c25d1e16a63dde379230f/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/90590a8c85ad590c9cdb5466cde6e0ddfdeea84c/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/ac610021edceb6f13675889832aef74cfe16650c/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/485fb99cb5e598455cae1d0260c63ba5c176d293/
        mips |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/fffe5166237816337df44ef8516a2fe802b29a9a/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/9e6f31905a2d2b7ab0b215552d53c318afa26acc/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/5381efeda40671a4669076c00ada605eb33e3737/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/c1989f9650a6b09f2291fac9ead233e98df6cb85/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/b4b67ec13caa310e26f31bf71747b2930c2007c7/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0d8c0d498591d7a327174988555653ed822a1f70/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f3126fdcdac8af99ffbb3cc15563463f898d17a5/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/074c89bdeed2c95dcdb8ab2b31888d3a71e0d451/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b6525e64ae86c8f30c5624efda72a53e72306de9/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fb16e196bbf55d6fa62220002c194041c9067e0e/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/951a1e2466e988fd6821a11beae3ccf21c8cf8e1/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/e01699c3ce80eedd6b9151ed2cd8d57907ab8637/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/7f38226a113f107916de67e68bf88695fad8979f/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/8b151343fcfc42260d6cfee315204900c12567af/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/8c9569ec546815d5846d35f08c46f7147303a99c/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/8ae19fece069d9f7b0013f910ec980925843ac26/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/a38e2825477d52e8a4f5c2b579e0963bb98182df/
        bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/ed5e08c45cdd704d6aacb0c08211de63d7ae00d9/
      mipsel |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/d79017df1232df681e1caab896009e9e77a30f55/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/c7bf0f0921c3ec9d76dedb1026d405e94ac9bf95/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/6c93fd2498b3f53f1e5cad7f396346932a2a59e9/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/334e8eadd34274713fd2a76538be2aa2ea79da7a/
         arm |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/3364275896f109b4ad9c9feedb91752516ce43bb/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/8097e4d4bf9e4ba069261ac6eef086bcee7d536e/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/d04ea024243a7258e018a9fc2ead3bd724d0e4a0/
        sh4a | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/8792cc2996da81285c23642c32965145c389e6f5/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1908d01817b9966a0b230bbfa606e1c3ab3e2d4d/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/842fe19b9465c0f7e61ae2dd58780a2476ac2e92/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/2922964a69d07a026188c2f6e4b1c3500c6089d3/
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/0a6cf110eb4c5e552d81d78bbb05c7b986e70d72/
        bfin |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/b7cadee7f3fd295bb4f4694caa57a40919e863eb/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/037d07c19726d50542d5036e5f1b894eb772eb2d/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/7819e5f314c54982eb87e3280bf6d93063aa1d95/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/fc295f47338a7b72b0fd3be067e3364d50300702/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/57d2676476b078f0760fc092b9175e97db263905/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/0c89fc35c87e19bc4f0400d61fb74f1ff9a5757a/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/92ce74f02fe5f827691dabd99a077130d1107bbc/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/72bf5371de75dd7a5562aa171b5f2f963b1afe3f/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/bd50a4503607b5f5bf97e83787e648392ec54926/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c953d2ad189834651af7eb375e36583e440111b4/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/7ca3233b4a2db9c58a5339a42dc7d2c11f9966e7/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4b43d5155968b43d6bba43165781b311df5df3d3/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/0bf8ce15fe512e0eb222c290cdf54831054098d8/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/b8451b0f675e4e5a4d6f2e852a5d19ee575ce6b9/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/108be17aa7935107607f0901287d5bf49b203a8e/
         arm | make[2]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/df2851a198d3ebcfcfb9582a348ca61680791fae/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/5adf62c19f96e21879a4c831c750aabe3ecbf0b4/
microblazeel |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/f4047df2ef143f82e0063fcf96b63b8685d16459/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/554e7e20ef60d4b3b9bd8496fe297b6a5b06f6ca/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/377fbbef30d305de85194b30de6e6845e749bba2/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/85dfa229f0fe717c5fccdedfadd2a7675c9bf571/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/a245813889f693355ef7420b542412e21dae353e/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/5b4a9b469973092fa52231baa05c2e9345a1a005/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/749da1b24874ab6d7dc3bbc9f280a7d92acb4d76/
       nios2 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/4052590edc8e0f1ba323643a86f2a2d63e5da9b6/
     powerpc |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/8546a94ab96153cc9e5794f907b9d50a06c5a267/
        i686 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/c631cadd3249b51ecc806e86d3002c61438b4676/
        i686 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/403dc629acf964834a916e8b45a7f4b4956d1510/
    mips64el |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/dfedeb4aac49708e0258f857e36eff73ea3f390d/
    mips64el |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/1b0bd9cd5d75a4bb70bce119caebd28ac7d8d54c/
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/174c6e47eb761f9897275b6fedff742ace2f3081/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/38b03cb3848f1f43767558fe9f4eb302314a9661/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6362444681c720cb97e56cc6b9bb96dbe1014c9c/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6923c772297af257436de46bb0320b88b77a3f8e/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/443669d985c55dbda66c6b507af02d171b0ed842/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/114c5630c854b66ee872f05af9d0ca0273f9ab88/
      mipsel |                qt5webkit-5.5.0 | NOK | http://autobuild.buildroot.net/results/47e7424a945b303f913061c0495a73697a617f42/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/9b7d5cdda2b6ea35f41bbf6519b13c0f4666ff3f/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/1ceedc45933a97f8503b7251e74c26b9b3cacb7b/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/6882df47089afff208f4340a1d20dcdee093c7b3/
         arm |               strongswan-5.3.5 | NOK | http://autobuild.buildroot.net/results/7f2786931d1919a96112ff89a99b51e118163e23/
     powerpc |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/913ee4ade1c7804b3e53ddbebc11ef76ffa59710/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/60459a6b3891590cc54d32288535ac95b8a75453/
         sh4 |                        unknown | NOK | http://autobuild.buildroot.net/results/411603672015b0075fc92965f2d5ec2a6732377a/
        bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/4914dbe2e5ebc9d792b2021618d13844f5d59d00/
         sh4 |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/172c98b4e51f18b3c1b4b3c48748b1582e6fbdd7/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/ce316d8f5a60ba1ca27c5a2c1ad46b5c05a18e40/
        bfin |          xdotool-v3.20150503.1 | NOK | http://autobuild.buildroot.net/results/e72f11e87603bc8c2846dc88e94e04a3b787c0b4/


-- 
http://autobuild.buildroot.net
