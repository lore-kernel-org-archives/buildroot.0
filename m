From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Sep 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-10
Message-ID: <20150911063016.5BCE1100DED@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-10
===============================

        success : 223
       failures : 80 
       timeouts : 0  
          TOTAL : 303

Classification of failures by reason
====================================

                host-gdb-7.9.1 | 19
                 sudo-1.8.14p3 | 4 
libyuv-1ebf86795cb213a37f06... | 4 
                busybox-1.23.2 | 4 
                  mono-4.0.2.5 | 3 
             stress-ng-0.04.16 | 2 
canfestival-7740ac6fdedc23e... | 2 
             bluez_utils-4.101 | 2 
                   erlang-17.5 | 2 
            ibrdtn-tools-1.0.1 | 2 
                   bdwgc-7.4.2 | 2 
                 mesa3d-10.6.6 | 2 
                directfb-1.7.7 | 2 
                  guile-2.0.11 | 1 
           qt5multimedia-5.5.0 | 1 
     openvmtools-stable-9.10.2 | 1 
               dvbsnoop-1.4.50 | 1 
             e2fsprogs-1.42.13 | 1 
                dbus-cpp-0.9.0 | 1 
                harfbuzz-1.0.3 | 1 
                      qt-4.8.7 | 1 
                   opkg-v0.3.0 | 1 
               iptables-1.4.21 | 1 
                  samba4-4.2.3 | 1 
                     vlc-2.2.1 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
freerdp-770c67d340d5f0a7b48... | 1 
                    ruby-2.2.3 | 1 
                     gdb-7.9.1 | 1 
                  apitrace-7.0 | 1 
             ebtables-2.0.10-4 | 1 
             webkitgtk24-2.4.9 | 1 
                 libdrm-2.4.64 | 1 
                    ustr-1.0.4 | 1 
               libcap-ng-0.7.4 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
                ipmiutil-2.9.5 | 1 
              strongswan-5.3.3 | 1 
                 qt5base-5.5.0 | 1 
                openntpd-5.7p4 | 1 
          sane-backends-1.0.24 | 1 
                  ltris-1.0.19 | 1 
                    vtun-3.0.3 | 1 

