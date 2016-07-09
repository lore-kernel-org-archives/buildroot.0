From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  9 Jul 2016 08:30:26 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-08
Message-ID: <20160709063026.D3066103F03@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-08
===============================

        success : 210
       failures : 87 
       timeouts : 0  
          TOTAL : 297

Classification of failures by reason
====================================

openblas-f04af36ad0e85b64f1... | 9 
               acpica-20160527 | 6 
               target-finalize | 4 
                  libsepol-2.5 | 4 
               libcap-ng-0.7.7 | 4 
              libarchive-3.2.1 | 4 
                  botan-1.10.8 | 3 
             transmission-2.92 | 3 
              lirc-tools-0.9.4 | 3 
                  cairo-1.14.6 | 3 
                   dante-1.4.1 | 3 
             libgpg-error-1.23 | 2 
           argp-standalone-1.3 | 2 
                   ncurses-5.9 | 2 
               libdvdnav-5.0.3 | 2 
                directfb-1.7.7 | 2 
             bluez_utils-4.101 | 2 
                    owfs-3.1p1 | 2 
                    mosh-1.2.5 | 2 
                fcgiwrap-1.1.0 | 1 
                blktrace-1.1.0 | 1 
                   assimp-v3.2 | 1 
                  openjpeg-2.1 | 1 
               qt5base-5.6.1-1 | 1 
libcofi-7313fbe12b0593034d0... | 1 
                   cmake-3.5.2 | 1 
               openipmi-2.0.21 | 1 
                  multicat-2.1 | 1 
                     gpsd-3.16 | 1 
                 ipkg-0.99.163 | 1 
           linux-zigbee-v0.3.1 | 1 
                     eudev-3.2 | 1 
iputils-55828d1fef3fed7f07a... | 1 
                    libiio-0.7 | 1 
                 clapack-3.2.1 | 1 
                oprofile-1.1.0 | 1 
                 log4cpp-1.1.1 | 1 
                 php-zmq-1.1.3 | 1 
                openssl-1.0.2h | 1 
                   duma-2.5.15 | 1 
                    urg-0.8.18 | 1 
                    lftp-4.7.2 | 1 
                     fbset-2.1 | 1 
               runc-v1.0.0-rc1 | 1 

Detail of failures
===================

    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/9f36068473f23ac9840bdc05351bb36b3882286b/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/eaf667631753a7542fbea37dad42e9b39f837e92/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/e15ac5483c06570c2f4798556ca3c1d3c24d5828/
     sparc64 |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/b5af7ac770236e3f4ae07bb149ce713cf1e2455e/
         arm |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/4c764778866078f780f43b6f684d090b6a8f70a8/
     sparc64 |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/7a1e1909e7a34e1a60e18aa84c7b9ab3db56c093/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/e952b6ca779f82ca4064c9a5d2ca6cf274a624c0/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/95df0a05ff99c0cedfe93c824a3aed47ed96b2f1/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/53d0eac716c18a7c5e190655142edc40ea5f011f/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/17472353e76268fb7b06332feb73e9d6d22d66a5/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/0c3b373e8c3570bfc073c3a2d4c9d065e2194578/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/9c0fd3bfec17770f09bf6ce86c3edb76269b83d1/
         arm |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/c981edc594b8d6c8bec7be7dedd9bfed2660d8e8/
         arm |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/27ccbc935f826301192d4db99e6f600732b1bfb1/
         arm |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/fa197417c83ec7d5e659c93671cf06ee8b9d9a9e/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/f8806a5c0c4e9dc1199f274342c4a4a369a7bd03/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/7f4bf61ae8ae51d347c1792d22f0122e53b4ebcd/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/03a745689f65bf0a961b8ea90cbe578c4ebd2af8/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/df9a685f77ab6c7a4fe4efde1275eee2bc53c40c/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/05efd29747acc6f0e8a25825e9ca0f998b19998e/
     sparc64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/b7b5c9c9bf6de2f629181db77b2f3e0da98596ad/
        i686 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/f3c10a893206521b77c0ee1e77e5f335f04f913c/
        i686 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/74b540fea762410d665268cf2f4ac7578a55a886/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/b87a713374b527f5b7ba1d89976cb15eb13a2885/
