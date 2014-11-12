From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Nov 2014 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-11-11
Message-ID: <20141112073013.AB3E81010D0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-11-11
===============================

        success : 206
       failures : 56 
       timeouts : 4  
          TOTAL : 266

Classification of failures by reason
====================================

                 schifra-0.0.1 | 22
                  perl-gd-2.53 | 3 
                 libssh2-1.4.3 | 3 
           libmemcached-1.0.18 | 3 
                 clamav-0.98.4 | 3 
                 omniorb-4.1.6 | 2 
                    php-5.5.18 | 1 
              librtlsdr-v0.5.3 | 1 
                coreutils-8.23 | 1 
             e2fsprogs-1.42.12 | 1 
            gst-ffmpeg-0.10.13 | 1 
                  zeromq-4.0.4 | 1 
               logrotate-3.8.7 | 1 
           gst1-validate-1.4.0 | 1 
             fxload-2008_10_13 | 1 
                 tcpdump-4.6.2 | 1 
               sdl_sound-1.0.3 | 1 
                   perl-5.20.1 | 1 
          libmicrohttpd-0.9.38 | 1 
          shairport-sync-2.1.8 | 1 
                 libraw-0.13.4 | 1 
              host-erlang-17.3 | 1 
freerdp-440916eae2e07463912... | 1 
                  libv4l-1.6.0 | 1 
                     vlc-2.1.5 | 1 
             alsa-utils-1.0.28 | 1 
Checking for HAVE_WARN_UNUS... | 1 
       directfb-examples-1.6.0 | 1 
                     rpm-5.2.0 | 1 
                  thrift-0.9.1 | 1 

Detail of failures
===================

         sh4 |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/bb7ad6f0ae12e94b14db565df626694203e5779a/
         sh4 | Checking for HAVE_WARN_UNUS... | TIM | http://autobuild.buildroot.net/results/5984c407fd3cc1391edde17d505e5c5cee5eb8f2/
         arc |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/91c83da5e7b709eb2f6f1aa1bd2932a95bf1af34/
         arc |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/d8d704fe286977fc830e0be899cc9f06df40585b/
        i686 |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/0a954ab02c8c51386dabbd3d740ce4fdb12d133a/
         arm |                 coreutils-8.23 | NOK | http://autobuild.buildroot.net/results/c54608ac7e03f14055e2912cf06f6d41d21227c0/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/dcefd21b495e320a1e218980f3ea5d86731e89d5/
         arm |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/b8b0288ec11d11df518958ec921c7bfc70f1276d/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/c1c26da14dc225a87fab0fd4f5901e9b822bb456/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/4d394ac38ed27f38c1757ff99ddcf4f8237f4880/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/10c97e79db635a60c5b82fcad5d8ba0dfe3eedab/
      mipsel |            gst1-validate-1.4.0 | NOK | http://autobuild.buildroot.net/results/723fe3036e8f0af2a90ff9e98173387466655000/
        i486 |               host-erlang-17.3 | NOK | http://autobuild.buildroot.net/results/366439438549d5f7656be72f71dae3bb5f99c6b2/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/ae250b7ad3bc31c7f9b65c21efcb27f9f0669f3a/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/fc869cf872afd5abdbc7cd6850d6446b1c80d3fd/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/9d1e414850307487d65435216ae0ddee56d1098f/
        bfin |           libmicrohttpd-0.9.38 | NOK | http://autobuild.buildroot.net/results/124773b667477cad1933f17e8aed328ffceed17f/
         arm |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/f0357b467b3771f48c0c62a15ec41e143ed46bb1/
     powerpc |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/8b3d2395fc4a2b6e3465471a3603ac9cfa4474d1/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/cb7cb24bc1522d616955f704443b13826d5d7130/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/5e1f58c086e437b85b0d31310a93a3b2d0d70836/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/1c0447431e4c025732ea2eb8e9788e303f24fd04/
     powerpc |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/c371f4de7ec4b959310ca8e08cf289385fa0feae/
         sh4 |                logrotate-3.8.7 | NOK | http://autobuild.buildroot.net/results/ebe6ab7fc0f2cff98de06b3dc374730da9e9e4f2/
        bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/a96a06b825c14dc9fdf738225db50bc1de8b901a/
        bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/5ed5b2d9455d4396da09c9d98bfaeb126584e546/
        sh4a |                    perl-5.20.1 | TIM | http://autobuild.buildroot.net/results/6f7227783b8944d7fa2151c7f3ff9350f00962b6/
     powerpc |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/d9dc917c3e0574a288d56a6c20927567a344fc7f/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/ae092aef3747918a500d14f1519810b23580c0b4/
        i486 |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/70a448f974d161ff692e51df3eb1a8fd67efcb91/
         arm |                     php-5.5.18 | TIM | http://autobuild.buildroot.net/results/86ab5eb4a827df3d9831681b24259166bd65290a/
        i686 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/d1aa8ae092c7e3005d8a79bb5167fbf67ae9c7e9/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/7f346042ea27aa8362a62ff09763b496bf4b54fe/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/12bac113c3d7ee6b7364e89313f5861ca8acfd18/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/7bea1e2eed78c766a811b6318adfe3369483590d/
        sh4a |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/d7fa13056c0d6d8f68b25001788f732b6646fe57/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/16a7dc23a4f2ff1502bf630ddf30872880e1e140/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/34fce726d2c2719a70d55577669a741dc8c9d953/
        i686 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/6a4a3411763b0c73706bf61798f29e950c90ec63/
      mipsel |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/60d682cd71ecad19f631a1872fab1731b9e75793/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/1330b5cd2cc2e8b572e65eddab47043a2cfc6169/
        i686 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/a142525e5cd1fef48a69d54d83b21d656c5ed262/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/0d1a130f0c4f1d4dfd0abaf60aad0a41006d8113/
      mipsel |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/71147a397e418dc43c287e579e59056a989b33fd/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/65e4cb94fda40bbe0890073a2d6e0220802b3820/
      x86_64 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/96c20306fc491234f520d678e0483173f318938d/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/40122a324dd34a9d27a0ec4bec5adb831e94918b/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/e37344ee8a7999870973cdc4276449bae7e6ddda/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/4d76a433481611f63da9fcbd381f75e1396cde06/
        mips |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/b126c8093ec39ed5182fbad733fb5a21f08e2f4b/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/bab0298fa03acd68037d5326bfabfac2d1cc8786/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/5910b3723a062986dbd941743737f5e25daa03bf/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/d374d3e53529349f37076daf37b38513ac18cf57/
        bfin |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/84f61b3e36e0ce64a1118a1bd4c2c43ca8fffabc/
    mips64el |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/f8ca970a67638b6c738a89da64fcd5dd42dc2429/
     powerpc |           shairport-sync-2.1.8 | NOK | http://autobuild.buildroot.net/results/036a95af24d8d4f0f5a2fe1a6249c3e0d2dd1cbe/
        bfin |                  tcpdump-4.6.2 | NOK | http://autobuild.buildroot.net/results/7c63ad0d20b4ff2426b88a926b6f9f2c6593333f/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/d2c908e0e33fa0e0c3a8ba57edce0118c5dd63c5/
        i686 |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/a7c58d332a004cf67f2c5b9b7b7a2167607c57e5/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/8dc919cbe544ae2e0b94511afbdfd833f35a10de/


-- 
http://autobuild.buildroot.net