Detail of failures
===================

     powerpc |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/4aba59b9e53d6a28423f729dca9a327562268cc4/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/a227e8840df491a3679e1899c855ce3c6a52d6d1/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/5f43dc75f7bc7e7972049299e8d00d64990294a6/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/0d2e02fed939cceb5d3406e55472f7ac0632b935/
      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/ff228760e499036086ae57ef0815058c1c53a8b3/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/335adb4dd86734e0e107a07028ffb9f90166ea1d/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/55a003ea9ccdbec3e79766d1a62197c1a7c858a2/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/869ae5c75640c404b7987d4c51e8baa4d1f37b03/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/38cf977d6e1b2d8fb78c6dfb547413bde184e5a8/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/e73c173e76aaac42060048e6a54815cb593bcf6e/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/d7690b251c18b3137352fca52f7f5a4d501d540f/
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/55d8d5e59f16b8abf85877d68a80c4859b1c427f/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/edef29da5b037f491ad4dcc7585a5b12f24d5adc/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/34513c6597bb6374d20d1bed8eb5a2aa2074adaf/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/be5abd37878539b30b058683a249d6b2162e7359/
         arm |              e2fsprogs-1.42.13 | NOK | http://autobuild.buildroot.net/results/eaec96f527b83b94e05e565b63aadd1a5dab135c/
      x86_64 |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/76cad3979062acaf17b5523a38c3fda5f63193c3/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/03198c3ff2296c8456770d846644d52ad6c8fdf0/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/05d9bfd60dd476d1d7375e4af3104210f26c0f34/
      x86_64 | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/a17ad9c19ee0321488d5393e2802fb58bac34c10/
      x86_64 | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/feeebd5c36e3ecccae50d96aa73489d5b0c068bf/
     powerpc |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/7636ac623533e12e3d01249ace3c5878efb7c87e/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/633aafd2c2ded9f467da04fb6ac1d501244818a6/
         arc |                 harfbuzz-1.0.3 | NOK | http://autobuild.buildroot.net/results/4a89dc32ca0a3eff6549319645d09bd4feb09348/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/fbc4b8f7b381f805744527b22165fc316de91062/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/10af42830c1120e55f2aecf3b69a4352fa622ec7/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/dc7101bd7910a3e1786faa4c7d13da3ef860c6c8/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/fa983a43bd5adac2f988b066b44fbf44316cd16f/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/c623ee5a0705e1f10c8f766a7f193ee264b5fc0d/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/a92e986423a5cd5c7664bfbcbd3c2f10b06ee368/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/171cd7552373933e061921296e7e53f993b93c29/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/fa08260da3babc64391777e3e28c0c1cd5aca69f/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/5774f1a07862975e784725c06759808a5818f241/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/8d4d0aa95d06da4e644d1328d4a7b2a95893e2cc/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/9d2091d5947c41861a16e3d677da8ae1e71b6384/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/088fc43420047bd507f24a7601ada27556026877/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/75a07e3a162faf9f8ffb7390f4b68cd3db90b189/
      mipsel |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/e3f2f29f461ea14058c05997db1ca4c9265e11e9/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/09b70df3aa36bdbc37255105391d46650b673e0b/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/94d7c08581e8fb16db235e5a7095f620d88534e1/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/d59c43d5682867f1bb784cc6b7ab6c337c257658/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/65199a4cf82844c46f91ad87619184259ef53184/
      xtensa |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/ef0116b5010c2c63579262e894a167d50203bfb8/
         arc |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/fed068ebc856102346ab869ace08217df0842139/
         arm |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/2d1132f90878cfbe422099f10d316f2fd20efabc/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/862af4c6be4b78e65528195305653eedac4163c6/
      x86_64 |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/8b04b58e529b65c4b2721412d8833f75331557f8/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/b03e23cc83f32e6be21e0d4fbf465ec93228f78c/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/d86e23b927c4f887cb3391bbab850a01ec2705b2/
       sparc |                  libdrm-2.4.64 | NOK | http://autobuild.buildroot.net/results/857f760cfb42d467d19d91078dab83f3d78cf37f/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/2b50bdb59636898acaf1bcc85da0c6dee2cd9bd7/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/c29391310224a47241f9e30f341b4d1f41026c5e/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/c28e00ac5129f42c197bd4e9efc5cb957dea896f/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/7aa1af26ad01aea4627d4c2826eaa2c71c051be5/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/efb4c74fb3ac7461d827ee3565b863ac8a6d55ee/
     powerpc |                  mesa3d-10.6.6 | NOK | http://autobuild.buildroot.net/results/e841c41abe5d72ed1d95d7b7ea40e5a245e39a4a/
      x86_64 |                  mesa3d-10.6.6 | NOK | http://autobuild.buildroot.net/results/c33de1c896826fa0c4e6af332b7d770d695a9f97/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/c6eca241beada14c4d752e645cd4a943f393d6b2/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/c0d87ae52163c72687938f25317ae761d15e304c/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/11abb91cd5813dfbed9b0c7db0d7c412da15562f/
         arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/50923710ad44ee877e753183ff7ab5d3c846dcda/
        i686 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/2275899e34d05cfc2f8c0394d62775a4b73e5531/
      x86_64 |                    opkg-v0.3.0 | NOK | http://autobuild.buildroot.net/results/4e01abdc8cace71802e527273b47dcc49c9bd4ce/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9f663fa834ecd65a17ec00ef36eef220dd51cce8/
    mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/04cb2317218c946ed2d19eb500f73510272423b5/
     powerpc |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/510e2216085134a9c7ec824edc78e1c451030f0e/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/bb193fc7510709e55e7f5e62ca831d3f74f69a79/
         arm |                   samba4-4.2.3 | NOK | http://autobuild.buildroot.net/results/e1058d5ba169cd249663ea650cb2e56222a1684c/
       nios2 |           sane-backends-1.0.24 | NOK | http://autobuild.buildroot.net/results/d78233fc1fe2acf8fa0d9aa6f288dc61ee220dc5/
         arm |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/d54b74fe15e2c415df5133195a056d20dd3e7e5f/
         arm |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/3b40615789ae05177419fd6acea198367c368c6a/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/ea2be188b88ceb1cad4314bdaf00184cb74b9e26/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/a1f5a977c88318154a130e6e92d8c26efd422ec6/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/9d39afbf8f30a9f50c2b5a61deb16e025a1a0097/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/3e40cab1d6be5b97b8623116653d1c02a10332fd/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/74e14fccff5f8871683395a8c72af83ed7d89338/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/20500790971a6c7cc860913b9de4191a84283b96/
      xtensa |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/4af880a8a8a37efd57e12e18d43183ba49f5cbe0/
         arm |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/117a68bf648b050dabed8088d1165c1d7d9301f0/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/d0aba76313d76679ff83f2052ea909edcc8c02fb/


-- 
http://autobuild.buildroot.net
