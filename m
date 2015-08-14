From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Aug 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-13
Message-ID: <20150814063016.11C8D1023AF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-13
===============================

        success : 141
       failures : 44 
       timeouts : 0  
          TOTAL : 185

Classification of failures by reason
====================================

               libpthsem-2.0.8 | 7 
             lttng-tools-2.6.0 | 3 
             libselinux-2.1.13 | 3 
                  mono-4.0.2.5 | 2 
                busybox-1.23.2 | 2 
                    libiio-0.5 | 2 
freerdp-770c67d340d5f0a7b48... | 1 
    xserver_xorg-server-1.17.2 | 1 
                 clamav-0.98.7 | 1 
                      nbd-3.11 | 1 
               libedbus-1.7.10 | 1 
                  boost-1.58.0 | 1 
                 qt5base-5.5.0 | 1 
                 setools-3.3.8 | 1 
             webkitgtk24-2.4.9 | 1 
                    bwm-ng-0.6 | 1 
tinyalsa-f2a7b6d3d81bd337a5... | 1 
                   audit-2.4.3 | 1 
              libethumb-1.7.10 | 1 
                mongrel2-1.9.2 | 1 
                   systemd-221 | 1 
               protobuf-v2.5.0 | 1 
                minidlna-1.1.4 | 1 
                 libssh2-1.5.0 | 1 
               linux-pam-1.1.8 | 1 
                cifs-utils-6.4 | 1 
                   erlang-17.5 | 1 
               lightning-2.0.5 | 1 
                      qt-4.8.7 | 1 
               polarssl-1.2.14 | 1 
                sysstat-11.0.5 | 1 

Detail of failures
===================

         arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/e22a70f9ff14bc52f642a6135da44c14e41b6cbb/
         arm |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/9c3cf49aacae2d3ff4fdf128dfe401aef5926491/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/0a21fd43482bb2231b3c911315f7efd8e9f85d88/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/6eecf7192a4d5c3986f194972d1d5ca06fe97ae5/
         arm |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/546b332cf95a48412d88add2feec2ffd4712857c/
      x86_64 |                 cifs-utils-6.4 | NOK | http://autobuild.buildroot.net/results/b9f918bba4952566e3818fb99f45a7e425acf727/
         arc |                  clamav-0.98.7 | NOK | http://autobuild.buildroot.net/results/184a6174029de2d7890e45111274ffad3163f375/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/e34a5ad340a160867660e3a805d9a0f36fee4796/
       sparc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/4a45389701146493b3bbc522efde862de473d628/
         arc |                libedbus-1.7.10 | NOK | http://autobuild.buildroot.net/results/737dd368a63530bbc4dae0bd2364bfb4032fe79d/
         arm |               libethumb-1.7.10 | NOK | http://autobuild.buildroot.net/results/5623a0d89f80c3906f2aaa7472e537664ad96a20/
         arm |                     libiio-0.5 | NOK | http://autobuild.buildroot.net/results/949314b57f5a396b4bb03e422094b754dcf87e20/
         arm |                     libiio-0.5 | NOK | http://autobuild.buildroot.net/results/4bbd2d6927ca75517c2bd37eca83a9d98f1cca01/
        mips |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/b2e42e4e9140cb913c98baf980ec8b055a0b48f3/
microblazeel |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/4217cd2416ecf8a94afd6c534941c837acbc65c2/
microblazeel |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/ac9fefc14bc7b2ca1014595670e9f1c477e26ba5/
      mipsel |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/5c288d8a8fda66da27e9d82cd6309e9f2f884919/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/1ddb703cee2319ce97b941cc92bf12d7309a36c1/
     aarch64 |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/2edeea59eb21031abde54a2ac8c260ab5acff3b6/
     powerpc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/e09d89e5da342f0790f7767b1b8968e5717b4c5b/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/ba61ea4d9461e2bb539bdd4fa42fea23ed47f702/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/e2fdd3c4886621a04e4c0af944a8c5f39208d932/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/e16df01518aa06689aa5c0a5c43e13a6c80d739e/
       nios2 |                  libssh2-1.5.0 | NOK | http://autobuild.buildroot.net/results/5a0350a77229136ae29a8732ab4f6cf8cf2f45de/
         arm |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/019b6f2ac034766a4266e20e5dcc229bec4a7222/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/ade27824e5e89db586b3805fb6453a444e5adca0/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/6909fca7b78604d58eb58e51e911f24c2eba9ece/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/1b9ddecada24055136daf93f20bc697946bf52a9/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/720bdded0b12dad6b656df5987e6094d50dc68dd/
      xtensa |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/29e195f5a73213817f7d1a0c4e8c64b85aef5b8d/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/e0eb7b9adc6c76ba3c42ff9afee389a928603338/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/7ddfbaf88a60d1eca30e9809ef1d1029785521a4/
       sparc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/2f9f32579fee8d53ea08c3c4308419e4d54e42bf/
         arm |                       nbd-3.11 | NOK | http://autobuild.buildroot.net/results/aa8a1ac35a93e1c8b9fddbc2b5d66ecaa921f31e/
      xtensa |                polarssl-1.2.14 | NOK | http://autobuild.buildroot.net/results/89df3c9c4d6b64e3779031ca688c7985b55fe8ed/
         arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/84f325c999811bba41a452b51eecdb5762efbc62/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6b27d968a28ddf6792c202ef965098ef149dffca/
         arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/680066e107ec92073432f8e5667f610d7a5dabad/
     powerpc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/051a7f72ebadd56407700c22b57e942f08eb1c09/
         arm |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/8cc547074de23b9482ad110234ef7458a44e174a/
     powerpc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/82ce8b54de2b4aa9cbd2066f61dd513555ef4e78/
         arm | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/32a33d0567e94936f8a3078d1fdb7cbec4cd0397/
    mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/b073387a198a1237ed7fc4a0bae97bf70e8ed7d2/
      xtensa |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/9f53b5900328fc1e738a806b0e58179e3e50039b/


-- 
http://autobuild.buildroot.net
