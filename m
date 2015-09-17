From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Sep 2015 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-16
Message-ID: <20150917063012.AB908101DE7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-16
===============================

        success : 222
       failures : 36 
       timeouts : 0  
          TOTAL : 258

Classification of failures by reason
====================================

                directfb-1.7.7 | 4 
canfestival-7740ac6fdedc23e... | 3 
             bluez_utils-4.101 | 3 
                  apitrace-7.0 | 2 
                busybox-1.23.2 | 2 
                  boost-1.58.0 | 2 
                   httping-2.4 | 1 
                  libssh-0.7.1 | 1 
rpi-userland-b864a841e5a459... | 1 
                pulseaudio-5.0 | 1 
             irda-utils-0.9.18 | 1 
             lttng-tools-2.6.0 | 1 
             ebtables-2.0.10-4 | 1 
                      make-4.1 | 1 
                 dropwatch-1.4 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
                mongrel2-1.9.2 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                   erlang-17.5 | 1 
                 fio-fio-2.1.4 | 1 
sconeserver-3b886c3dda6eda3... | 1 
                 gnupg2-2.0.29 | 1 
                  dos2unix-7.3 | 1 
           qt5multimedia-5.5.0 | 1 
                iproute2-4.2.0 | 1 
                 sudo-1.8.14p3 | 1 

Detail of failures
===================

     aarch64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/ff345c097740581fc4e8dec53ec2ddaf962fe555/
     powerpc |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/e3fb1da388d8f0d77b17d99c5640acd1968f9da6/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/bf605ec1888e4e25d116dc047badc14dd36132a6/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/2f946e56683565012f6f89a70f47379fa902708f/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/b30b8ff069755d3d3194037edd24436e38f4922d/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/ca0a17ffb709fe33e8c600dc2efe4182f4abd63a/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/aae425a1a68edc03022e50fd1683faf09196237b/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/09a26a617929d56f083ec9f48035065d939c4698/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/154142009cc6d31f06b6dd0cbb06be84886d4ab6/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/862c0d3b98871b450475907450261bc23fdb6986/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/211edeb9dc2c68e193e09559c985236b35b8de3d/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/e32454a4f25a1f29e93fdc15a69317bf1d022ff0/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/d4a07254fe48338a0988712214db4dd4662823f5/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/6eeab6bcaa6e71ba3f8d1d3db1525650c7f6a04d/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/209841ed08cabc088ae39c9764893be95ffc274f/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/065dccfc3a738ea4d9296e341f628841ec08485f/
         sh4 |                   dos2unix-7.3 | NOK | http://autobuild.buildroot.net/results/aaf2b77f964eb6259e2e4b1d5a13838c3a1eef21/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/fb5c8215e7bebef1a3486dfdc14a3fe518244f75/
      x86_64 |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/c3a2cf73beaef4480917a88810e97956f9a89253/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/ad87c5dd2ffc5d2aadfe2984cf8fbb21ba12b7a2/
      x86_64 | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/a648185148de9e486dfe37c89439547088379625/
      x86_64 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/41794e876d31cca5061a428d38ba1ff9d195e323/
         arm |                  gnupg2-2.0.29 | NOK | http://autobuild.buildroot.net/results/507e178268dfaa161fd219ef6d2b02e55d9d07c1/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/aea34b8325ffbe19e1e72c2b5cd14ebbdfea34c1/
      x86_64 |                    httping-2.4 | NOK | http://autobuild.buildroot.net/results/ede5ee3316ea2b6790dcb930a6bc71adc8922bfc/
         arm |                 iproute2-4.2.0 | NOK | http://autobuild.buildroot.net/results/a6ca926f19b1ca4ecef654cedeaf2e6c8c8c32af/
         arm |              irda-utils-0.9.18 | NOK | http://autobuild.buildroot.net/results/91e66d6510094d317f371878489180fcbd61f1c5/
      xtensa |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/ec534a0a29299e8c128d557127fea53427c8ad6f/
        i686 |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/9352fc78c52fadf7057408a5fd53ffb75bd0eabb/
         arm |                       make-4.1 | NOK | http://autobuild.buildroot.net/results/8143ae0afac139845e5016058d85c800dc8527ad/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/a5854195227a68f697c048f8007403db8140b75e/
      x86_64 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/0e0438df4a5c8e2dc406bbaf3e4de0425578634d/
      x86_64 |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/49235a26b3fa7cf30c1165a39bbc13e858feba23/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/f6ccc32ce87a7768be44c3a187a878c8ab542632/
         arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/6060706e76481213a1848e0d694b01f6d37e6155/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/123a5b3f72ba8c1a4aa1cea5b7b846a04fd4e923/


-- 
http://autobuild.buildroot.net
