From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Feb 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-17
Message-ID: <20160218073022.5F8C9102442@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-17
===============================

        success : 199
       failures : 82 
       timeouts : 2  
          TOTAL : 283

Classification of failures by reason
====================================

                      qt-4.8.7 | 7 
                numactl-2.0.11 | 5 
               pax-utils-1.1.4 | 5 
                 mesa3d-11.1.1 | 4 
iputils-c8ff6feaf0442f8efd9... | 4 
                  boost-1.60.0 | 3 
                  cairo-1.14.4 | 3 
                  connman-1.31 | 3 
                   fio-fio-2.6 | 2 
                    ruby-2.3.0 | 2 
                    sox-14.4.2 | 2 
canfestival-7740ac6fdedc23e... | 2 
                   qhull-7.2.0 | 2 
                   erlang-17.5 | 2 
                    cups-2.1.2 | 2 
               libupnpp-0.13.1 | 1 
             bluez5_utils-5.37 | 1 
               trousers-0.3.13 | 1 
              host-erlang-17.5 | 1 
               ipmitool-1.8.15 | 1 
qjson-ba273682a9d33a7b3090e... | 1 
            gst-ffmpeg-0.10.13 | 1 
                  lshw-B.02.17 | 1 
          chocolate-doom-2.2.1 | 1 
               host-efl-1.15.3 | 1 
                    mosh-1.2.5 | 1 
               libgtk2-2.24.29 | 1 
                  trinity-v1.6 | 1 
             lttng-tools-2.7.1 | 1 
                 libraw-0.17.1 | 1 
                  psmisc-22.21 | 1 
                 rtptools-1.20 | 1 
                 lvm2-2.02.138 | 1 
             netbsd-queue-1.70 | 1 
                 setools-3.3.8 | 1 
                mono-4.2.1.102 | 1 
             ipsec-tools-0.8.2 | 1 
