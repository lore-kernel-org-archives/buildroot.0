From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Aug 2014 08:30:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-08-02
Message-ID: <20140803063011.3E44B1016A2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-08-02
===============================

        success : 71 
       failures : 32 
       timeouts : 0  
          TOTAL : 103

Classification of failures by reason
====================================

                 libpcap-1.6.1 | 6 
                     vlc-2.1.4 | 5 
                elfutils-0.155 | 4 
                  perl-gd-2.53 | 2 
               ruby-1.9.3-p545 | 2 
                    ngrep-1.45 | 1 
                  autossh-1.4c | 1 
                     nut-2.7.2 | 1 
    bandwidthd-v2.0.1-auto-r07 | 1 
                    fftw-3.3.4 | 1 
                libmpeg2-0.5.1 | 1 
                    yajl-2.0.4 | 1 
                  cppcms-1.0.4 | 1 
                oprofile-0.9.9 | 1 
                 iftop-1.0pre4 | 1 
                 empty-0.6.19b | 1 
               alsa-lib-1.0.28 | 1 
                      qt-4.8.6 | 1 

Detail of failures
===================

    x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/a1dc523527c35521454a8d2a62a0a85f8f48e75c/
     nios2 |                   autossh-1.4c | NOK | http://autobuild.buildroot.net/results/92e70a7aa296b29b856d25461520ff46477bd69a/
       arm |     bandwidthd-v2.0.1-auto-r07 | NOK | http://autobuild.buildroot.net/results/96662d417e42f9b25bbffea38259a8d52ddfdec4/
   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/1d3bf27451fdd9516d5a93fcdcd8ecb1bbbb1b6e/
      i486 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/8814a8cea9f9affd7b600a9a1819975c2e84f36b/
   powerpc |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/6edd687ffb5d334fb97c15163cf5dc0f110831fc/
   powerpc |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/9f10de926f1187e220eeb7d641516253b4f38b7c/
       arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/ffc32fd32f9d1b890deef41560d815d95f33eed0/
      i486 |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/9fce0825772e99de3c6808b729641147385413aa/
       arm |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/9b22da0beb69b04ecdc8d3913c9ed42b70fb6ff5/
      bfin |                  iftop-1.0pre4 | NOK | http://autobuild.buildroot.net/results/60f82bedae255f6b69c9a5ac22686c76c6276301/
   powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/6325bcf9d99cac6c4b6f5f273e1d12a3b8333f09/
       arm |                  libpcap-1.6.1 | NOK | http://autobuild.buildroot.net/results/bb3e68423e00105643506afee50548f90fd1e09e/
       arm |                  libpcap-1.6.1 | NOK | http://autobuild.buildroot.net/results/541d12463a09b104e8714698f055b8c89a247152/
   powerpc |                  libpcap-1.6.1 | NOK | http://autobuild.buildroot.net/results/728440a3cbedaf02eef222cb4d3589f939faf4c0/
   aarch64 |                  libpcap-1.6.1 | NOK | http://autobuild.buildroot.net/results/56aec09cfbebd9d31545f6694ae8c27359ec7b59/
microblazeel |                  libpcap-1.6.1 | NOK | http://autobuild.buildroot.net/results/7e5be5a461a290feaf35ae9bc80bf98cf082ac11/
   aarch64 |                  libpcap-1.6.1 | NOK | http://autobuild.buildroot.net/results/9f194ea7ede8b75db4a85652ad93118f35117497/
      bfin |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/93842b54767cca51c68ad33ddc93ec58d70602c8/
       arm |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/718beeae1c5eb0e1fef2723cdc6fd237f3c2d3b9/
       arm |                 oprofile-0.9.9 | NOK | http://autobuild.buildroot.net/results/1319b9159abf58df8c28aa1c8abd92c04cf37015/
       arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/9162836f4b693a0667bac46c9fae1d3d86f6e4a9/
       arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/40ce43b472f4ab6855c1a9ae49666278bb75b44a/
       arm |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/d70e8832f319fb7a50e88a3546b100f98db499bd/
      bfin |                ruby-1.9.3-p545 | NOK | http://autobuild.buildroot.net/results/8f1dc4fc5798366c3b1f37df6efa22f3c1f4785d/
      bfin |                ruby-1.9.3-p545 | NOK | http://autobuild.buildroot.net/results/04f8cd383406b049c5f51321d0e9e4f212e0863c/
      i686 |                      vlc-2.1.4 | NOK | http://autobuild.buildroot.net/results/cb8402fc994697f157348d88f848357ca21156a4/
      sh4a |                      vlc-2.1.4 | NOK | http://autobuild.buildroot.net/results/022252176c051ff3365b2cb820f32aafc802803a/
       arm |                      vlc-2.1.4 | NOK | http://autobuild.buildroot.net/results/6660453c78d1557b645e8fd5b3ed2076e64fc91a/
      mips |                      vlc-2.1.4 | NOK | http://autobuild.buildroot.net/results/0d4199c3271bbd7cf8a04403c5dafa1178f75fb1/
       arm |                      vlc-2.1.4 | NOK | http://autobuild.buildroot.net/results/2dbaa3603b3dab9e06a37993fb235d009bd22df9/
       arm |                     yajl-2.0.4 | NOK | http://autobuild.buildroot.net/results/7d15eb9273da4f5c16f180ff15e2d0ea08d98b6f/


-- 
http://autobuild.buildroot.net
