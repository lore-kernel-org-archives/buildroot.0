From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Mar 2017 08:28:47 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-04
Message-ID: <20170305072847.53355206EF@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-04
================================

      successes : 149
       failures : 32 
       timeouts : 0  
          TOTAL : 181

Classification of failures by reason
====================================

          python-pyasn-1.6.0b1 | 10
             python-pytrie-0.3 | 6 
        python-cherrypy-10.1.1 | 3 
        python-enum-legal-info | 2 
                   cmake-3.7.2 | 1 
                   fwup-v0.8.2 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                  libcec-4.0.2 | 1 
                libepoxy-1.4.1 | 1 
                 mplayer-1.3.0 | 1 
                    putty-0.68 | 1 
      python-pytrie-legal-info | 1 
                    qemu-2.8.0 | 1 
                wayland-1.13.0 | 1 
x264-97eaef2ab82a46d13ea5e0... | 1 


Detail of failures
===================

      x86_64 |                    cmake-3.7.2 | NOK | http://autobuild.buildroot.net/results/f30228e1885e7292957528158d0fb74cb51e2330
         arc |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/7f127655ffeb45b8f49616a1ed16bb184d9d7abf
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/8ebdf97b0aa6c0bce9386147a50b1299d68e57bf
      x86_64 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/ce545da1d74830d4487c4cf6d757746f3858d22a
         arc |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/9d34304bd3027a7d9fcbdef03b4d89d394bee3c4
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/869069dafda5ef4ab2b9f03ec18d4111ed69eb8f
microblazeel |                     putty-0.68 | NOK | http://autobuild.buildroot.net/results/0e3f4306513b79306d43338eced890205632c395
      xtensa |         python-cherrypy-10.1.1 | NOK | http://autobuild.buildroot.net/results/b66f8fbce3a5127b69a09bdc91a460a3c107e29d
 powerpc64le |         python-cherrypy-10.1.1 | NOK | http://autobuild.buildroot.net/results/c7d34c0b2f7f802095712391565a738e2636dd01
     aarch64 |         python-cherrypy-10.1.1 | NOK | http://autobuild.buildroot.net/results/0a4fa02e1ca895a683141439830bd78e6b081187
         arm |         python-enum-legal-info | NOK | http://autobuild.buildroot.net/results/a4b3e734f2e6e3839a2b3c414e544d5b22b35948
    mips64el |         python-enum-legal-info | NOK | http://autobuild.buildroot.net/results/9509c7074a365cbd37993829ab24428ee9248a6a
         arm |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/2018921bc9fe7dc9bc704a508698d314a2a9f0b6
      x86_64 |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/0ae046c326c3eb7389f51b5e89a5ff29b5fde307
    mips64el |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/27e1c6cdf330bd2009bf8895d8c72a7c4f5186af
     powerpc |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/1daee127ed3ec6bd7d6c75591036bc2e775e629d
         sh4 |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/0a1ff8d28a0b6e25f45c6ca5c469223ec799351f
        sh4a |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/e689228aafc0e7a5ac61d670342511efd1606526
     sparc64 |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/fa29e8f30ef0cc10ffe7c2d0883ffaf810e32977
         arm |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/26aedb813fe0ebf5f2d5075c4e1f157e7d539d9d
      x86_64 |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/530dd7515634f321e183d079ac46947e2a275289
     aarch64 |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/d10d278cf42de0fa5ae73c0c4baebe72eac476c8
        sh4a |              python-pytrie-0.3 | NOK | http://autobuild.buildroot.net/results/e4209a2209bba769c264f8c4c6dfe2995443c243
     powerpc |              python-pytrie-0.3 | NOK | http://autobuild.buildroot.net/results/25cf9c046e5a2c8fec9125c22caeb80371b7db30
        or1k |              python-pytrie-0.3 | NOK | http://autobuild.buildroot.net/results/8120fca07bbd8ca660e33f66bd86f2d079f9a407
         arm |              python-pytrie-0.3 | NOK | http://autobuild.buildroot.net/results/bda5d2adde1249b79ae49acdffdd055cb1351775
        i686 |              python-pytrie-0.3 | NOK | http://autobuild.buildroot.net/results/c7608b2eee963258c8ac9ab2bed28d91a295c00c
        sh4a |              python-pytrie-0.3 | NOK | http://autobuild.buildroot.net/results/64874290293b687c0b4a07eb603184feaf84f54c
         arm |       python-pytrie-legal-info | NOK | http://autobuild.buildroot.net/results/1cbe77eed024b2018e9249e8eaeeca989324e861
        i686 |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/a5de9a203b453a34f54c0370c3d493d86d090d52
microblazeel |                 wayland-1.13.0 | NOK | http://autobuild.buildroot.net/results/291e0f1ea18004190ae5acd9bec147cacc3e4bda
        or1k | x264-97eaef2ab82a46d13ea5e0... | NOK | http://autobuild.buildroot.net/results/f366d80bf02df068639b2b967d045cedd365a8e5

-- 
http://autobuild.buildroot.net
