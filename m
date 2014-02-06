From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  6 Feb 2014 08:30:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-02-05
Message-ID: <20140206073010.B097A102F2A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-02-05
===============================

        success : 83 
       failures : 55 
       timeouts : 0  
          TOTAL : 138

Classification of failures by reason
====================================

          sane-backends-1.0.22 | 9 
                   open2300-12 | 7 
                 cairo-1.12.10 | 4 
                    gpm-1.20.7 | 3 
mmc-utils-11f2ceabc4ad3f0dd... | 2 
             alsa-utils-1.0.26 | 2 
                  libv4l-0.8.9 | 2 
                     php-5.5.8 | 2 
                      icu-51.2 | 2 
                     vlc-2.1.2 | 2 
               wvstreams-4.6.1 | 1 
host-gcc-final-b93bb009e021... | 1 
                    systemd-44 | 1 
                  sawman-1.6.3 | 1 
                libsecret-0.15 | 1 
                  opencv-2.4.2 | 1 
                aiccu-20070115 | 1 
              e2fsprogs-1.42.9 | 1 
                   dbus-1.4.26 | 1 
                elfutils-0.155 | 1 
                     lxc-0.9.0 | 1 
               libsigsegv-2.10 | 1 
                directfb-1.6.3 | 1 
              wireshark-1.10.5 | 1 
               alsa-lib-1.0.26 | 1 
           imagemagick-6.8.8-4 | 1 
                 pixman-0.30.0 | 1 
                  thrift-0.9.1 | 1 
                  mongoose-3.7 | 1 
                minidlna-1.1.1 | 1 

Detail of failures
===================

     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/37e84361e1bb56f2dc0eb99b1fdec2494004ba74/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/a88ee48687ef7b7d8ec5d2f9933377e0a9630a9c/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/63bcb9949b2664dc4b64b62a62564da168ee2f1f/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/de286880973be956f6c504aa9a758171d6f49674/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/722c265ebf354c3b4557959f436b2fd13aa26c29/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/7d317bec287c530986ee5fcfe2313780270a3b6f/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f32374a4eb54f2b73bf701b036b94ca8819d5f31/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/6e5a56269f1d8f7e281f773b535ef4bb1a3960c8/
       arc |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/c9a2831ec773600d3f9768a40caeb8f7825bc0c2/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/1d0dc67fa100e19fc0a80a55e28bf78ab0871b31/
      bfin |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/3ac0cd438dfcb3d89ebab7d536fd1e6df9178c80/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/0947a111e6c740f0a95e0826ff17a242cd91f679/
   aarch64 |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/13a1c592f666c010189de6c4d4ce59917048ebf6/
   powerpc |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/26477adab9e68ee78e5c4b4a9bcf4fc50823cb92/
       arm |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/a4b473ae0a97fe79dbc30e6603f029f946c011fe/
microblaze | host-gcc-final-b93bb009e021... | NOK | http://autobuild.buildroot.net/results/dccfa08090f2b838c4ec526ee97ed7c13884ffc1/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/26fe21c7d1cb7f3f1f1ec4ad075774f6401c4b04/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/682a37f89254762df27efcc94a370f49267f0ccf/
      bfin |            imagemagick-6.8.8-4 | NOK | http://autobuild.buildroot.net/results/d2f673b71f771ab5a6435805e39338fd023f04c8/
     avr32 |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/e3a389ae10cbb5ffbda23bbadef16bb0dbacc178/
       arc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/5cd051937a9471f7fb47363e868cb4b61d788d75/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/cbed78e3afd304c8f443e1958c99d10d2e222a3c/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/361809d37d740e674d9715eef7a1b8d2736b7d3f/
     nios2 |                      lxc-0.9.0 | NOK | http://autobuild.buildroot.net/results/20badc9d36c3526e9b8b473249bdd3c251bc44ee/
   powerpc |                 minidlna-1.1.1 | NOK | http://autobuild.buildroot.net/results/90739640ac580801e5f22e20b85557ec9073f9e6/
   powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/fc8aa1addec75bcd652cabf09845e1be81ccbb3a/
       arm | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/0f49183057cd1f13a28306bc80a5b15fc1467435/
       arc |                   mongoose-3.7 | NOK | http://autobuild.buildroot.net/results/4beb6fa0eaf660e559a15ddc6d4bb79080fcb343/
       arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/2808203a6fba79b71c6f5ec0ac7388623d979d34/
      i686 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/0724ffa1355f5564b1fcd9d6e3c9ff2162d20f44/
      i686 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/0175fd7df1ccca0a9b69e0b2cce49bd663b6fa99/
   powerpc |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/9271f6b2e692001fbeede842a6059cbec97402fa/
   powerpc |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/89ecf504fd01c8ef2fdde1e15dd49c7ae79749b5/
       arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/f4ffa502c9ac232a102503f6d9a913975f1bc853/
  mips64el |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/1726f528cc58b46ae27a2abf51d4ab84fbe890a2/
       arm |                   opencv-2.4.2 | NOK | http://autobuild.buildroot.net/results/8dd1674674018a931ba09cc5b414c32360e51692/
       sh4 |                      php-5.5.8 | NOK | http://autobuild.buildroot.net/results/9bd69462cdda5c20db08fabe25a7c46941e1164e/
       arm |                      php-5.5.8 | NOK | http://autobuild.buildroot.net/results/006c93ffef88aad31563ab3f67bc6d35da7d6302/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/5eaa2d7174d5ea5ad6a22d3a7489cdae4594a967/
       arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/33222b85eb0552f412b770c95c515514cbd66053/
    x86_64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/d2460d7b6dac371e32215a9054e0375d22c22184/
       arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/912e55ff57215a5c1ad71d2fd247abc44127faa9/
      mips |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/995db8e62ff840bf75d868e4882a6c0a9c4d6678/
       arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/29e878e5378e3cc200249572ea22e577af99ec28/
  mips64el |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/72c26cf91392bc53531cb7714bba967fa7e20fc6/
    x86_64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/e7c886ba89eae9434f02de398bfa157cb517faf0/
  mips64el |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/9989c3a30406776df7ba858717ddcdf069b64c85/
   powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/02f386b7eaad86e080a4a7ab4b305b55b654b93f/
  mips64el |                   sawman-1.6.3 | NOK | http://autobuild.buildroot.net/results/326747b1bbba8428a115fdeb41ec03124e855d00/
       arm |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/e5851939d2837d4e35a4c1d9ca6df3c93ed5a34b/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/d4f3cd1d8e42808c2c6c6d8a72436d851004b751/
  mips64el |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/b565a3ada34c3eaf9608f660d62d8d08e69b8bd8/
       arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/7a82eb1b6eb5b7e995434ba035d468752a130775/
    xtensa |               wireshark-1.10.5 | NOK | http://autobuild.buildroot.net/results/58d3f44881e68b4bdc44ea17824a1c56bc01948a/
    xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/e2d1a763fa86b8575e2e48e6d73c018175f43e7c/


-- 
http://autobuild.buildroot.net
