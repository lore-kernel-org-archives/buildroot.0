From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Sep 2017 08:30:44 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-11
Message-ID: <20170912063044.68261208F0@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-11
================================

      successes : 147
       failures : 41 
       timeouts : 0  
          TOTAL : 188

Classification of failures by reason
====================================

                openjpeg-2.2.0 | 15
                   luvi-v2.7.6 | 5 
       gst1-plugins-bad-1.12.2 | 4 
         s6-linux-init-0.3.1.0 | 3 
                 lcdproc-0.5.9 | 2 
                     mdadm-4.0 | 2 
                       unknown | 2 
                  cc-tool-0.26 | 1 
                 ibrdtnd-1.0.1 | 1 
                libcurl-7.55.1 | 1 
                libmbim-1.14.2 | 1 
             lttng-tools-2.9.5 | 1 
                   mp4v2-2.0.0 | 1 
                    mpv-0.25.0 | 1 
                  stella-5.0.2 | 1 


Detail of failures
===================

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/f07514b2d4d6504e7685274d784e1fbc71cb32c5 |     
     powerpc |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/6505a4452e296aee7ed6a56da58fd3ff782dbfc7 |     
    mips64el |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/fe147d0a7a6a9fba33c18a7651629ace124a2457 |     
         arm |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/7cf3be234cc422560dbad892f3085597710fcf97 |     
       nios2 |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/342877a2b7fcbbc1805606871bdd299d288afcb2 |     
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/3b1f26c754299f2882013b2a26300e53658c82d0 | ORPH
         arm |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/d3c267c40ccc9c453878201fdb36872e08e887f5 |     
      x86_64 |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/f8f529b0de79084c950c0a34c4269ffe79207663 |     
         arm |                 libcurl-7.55.1 | NOK | http://autobuild.buildroot.net/results/dfd296086d0d6bed73b92fe2fa4ba5434dddf796 | ORPH
        i586 |                 libmbim-1.14.2 | NOK | http://autobuild.buildroot.net/results/bb75d7f1efb86d2bbe37bba0b724f68b07bc0b52 |     
      x86_64 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/3825c88bb8a23708e4c2fed99f2417555078c65a |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/0806b7cc46eaa62df3948029e81f2780a7a092fa |     
     powerpc |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/18aea043ca8dede08e2aba644c9fbf31dff2e179 |     
     powerpc |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/961796c947c57aed026dddb912d1f6727589c28d |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/3d3ea9061b5889d42f6f70370de77e598ed2b729 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/ee4a1dd5e53177c09d2c8e154c5dd526a3a4ddbe |     
         arm |                      mdadm-4.0 | NOK | http://autobuild.buildroot.net/results/ad346b5e458edc1628971d5fd8d6e7aa8ae58d80 | ORPH
         arm |                      mdadm-4.0 | NOK | http://autobuild.buildroot.net/results/94dae5bce4bc61559a111e8b597df32167f3b8cf | ORPH
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/b90c5275590a5fc84b7afcbf1274b52213dc880c |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/c042d1c2e2b4e36aee41c2b920fe175110354945 |     
      mipsel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/fa54e9663b8b9be6b2e0016a8daaf51dae1135b5 |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/8efcfe8209516ca5e7c22b5095f5baa8e49e2422 |     
microblazeel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/edf63013e5c12f4b82848ac16858eeafacec626d |     
    mips64el |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/fc2970bae8eecfd2e069fadbb26657a909c60661 |     
      mipsel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/96fc73569941578248d3683a86ab1554e7a17393 |     
microblazeel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/c635555e9fa9646630e45b8f9758acb997b002a4 |     
      x86_64 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/9e4d5aabd4739781c0ac4ddb459fff5ae15d44a6 |     
         arc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/59a6bbb092945a8e897b9bb40130275e4adee813 |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/fc41ee412995dfcb7464e3e354e2e1d1c685b867 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/fcdf2302be2ab670706948fe58b15c8e5aaef64b |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/5e58b903df16646a309b3f37d5a1cb149ecdb353 |     
         arc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/a2576ec52bf0847793ff1d22eaa25c5c18378e20 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/a61b382e03d15cf1cfa728d8d89d670a86a7c10a |     
      x86_64 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/9294d6dfa5f4d96515c60f22ec020c3ddedb7eff |     
         arc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/024adee47adbca41b5422737fc9e7a8bba522407 |     
      mipsel |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/4dac9d4f60d6c1aba9e2ef7218531998eb80a72a |     
      xtensa |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/fc198289067a41c33905508790458aa6530ed22f |     
    mips64el |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/ce36a9f6f94e38e87083689815ca27b024c793cb |     
         sh4 |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/8e3ac4105379364b96258482ceda36e8a8134d7d |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/063e878e66a348efd81806a591971ece2981d8a0 |     
       sparc |                        unknown | NOK | http://autobuild.buildroot.net/results/3b90bd8cbeaef86dc08e4d86eadd231eb7c119a2 |     

-- 
http://autobuild.buildroot.net
