From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Jun 2019 06:00:47 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-15
Message-ID: <20190616060056.035B687812@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-15
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  16 |   0 |   0 |  16 |
   2019.05.x |  21 |   1 |   0 |  22 |
      master | 183 |  41 |   1 | 225 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/8179178c17a56fa80e95a372933c39d9206ff924 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          modem-manager-1.10.0 | 13
               libglib2-2.60.3 | 10
                   cups-2.2.10 | 3 
              qt5enginio-1.6.3 | 3 
               wireshark-3.0.2 | 3 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
/home/dawncrow/buildroot-te... | 1 
fs/tar/tar.mk:32: /data/bui... | 1 
             host-cargo-0.26.0 | 1 
           host-mfgtools-v0.02 | 1 
           host-nodejs-10.15.3 | 1 
               libgtk3-3.22.30 | 1 
        network-manager-1.18.0 | 1 
                       opencv3 | 1 


Detail of failures
------------------

         arm | /home/dawncrow/buildroot-te... | NOK | http://autobuild.buildroot.net/results/5fd4a52ddb6d407d1d0033022b6eb63e7ce2f775 |     
     sparc64 |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/0803c57ec236b5a667b983fe6e2096f426b5ff01 |     
     aarch64 |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/4494292a5e89cca401f95a99f23bea52a414a2a5 |     
 powerpc64le |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/96e27bb8bc2222cf1bf0f19872313c321c0fae08 |     
      x86_64 | fs/tar/tar.mk:32: /data/bui... | NOK | http://autobuild.buildroot.net/results/d092188e5216e2462a6d38861a8e82228bb83480 |     
     powerpc |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/272391797edbd6964a6c91c54c56edc6b02eb78a |     
         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/916001508c8effaa8b31e29342033241a0910a22 |     
         arm |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/218d148e4bfe0b98e1b2cda77fda7f1458cf615a |     
    mips64el |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/280a6abdea30a0034a0854ee08b8a7bc0a998663 |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/3dd94f504ba0edbd694b2b024a1705160176ea6c |     
    mips64el |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/a95531d8c7dc60e1a0274651943c5bab426f06ab |     
      x86_64 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/bf449f2a4dadad348fdcca72862c19b59836b404 |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/4f34b5f4db4f09b1c0a4eea4c01cdf963f17981e |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/d360e09d5c9a8704f0ebe4ee4f2a7b95aa64735e |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/ab64091f32abd0bcde34bdb3c0cb874d26ca040b |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/c4b419a88057fd86ab89fc9e222406fa5186c54f |     
         sh4 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/3954b45f44e77e8dd519087803d12aed4864137f |     
        m68k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/c248c810442b6bcd85522efa311de68da9075cb8 |     
     powerpc |                libgtk3-3.22.30 | NOK | http://autobuild.buildroot.net/results/cff52d34095620590131230f3c9127ad26743f01 |     
         arc |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/f5a8b51fe7370066ad1395804008e40a915c08c9 |     
         arm |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/8c25954158fcee22da98c6c420528449b598be14 |     
     powerpc |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/6b1ad34e22a55abb5aa24ba746089acd532576c5 |     
    mips64el |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/cf6881fa029faae034c820e5f2cfb6e0dbe9fc89 |     
    mips64el |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/42a418f426a6882001762b36c33caffde3a12bcd |     
     aarch64 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/fe6778f912f64bbaca4e80addd2a832b19eef7c7 |     
       nios2 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/5e06e6c6e87cbab9dd7569bba803e81ad798ee6f |     
      mipsel |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/86662796da659aaca298afa9f9be2fdc4eb567f4 |     
        or1k |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/19b792908548dd4a47803c66de27e6946c79b0db |     
      x86_64 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/5d3e6449887b4cdbfbc0ddc672fa374896cfb102 |     
         arm |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/829a08b396585fcc9b9da54724474f2a704f6d84 |     
         sh4 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/a60c410ecd1086f6715e6292a32a498cc3f161d6 |     
     aarch64 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/2dd7067135290bb1b0c5c97084ea9e3b04549547 |     
       nios2 |         network-manager-1.18.0 | NOK | http://autobuild.buildroot.net/results/edf4fbee7f1a416cd04c6df4590cb07cdebedf12 | ORPH
         sh4 |                        opencv3 | TIM | http://autobuild.buildroot.net/results/429762b679fb029aea0fb9d634bf4fe7a82e05ab |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/983b1919f22d78138ceef7484ca1ecb7a25ddf39 |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/abfbe8479755d5c2db8bcf28bdc872c33b3992de |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/453bef64114bc05d5523b3520b72996ace59ae09 |     
     riscv32 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/dc0df6591c075060a1589e48124460ffdd2e6e63 |     
        mips |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/2757db46e2b1a4efe4c839fc84d5feca7f64721a |     
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/e570101e7e77075ccb783026112b1512630b4fed | ORPH
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/305543014614de498c418eca8dea89cb038ead69 | ORPH
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/940c49ef5ddb384e9d07da5a9a7acbe627b0e5e2 | ORPH


-- 
http://autobuild.buildroot.net
