From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Feb 2017 08:29:28 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-31
Message-ID: <20170201072928.608D421D02@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-31
================================

      successes : 116
       failures : 37 
       timeouts : 1  
          TOTAL : 154

Classification of failures by reason
====================================

               openswan-2.6.46 | 8 
                    ruby-2.4.0 | 8 
                   ortp-0.27.0 | 4 
                 sngrep-v1.4.2 | 4 
                    mpd-0.20.3 | 3 
               bctoolbox-0.4.0 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                 libraw-0.17.1 | 1 
                log4cxx-0.10.0 | 1 
            lttng-libust-2.9.0 | 1 
make[3]: *** [all-recursive... | 1 
                 mplayer-1.3.0 | 1 
                   ncftp-3.2.6 | 1 
python-libconfig-b271c3d9da... | 1 
        riemann-c-client-1.9.1 | 1 
                 wavpack-5.1.0 | 1 


Detail of failures
===================

        i586 |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/80bcc0f208cd41f74bf09a6495ac173193275a3e
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/f7e01993d6bb86430a56123499fa7293230917be
        i686 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/7eccd6c170c49c671d94110669c8a4ae47d075a3
      x86_64 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/e03011dc085dcfd82b186b959fc15e9ddcfed26d
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/571bca494a5a937106bcd09d3d333491ba349f58
 powerpc64le | make[3]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/5c2cb2bd8413e425b27fb72644c9737a53dcc8fe
       nios2 |                     mpd-0.20.3 | NOK | http://autobuild.buildroot.net/results/64ca7ef43bad14e02f8943e0926f695505c89650
       nios2 |                     mpd-0.20.3 | NOK | http://autobuild.buildroot.net/results/d4c98f0e22fc41b02d434ae5656cee41ab121f0d
       nios2 |                     mpd-0.20.3 | NOK | http://autobuild.buildroot.net/results/b78fddbc1835ba5c7bdc300c82dfab6487691394
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/28a3755ce6058fd97994f2ade02be2bff248e184
      x86_64 |                    ncftp-3.2.6 | NOK | http://autobuild.buildroot.net/results/6583c5a22d6fe02823fb5ee642ab725c6983d7da
     powerpc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/a5552e592251034313d1d9d2fa9cc42a0b47fe1d
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/23ffed83cdc8eb4669941f5aadfc7d8dcdaa2b25
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/9191e9abcf104d31d0cdcfaaa452f6c6124884c1
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/d47014a60b33562d754b85ef0b343539ad66c11a
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/a0172958532e796c1124a699152428be03efd20e
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/eb4d97adfc8fdf0cb1992cac9d8ca37e95ca8a5d
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/2e2f1bb0035746cb9041df071b61187528922eae
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/39a9169a865dea741f92d6aa5328896860e4482e
      xtensa |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/e8747f1a34a96e90faf2495c833b408e0e97e11f
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/c2dd263902bb84a03d9be27c95140202c6fa4265
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/8a824906b071123c5c21b188b020595b686f8d17
        m68k |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/b275391bdec756a43c607f59dcf8e308f83534ce
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/f035bf8d13287bba689172f5ad15a5e2c3f61c17
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/3097550fb68bbf4ac9d0130c7bddccbc5861b7f5
         arm |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/f5030932c2fa6d3a870ca2b7b5d110e7b417f737
     powerpc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/f1cb80a0996f6a7b56be5a277828bd1a49b53a2f
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/1f9c64a8750442aa680d84f2801100273925b998
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/f964fbc87bf86649a868a5d7c1d33a1badb26312
         sh4 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/6acebdde71334c4f2b1037acde6e5180e1ca90a8
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/8c9b96edfb45c4f72e7c4d7a431195bda28686f8
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/3e4c97de2dd4f29dede990f4267d35332c0f045c
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/1e449b0f6fc2e4fd55371d9644dfefcabe7bf774
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/fab0a7846e57e273843c3bcd409949cecaeadd07
    mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/0fc76dd9e39665580029f77a18553cebe33a6266
        sh4a |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/61a8b4551eaeb5db8503f87e38e020023fefc0cc
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/7b8dabc2ccdac0f58dc9ea0a8c249472a895757e
         arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/812f920b71b316564c2016c27788921fbb4c3d84

-- 
http://autobuild.buildroot.net