make[2]: *** [code/CMakeFil... | 1 
                moarvm-2016.01 | 1 
                  fbterm-1.7.0 | 1 
                grantlee-0.5.1 | 1 
               nfs-utils-1.3.3 | 1 
                 gnuplot-4.6.6 | 1 
                minidlna-1.1.5 | 1 
                sqlite-3100200 | 1 
                   tor-0.2.7.6 | 1 
               libcap-ng-0.7.4 | 1 
     host-google-breakpad-1373 | 1 
flann-04b4a56533faf8c8228d0... | 1 
make[3]: *** [sub-plugins-m... | 1 
                 qt5base-5.5.1 | 1 

Detail of failures
===================

     sparc64 |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/13b6ea491db8b973c25f1e458d404b5e0eabff14/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d049fbf08b78b46e4c4f59cef70b23b706a25032/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2c1a326f187d496d43ad35818de800009341c637/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/450d6e50398ac1a0c6f1905d9ff280e587802b81/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/e41a075b1a3b42a12e3ddfdcc916e8e29840403b/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/1f7af0158fb41ec02857e37c7c4b3ec9e36e10ee/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/d87af409c14ebf0ad17f441831b52c9d7626d628/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/7ddcecb79dd8b58150ca40f73422449ee0bce638/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/c1ebf0b8d5d5aa64111e155a5d3e1c241d6c99cd/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/c780a8f3828037fef2db3880dbec8c85eba2d3cf/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/c98bd87d30970812c4e0737682d3391d246c5fe9/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/59765e462786b3a76b4cc4be4768aa9a8bbb5cc2/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/5de0fa41a5027f1ef41cd829833156e690f92ed2/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/fb046134886c6f01f8022b9629fd6d00b8f83f40/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/cee81d9f931c25a96b65bdfadbdd74fdd89753a0/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/6c5865bc775c47329d563aa7e695c78f4e67a664/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/db5d6d76ef5a4321baffe18011212e6098fd540f/
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/a602d61e68f662217ad868de79711a8ea892a3a9/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/382c2553ce36801bee9ca2a5f023a797b7401af8/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/9c88412590934bbe4573d605742f51615d73297a/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/e6d6bf0377953fd3b47ce3f8929bd9f8e370093a/
         arm |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/c7c4e02fef6dbeab1ddff9b477cc24cad4a48c28/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/85a2ae8b7050efafcefebad59f14ec13fe0e90fb/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/d2c47fe22174d334ac2510786132f350a956ce50/
         arc |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/2f08f56dee46fa25455c614001621645235492f6/
      x86_64 |               host-erlang-17.5 | NOK | http://autobuild.buildroot.net/results/f464d37dc0699e4539b62fa35601294985f98881/
         arm |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/871ddf236498d5b52703b22a2471db10ddf338bb/
      x86_64 |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/5d9c25a013508ace684ca2c6ddbe694f51faf411/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/c544db729bd33e8a6f8e6aa1ce5ed1f9b53d0adc/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/329640b03b0fc1618dc52a9bd8d0e81ba80b3e5c/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/e158b72825d4eadb243db413753e7d01048bde55/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/8b23495ef8ea2417a56b12f052d5dc53ffbeec1c/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/050b35b9bf977e4f37eb8991c26b6946d4078f7d/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/9e8ab6efe54c5d77ca169c40652977bf04b3d582/
     powerpc |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/5ab61e1c8a1a742b4daf91448f55f0baa3c196ae/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/4f3b29672c38678ee77f74aa943f4d2c2f8de12e/
         arm |                libupnpp-0.13.1 | NOK | http://autobuild.buildroot.net/results/6057526f2f1a8998d1a383b52ab050049b71d9bc/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/da8917798ed89c635eac2dc4f96f74c32ce9dae0/
         arm |              lttng-tools-2.7.1 | NOK | http://autobuild.buildroot.net/results/40f11afb0512a89dcdad332d28ff1c5fcc435e7f/
         arm |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/69869999a83709845bf9ca99fa414f592f1aded2/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/b20ac96e3ec2655c24db015f42821c68d6fe2358/
microblazeel | make[3]: *** [sub-plugins-m... | TIM | http://autobuild.buildroot.net/results/e82920f472019ed783cac9826a63119a81d3ab25/
microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/996f74d79ea8924f7e686b6967236062df1f3599/
microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/9714197924ccf539dc4838ded6285a96b100edd3/
microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/424d8b1e1171c4f06af6e895b5a7beac583f00f8/
        mips |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/c0da4741d8ac30799756c79b573b18f666b5f0c1/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/b3540660590531124ac16bddd377e8c3edca321e/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/0e320551bf90d8b58ba92ac8bbf48a37018cc19d/
       sparc |                 mono-4.2.1.102 | NOK | http://autobuild.buildroot.net/results/4a01c7dcb3898a3f43cc955b1fc7e733db51e7a2/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/af73a6d22a63b63b3e60bbf0e358ece5b10c713c/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/0fb0afb0e4b3741e3e3c082083afaf466b917f07/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/b25251be0183ca28f610300a72ea0928769cda2c/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/75cb01bd43f491918333830ffcfb976bc29c0840/
    mips64el |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/062fe2f2efc81ac69552131a2de1e30c3ef182fa/
    mips64el |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/175433d2a0e92fbf1c4a524d6e181f34555ff8bb/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/f74b804165f77d4de43ba938678f4efd031e00f2/
      mipsel |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/9d031504fec65073aa1ff2f03f5d15f60c9c5477/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/e2c5a929e237834d3fe1af6e173e1253735b27f2/
        i686 |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/02d336b033b7b641d68dac93bde5a046b9d6ac93/
        i686 |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/d0445a1d1ae198ff3e907eee4e0dacceab80cad0/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/39b37fab8f11954439c588387487afbc220d666e/
        i686 |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/0fa42c3ef8e3c56afaefdb22b1940568f483fd6a/
      mipsel |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/57a98070cfa67ff3a5791510ac54aa790936125c/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/65e5f478a5eaa520868e230c063340965b784789/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/d87dde89580097cf50909bba49817ce5cfe2d7f9/
         arm | qjson-ba273682a9d33a7b3090e... | NOK | http://autobuild.buildroot.net/results/aba963afea9be4411c90396b2a6e2ffb2451fc37/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ea40422cb921068c4d00d67e5c93f03d14f34f7d/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7eae5350dba58ac986fc5b3704c3905677b92b2a/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/391e379c2941aae46bf04eedfd616df5f62d44f6/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c73d0902440c43e55374d5866a46571dc94dcb76/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/80f88ed7026f540409fa9a5f2c59dedce070d3cd/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/212483351b12f151097b684aa5420cb9beb01cfc/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ca8d22e9d63aa06fa253786460b27e25062b6cb1/
       nios2 |                  qt5base-5.5.1 | NOK | http://autobuild.buildroot.net/results/3474f90073bb3ff4aa6c26c585f4a2d532721d94/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/a3af93e937a9eb46ad93072f01ef7a8265731d56/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/992da7d2899e5a597f130b36180ddae13cd3ecf9/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/3dc08d7159ac6a946e7bb0fbd8e07a45e525240c/
    mips64el |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/5b84e7e80054c307ae62b09c59928092d63543c0/
      mipsel |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/567d1377b0971f33f204ccd393d3bd34979272d8/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/4adf11e8bade5e42386eaddc47fd05e1e4d6c3d8/
         arm |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/acee0abd91ce9518d6837b1b5c42bd376479ec2c/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/c7caf5532fa41086e048f62d47d8adff5caa5c1b/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/7dc15b983cd9fb3cd44878a98f8e417ec17c746f/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/553dde6e44e387f43d0f8b5dcf2b8aa995afeea2/


-- 
http://autobuild.buildroot.net
