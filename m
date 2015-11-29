From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-28
Message-ID: <20151129073018.04C72101FF6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-28
===============================

        success : 118
       failures : 33 
       timeouts : 0  
          TOTAL : 151

Classification of failures by reason
====================================

                  ffmpeg-2.8.1 | 3 
               libsigsegv-2.10 | 2 
                      qt-4.8.7 | 2 
                busybox-1.24.1 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                   mplayer-1.2 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                  mono-4.0.2.5 | 1 
               arptables-0.0.4 | 1 
                 lvm2-2.02.132 | 1 
                  libv4l-1.8.1 | 1 
         conntrack-tools-1.4.3 | 1 
                    bind-9.9.8 | 1 
            libsemanage-2.1.10 | 1 
                 gnuplot-4.6.6 | 1 
                  gauche-0.9.4 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
glmark2-499aa81a68fb4c8aac1... | 1 
      kismet-Kismet-2014-02-R1 | 1 
                    kbd-1.15.5 | 1 
                 dropwatch-1.4 | 1 
                   zmqpp-3.2.0 | 1 
                   tinc-1.0.24 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                     vlc-2.2.1 | 1 
              xmlstarlet-1.5.0 | 1 
                    yad-0.31.2 | 1 
               valgrind-3.11.0 | 1 
                    php-5.6.15 | 1 

Detail of failures
===================

      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/002bea21e0b902eecca245c9c889a55583c0751c/
         arm |                     bind-9.9.8 | NOK | http://autobuild.buildroot.net/results/2201f04170ea8ef0961e907efce07c041a57c229/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/dce2b68429734dbd63bab0bf75593b9dc44a5e42/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/624a0d48decd819eb58cbb3c58ee904b87ebfb21/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/61754104cbf574de04990f9a2df7490f39d01cc0/
       nios2 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/5ac519320ec79cf8117060dcc2620aa517845000/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/8274ac47169f11ae15d1c529dcf8b9d852cb5945/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/ed321e7d4afc7fb68c3f933000c7b32dd604a40a/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/fe627db27b07e1d24f8ee9e3d4f626e34df83e6c/
      x86_64 |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/c0e5d46ae11bd1ffd78191bb3966eb8aee41e120/
        i686 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/8587d0cea86efa4c6e98817cadc7cce0b1b36e3d/
     powerpc |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/320b9d7413a208bf5f5a37b6949ebaaf8fe5314e/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/680776cc663f982768528b8a35b5066db0090099/
      x86_64 |                     kbd-1.15.5 | NOK | http://autobuild.buildroot.net/results/f9f5971133d2bf2445f99cda7cb1b0e763a11c1f/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/94c115c969dd4bc60b8f14f488dc69e599ac41d7/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/3723945b16d835dfc6b32edb008e831e9566b9c8/
         arm |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/41a453bc4d9eb4f125705d94c2c58adfe697bb4d/
     sparc64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/1d8e0c22594aef53f7a4de3491454aa78311c815/
     sparc64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/ed22201e368bc0c81da937b747dedac7fa48332d/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/fe56063ddd2232fea7699f5117497beb3deca11e/
         arm |                  lvm2-2.02.132 | NOK | http://autobuild.buildroot.net/results/9bff7eef713fac2c1bfd7d7cff38406ea80785f0/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/6b23b912b8a405f5ea65384af12d4c41e8d4e0c0/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/7891ce4fcbce2b3ad1c13bfc03bf590fcf96bd86/
     powerpc |                     php-5.6.15 | NOK | http://autobuild.buildroot.net/results/a757edcfce00d3e52c6787f28dc31cbaf8d2d2ab/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/ea0db5e948ea8446b57fa6a117f7af10e6176548/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9aa6ffca461fb7d881cc2560947b9e406cec149d/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/54fdd06c17400fc4ac93d2d9dd54f4fe75136b3d/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/c40ad161959359c09d6cb82e6c5a4b365819b0aa/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/6c14daadffeb0f03facff6b23e9cda8529424b23/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/94719d6d2e7a84f3e50d1ea051670767b595fcb2/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/0358cd890b4721c21c9bd6e28a4d033c8374cfae/
     aarch64 |                     yad-0.31.2 | NOK | http://autobuild.buildroot.net/results/e69699a1d322d14a70d3cf4f69bb856b48ece9d8/
         arc |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/711333c0639aee135bc97cc028179376f7b091db/


-- 
http://autobuild.buildroot.net
