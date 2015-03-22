From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Mar 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-21
Message-ID: <20150322073020.7F1A2101694@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-21
===============================

        success : 196
       failures : 76 
       timeouts : 4  
          TOTAL : 276

Classification of failures by reason
====================================

                  powertop-2.7 | 24
                  dhcpcd-6.7.1 | 7 
                 jsoncpp-1.6.0 | 5 
                collectd-5.4.2 | 4 
freerdp-b21ff842ef3de583751... | 4 
tvheadend-7006b9fd88ce0cf54... | 3 
                    fftw-3.3.4 | 3 
pulseview-19be0af16af83ca10... | 2 
               libecore-1.7.10 | 2 
                numactl-2.0.10 | 2 
                     vlc-2.1.6 | 2 
                  snmppp-3.3.4 | 2 
              host-perl-5.20.2 | 2 
                  boost-1.57.0 | 2 
                host-ola-0.9.4 | 1 
                    wine-1.6.2 | 1 
                 python3-3.4.2 | 1 
      host-gdb-arc-2014.12-gdb | 1 
                     gpsd-3.11 | 1 
                 gnuplot-4.6.6 | 1 
                  python-2.7.9 | 1 
              host-mono-3.12.0 | 1 
                 apache-2.4.12 | 1 
                libtirpc-0.2.4 | 1 
                  fbterm-1.7.0 | 1 
             host-thrift-0.9.2 | 1 
            gst-ffmpeg-0.10.13 | 1 
                 ipkg-0.99.163 | 1 
                host-gdb-7.7.1 | 1 
               qt5webkit-5.4.1 | 1 

Detail of failures
===================

       nios2 |                  apache-2.4.12 | NOK | http://autobuild.buildroot.net/results/1dec866cf9a5f731a9ed93dff5b8b98001863635/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/3f95fb3c6ee5e13e9b311237ab9bc6bb0d61e90d/
      xtensa |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/90c0e0afd5d41e3396f542f25bba2f25d879c3ef/
         arm |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/890b67ff5e39fd91464b2a47477e82f83b403238/
      xtensa |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/fec8dba6cb0dbeba3899849ce074e2cd031a63ee/
         arm |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/caa80923675e2437d761819c04d28a174c1bdcb8/
         sh4 |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/24ce9287aca9495047c63417eb5f3cc1243eadc5/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/33a822fb33e1d1e7401a7ce2f390a0851ee81b22/
         arc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/fa029cdbd0b265918dc9401478b9646067616d66/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/72c3903168f12241330d51d42e2ed2112561a0fa/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/02aed997d6a07b66605d35a70987d72bcd048894/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/05461330996c278112f46b044193c141369e2679/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/1d98d9dc15e9fa0b87546692ef44864807b61abe/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/caeacae6b9c69e2708ccaef506bba5e09954403f/
      xtensa |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/cca2756a289285c37ea4a17cd67802484901c905/
     powerpc |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/af4a4b7e85734ed49e157253f5777e4f2620bdfe/
        bfin |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/bc4b2e166c5c1cdd492ae4ae89667ae102629156/
        bfin |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/4cb8704dbb18526800027b97b4106ddc7c629ffd/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/24c017c18bd5ed479d5c2718792f7214606179fe/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/1b61d7699df4af6fb3fde7d3e0dc925676be301e/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/29a93720f1c1dc8c9c7df7b1d3d0cdeaae28bafe/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/7d4d1bb635a89cca981cf9f7371a65f5de6e727e/
        bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/cb289efbceb0eb65d8e87d7b81901323f14935b4/
      mipsel |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/da2024c839167835ed0c7673f281b6b1cf1b7d27/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/fabd6afbee7abb525d09cebcc1eb613d7e81bcf2/
         arm |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/ee7106ffaf9f06ae7dac8d47cc4988b2fec772e2/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/3665969b179ed73928de4a468750a182a1b07393/
         arm |               host-mono-3.12.0 | TIM | http://autobuild.buildroot.net/results/1cbe1dda01642e9484ddd13e2e77f3c71f1cecab/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/c3fb5baef15f25d8d5b562df1f92d70838a04f34/
      xtensa |               host-perl-5.20.2 | TIM | http://autobuild.buildroot.net/results/3d4caa8749d994fa7b9605b62d058a773cef47ec/
     powerpc |               host-perl-5.20.2 | TIM | http://autobuild.buildroot.net/results/747d4577dfef23c5cfcbf07b3c0bfe7375e66fe2/
    mips64el |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/929f064cf53a53c8814ae939d48372081d73a0f1/
         arm |                  ipkg-0.99.163 | NOK | http://autobuild.buildroot.net/results/8f1624f8308534594bc8795c7b2ce672993facdc/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/549d581ec7bf150123ed8c39d0cc4d3107021067/
      mipsel |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/06c6fca04b69af55641f6272cc5821e46202859a/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/13ca4fd97e32d6df781e4a43b5beef06566fe954/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/cad9383f871d4e33d5323467d7cf7d4158c020ff/
      mipsel |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/4f2dcb96516252f45cb6950348665138956ec81c/
     powerpc |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/4d264803c7624e7e2c5b00c1087981b48297340b/
        i686 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/3b54a6d570ea510c249debcea8c385454540af28/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/7670740f2dc10915644c4a907469fac738235b7a/
    mips64el |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/303c091e7f64d7cf0f6e6659eb660db9e3459e86/
        i686 |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/f4f03e2f1ec37bfe6f1940f9486a106ee06a7532/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/3ab3f9f49201d25b2e4304c65eb95a9436dd3b09/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/153390b5274fca4a0afa7f3459831272114f9f5e/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/cd49ccd4b680976d69e78d52a7455b9599065ab0/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/446a2b7b8b1c751e64ea57406f4b1032dbf6af24/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/ff4aa5e07fa6493f92d512f578344756a5c9da9b/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/df77e91a9d0771705e20fb239927d547eb035b6a/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/5d718ad4f50010a5e96d46c767b30afdfdf2de26/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/155cb4584c916d354b8febad474a58fde81369af/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/bbee23f7ffbc9bd2b687ba473832dca7c1a48437/
        i686 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/0c7254e11f8ecb5e36061e6ef482ded8386dc75b/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/e58efe55958b00ab07125d5bff85e229fe35c414/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/58e76577b90881bb42108c40a733c1efa6cd018b/
         sh4 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/df10d77f03d5452bff698f28519138d3d6f7ddc6/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/df55a874c4895a0565253f346e28154c88d3e42c/
         sh4 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/108f172f433e9b0e51fca267bbb6586aa5fb3f27/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/3777c8e285b3fda37c68f5eec11ba1ddda529475/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/338a438983b266e124e4664ff0c0e2f6cf8a3933/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/8b3d3419fa1ee1487a24b7fce7e478c8074575e3/
        i486 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/6536b49fe71716df248ec1e3d40748093a4e13f0/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/80892c9cbddf622c2145f7f57f0d89a57b626a45/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/0b3bc9b6960d7b36d6c57421a3dc49c9aad256f2/