microblazeel |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/4a378eabc6bd2e7a891df0b160c7bfa03eb217ef/
         arm |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/438032a6d6a38c9929cd26dffb8b3c5d1aed9106/
         arc |                      eudev-3.2 | NOK | http://autobuild.buildroot.net/results/d7c492cccd542dc6bff20d174a2481e2a43e5922/
        i586 |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/b756dcd84658d9f2ac5d9953dfccffa3a8f87acd/
         arm |                 fcgiwrap-1.1.0 | NOK | http://autobuild.buildroot.net/results/398916403c91dd8d5df130e1df6ef7c9c57c9bd7/
         arm |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/aefbafadc05b0f911a5f2c6354594053023c77ef/
         arm |                  ipkg-0.99.163 | NOK | http://autobuild.buildroot.net/results/e438f7ca985f9e52c4a05667de9e0e3a2c81b348/
         arm | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/c5b129a2524cc0896adf40ed868eee13e1c8559a/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/5959cc52b0f826c9802ef8c8d2cb6fd6fbeb7e23/
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/6a3688e11a77217026c804048129890adb651efe/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/a8c7a5bba6d8b8ef13060a1aec61fedc4c031002/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/57327c988910bba4264876afb73f8456bb9f06fa/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/69b6c2f3b58d392428f6569741de1dcf9ee1f11d/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/77a504a3cd6696a2cc8f51865b506964120a2c7e/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/592581d458af880bd1db8144541cd4a9ec5145de/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/f7e844b2a22c8a856c18b12796789b2beb358db6/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/cce8b43021481e731dca72d8cab0f925e4607cfe/
         arm | libcofi-7313fbe12b0593034d0... | NOK | http://autobuild.buildroot.net/results/36855942902e02b4af7145b26adcffbd4d29d138/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/ce7a7e15d88e480d633e5e540d0b15a7914ca3f6/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/c5543e8b417829b02cdbc3a97f36a4aa6d00c84f/
         arm |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/db00b1b0bfa22d9c6aa6671db25c56549f87ba16/
         arm |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/6dc2ae2d73ea6e59ceb8f06339f7aa286644454d/
        bfin |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/e4457cd4689b8de0b1f911313bdc84749d48e20f/
     powerpc |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/e31cfcf3b080e4fe2f15329d36c707f46d6860db/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/8d3e79e8728099426f7d5dd922af7721a711cf58/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/f6e4273252be7e495c845f684ad0109baab651d3/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/3adf6a2f478ff8e8058122a763760162b1b9ac09/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/101544d56ec2f4a1b363f928f9d2c4900c58f845/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/af331dac26d2df274fcf852f2b8e6e94a02afbf6/
      x86_64 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/0c360be0c7991ff98c9827614bb1583f219f7d2a/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/3a561f751abcd8817f4391ae27ed4e1db597a209/
      x86_64 |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/868663120c73aae56be3f4baca730f90105d2db5/
         arc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/8292038b6c660c2f6766e44cbdd8b8b0ec93a2ba/
         arc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/55f257a791b46682857d5ecbde0ffa0e16080975/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/2cbb0f2a84b8ebc2320667006306b63b9313e071/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/e281efc9fc71ef72dc5a8ddeb69a6aade385b1bc/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/7e1d565c0d5924db6aeddf73351e21203095301c/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/2bffefd20d3d73fafea2085c7fd46653a04aab63/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/ef40467d20024750ac13b79cb7cd1b26a9630a54/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/c4c10c10547c8a41d4d4aa604c4751d04792a7bc/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/3c9742de0a52b62f156b80b2afb203f38d0f117b/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/f5d39c8879d8c6785595eb57c3d32358b3eb3a50/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/441e456fec553974d29bc57a4abb506c90711fd5/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/a9d9788057c49476b9b1cd71ecfdc20e3b0700b5/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/9c45d8d850f874c62db1ae324db8bb2110c437e9/
      x86_64 | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/f7b54e4fd2fede36165651605c23d0d4df71ea88/
microblazeel |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/903415e5af4cd0a3805b893ef60b2fb0e0cdd268/
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/b9aa7bd31c89fed8b274409e14842545bf43df10/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/f4f34bc1ed4a942c2e8a79b57bf3612596c77a90/
        m68k |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/7710407449c7e75667285fa670efb9281a52e87d/
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/eb3ada606e902c92876654266364827d0e79c027/
        mips |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/bace35166c3d3ac122098fb0f41eb21f7bdb33a3/
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/5d222ef5c27de7cd7d8acdc825406dbeeb284c20/
      mipsel |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/c0c4a2cf716508c6aba84c591bd5285b51efe33c/
      x86_64 |                runc-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/93d12cd8ee2bed5ec8980cc640458900537b0f4e/
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/b7477234735ee9daf0dd38641e4769f816064593/
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/bba997c7ad6cda7edf91af2cd854cc8e57b43e12/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/2978f983e24feed200f241bfc0d3b04c936b1bbc/
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/6a2b35a4b086694b46e2839bc9ca4e151e021416/
      mipsel |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/61b45d83fda00c15ddd19c093997fe487d987839/
       nios2 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/c82d4f7eb09ba30a2103e0be265f03d6bf253133/
    mips64el |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/0b8116dc7f82037a1015802e3f1687f2c0e3311c/
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/87de20aa1ba3dccc97e3aae3dff2763541831d0c/


-- 
http://autobuild.buildroot.net
