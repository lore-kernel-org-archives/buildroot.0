From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Aug 2015 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-29
Message-ID: <20150830063014.91451101CAD@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-29
===============================

        success : 312
       failures : 41 
       timeouts : 0  
          TOTAL : 353

Classification of failures by reason
====================================

                    ustr-1.0.4 | 4 
rpi-userland-b834074d0c0d9d... | 2 
                mongrel2-1.9.2 | 2 
           qt5multimedia-5.5.0 | 2 
                   bdwgc-7.4.2 | 2 
                coreutils-8.24 | 1 
                 setools-3.3.8 | 1 
                   erlang-17.5 | 1 
               polarssl-1.2.14 | 1 
                  apitrace-7.0 | 1 
                  cppcms-1.0.4 | 1 
                 mplayer-1.1.1 | 1 
                busybox-1.23.2 | 1 
              libethumb-1.7.10 | 1 
               libcap-ng-0.7.4 | 1 
canfestival-7740ac6fdedc23e... | 1 
              lm-sensors-3.3.5 | 1 
                dbus-cpp-0.9.0 | 1 
              quagga-0.99.24.1 | 1 
             lttng-tools-2.6.0 | 1 
             bluez_utils-4.101 | 1 
                  gamin-0.1.10 | 1 
                    vpnc-0.5.3 | 1 
              cryptsetup-1.6.7 | 1 
               iptables-1.4.21 | 1 
               curlftpfs-0.9.2 | 1 
                openntpd-5.7p4 | 1 
  xdriver_xf86-video-ati-7.5.0 | 1 
             alsa-utils-1.0.29 | 1 
                  mono-4.0.2.5 | 1 
                libnspr-4.10.8 | 1 
               bootutils-1.0.0 | 1 
                 qt5base-5.5.0 | 1 
                grantlee-0.5.1 | 1 

Detail of failures
===================

        i686 |              alsa-utils-1.0.29 | NOK | http://autobuild.buildroot.net/results/307bc9236e328e3ef256019496c873e902c11965/
     powerpc |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/12e745c7165fad6ba7b194f420ec49097d78e759/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/98afa951f071d5a6cf93a19f9c5af2a118b98f4f/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/0d9b1227568274aefeae0f6cd0c811b4fae684b2/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/1935c3eeecec6166913ccbd4088d2197182954ea/
      x86_64 |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/38914a0a7ff0aa79acbbbe6c46ab701325dfceb8/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/85b6d91c9da8fca521be8d836a9e70b6e9aa1bae/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/d4af5a5a9f14dc52e9c2741ec26d20a4c9e3a478/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/a4e194e32c34c598eec11b866b50bce12bae952d/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/12a093b4388f191d53c0a2475b1525d2e2b6401d/
         arm |               cryptsetup-1.6.7 | NOK | http://autobuild.buildroot.net/results/001d516c537617fd3ef0b3f3d4fbffb4e6fcacda/
         arm |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/bc68ed77a7c0d8824664881018c12eede56e0ea1/
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/e738fba539ba76b442092c0d5135a026c1742ed8/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/4ea00dd5976b54219b2e4d73fe5e5e3dc97699d5/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/a5ec0d0342b72fb2d3718ad91f7e741c1f527509/
        i686 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/52a90c3bda8bcbf490fae7a280b62509b77802b6/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/97db2bcd54e103d915ce7910130877465dbaf378/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/01b5fc446eec7ebb86088bba411a422a1808d31d/
         arm |               libethumb-1.7.10 | NOK | http://autobuild.buildroot.net/results/f2232d16a4e157b5a10e55e223eb9cf61968c3d9/
         arm |                 libnspr-4.10.8 | NOK | http://autobuild.buildroot.net/results/c756f82dfc49611fa3f650d9cf2a71b59d23c3d0/
      x86_64 |               lm-sensors-3.3.5 | NOK | http://autobuild.buildroot.net/results/f72ae17cea910a1dbd3d5d4d09cfbc90d9ba8dc0/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/ebebe62e59c14d15b68155c42341ced7ff21fe61/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/57db70ac15be3855430fa3edf2cbc61a26856a13/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/69a509f24d196b6012f3fadfb03a5da67ac32ed5/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/5419f78f45f91a97f11ab46badf16cbd9afe2290/
         sh4 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/84c6360c26e42f772014a8f1d89582556e2cf6f6/
     powerpc |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/4bc9052cc36b07f4009dfa70d265668ff711a833/
         arm |                polarssl-1.2.14 | NOK | http://autobuild.buildroot.net/results/d992d7d044570433a9a06e96ef082131737e7c75/
    mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/026821f19824a1d528c3bf0ca9132316c32c7d8c/
         arc |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/4d9778d1342660a58505e69a2a2de0b3c7de493e/
         arm |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/c00f931139157f8aa4274ab7f82772f07d3a53a5/
         arm |               quagga-0.99.24.1 | NOK | http://autobuild.buildroot.net/results/bb6bfae0b4e26b9454794b8d3562ce0c32d71e77/
         arm | rpi-userland-b834074d0c0d9d... | NOK | http://autobuild.buildroot.net/results/92bc697ce9da02e4e0e32372a3aca6b93bd1bc7e/
         arm | rpi-userland-b834074d0c0d9d... | NOK | http://autobuild.buildroot.net/results/06c9094896b24b58b04bfc9d8a7cbb003e03cc20/
         arm |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/6843a5bfd9bf36b9d14dec4403d3de38fcc74614/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/fcf39cae6fdaa6001ddd0a6757eaeac4a04344dc/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/e767bf472e6ae8fb27cf57ab1882501c1eaf4d9a/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/fe4dd5099d0baf3108e6a10f000b6a6d6f6857ef/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/d0b91841160b7d47bf9839a052b369eae65555df/
      xtensa |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/bf76eac98f53a8b5cbf70f589ea04eff0e2384b9/
     powerpc |   xdriver_xf86-video-ati-7.5.0 | NOK | http://autobuild.buildroot.net/results/441b30b6899cca67b2c70fd3195f4be2c8a037b4/


-- 
http://autobuild.buildroot.net