microblazeel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/15546b5a6782494f6b9f1ad332dd890123fbae8d/
      xtensa |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/e06a51050d24698edb3ff888720b509c1b01a9cf/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/6dd73df639bbdecf6f1135bec0503efbb2a87133/
        i686 | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/2203527029ff39a49a2bc0509c6eb8bf08264c26/
    mips64el | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/13b746bd5ecf7ccb595da5a92c0f45b68b2ba0f3/
         sh4 |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/4016b1adcf82051dfc929dda76b573d16a7f6e2b/
        i686 |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/715c0f939c5d796e8509b92dfec43d893f38f0cc/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/e86a57dbbc1ee514775bbd99564cd1d52efca22e/
      mipsel |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/a36c49937a92a4778c9cad069fd8ea152524def4/
         arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/ae699787618eb5b525662663e58e36078c618a7c/
     powerpc | tvheadend-7006b9fd88ce0cf54... | NOK | http://autobuild.buildroot.net/results/e860e501f904d94bbab6a765aad4d19947135513/
         arm | tvheadend-7006b9fd88ce0cf54... | NOK | http://autobuild.buildroot.net/results/37abb5d2ec62ac59897d019e6ca85c8eb0e69786/
       nios2 | tvheadend-7006b9fd88ce0cf54... | NOK | http://autobuild.buildroot.net/results/a55ab4fc34bebda14236d6a0efe893aa75374ed2/
        mips |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/e6d3051171d26832147f6259bcf64f104c0084e7/
        i686 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/6f027182cb1bb22af3eeb6cd0c9772e3ad3c8ade/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/e9f3c0980e32fdd091e5b68d0ff8b3ca96e41701/


-- 
http://autobuild.buildroot.net
