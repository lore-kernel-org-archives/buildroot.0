From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Nov 2016 08:30:56 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-04
Message-ID: <20161105073056.4969320D86@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-04
================================

      successes : 179
       failures : 51 
       timeouts : 2  
          TOTAL : 232

Classification of failures by reason
====================================

net-tools-3f170bff115303e92... | 9 
                 mesa3d-13.0.0 | 3 
                    mpv-0.20.0 | 3 
tvheadend-50a370707aedf5c12... | 3 
                     vlc-2.2.4 | 3 
kvm-unit-tests-5731572b2ac2... | 2 
                 libnss-3.27.1 | 2 
        lttng-babeltrace-1.4.0 | 2 
make[1]: *** [libavfilter/a... | 2 
                    mpfr-3.1.5 | 2 
               sdl2_ttf-2.0.14 | 2 
                  stunnel-5.36 | 2 
                   assimp-v3.2 | 1 
             berkeleydb-5.3.28 | 1 
                coreutils-8.25 | 1 
                    cups-2.1.4 | 1 
czmq-5205ec201e97c3a652c17e... | 1 
      docker-containerd-v0.2.4 | 1 
                  lcdapi-v0.10 | 1 
                libcurl-7.51.0 | 1 
               libepoxy-v1.3.1 | 1 
                libmpeg2-0.5.1 | 1 
                    ola-0.10.2 | 1 
              ptpd2-ptpd-2.3.1 | 1 
                  samba4-4.4.7 | 1 
                   ser2net-3.0 | 1 
                     wget-1.18 | 1 
                      x265-2.1 | 1 
                 xenomai-2.6.4 | 1 
                  xl2tp-v1.3.6 | 1 


Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/394e3545a7bbe5d6fbaf4c97f0a3eb51c7d57076
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2db355a619d014c27dfc65abdb76e341021cdceb
         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/c297e4ea8331812d003c15d96854c8d55a0aede2
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/580cab88193fd024976b4550c9543364b83aeda4
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/f6e4b8ed8571fdcf30eecae121dd11dfdef50799
   powerpc64 |       docker-containerd-v0.2.4 | NOK | http://autobuild.buildroot.net/results/fadd8c529d8e6ef46161be9b7c916b22d46bf3ef
 powerpc64le | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/3f58bbf6835ea797e2ae0bc1a89344b674675089
        i586 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/a302400a3cb405d65e6b7878ba52ccaa1ae46ac4
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/22f29f14470167511e5d07a91f994211271072b5
     aarch64 |                 libcurl-7.51.0 | NOK | http://autobuild.buildroot.net/results/288f9b592d74acd9c97991ca983c0226fa86eafb
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/c49737f01f8aa855525e07c88a5850e7d97446c0
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/9c44de035ce81c6cc8a92ea8bad4def25cd99cd0
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/438601160baa9d5fdb273c1a5a3930f104fb04d7
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/d23ddde777e92d1b9206ab495f2d6f9be3df6334
         arc |         lttng-babeltrace-1.4.0 | NOK | http://autobuild.buildroot.net/results/30ab515aa7b3972d7d1d9a1ac2955ac07eb23de9
         arm |         lttng-babeltrace-1.4.0 | NOK | http://autobuild.buildroot.net/results/99362910e259f6136520ba459d32c1a11413b62a
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/c45f085ca421b12195fe6a9298b3b3a9cb761360
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/349de9b8251b9b72ace595920303e45497833c29
      x86_64 |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/e27a9a95f72dba3076549beb2a2ccfdbea2fcfee
         sh4 |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/1eeeee4c119490edf8f24b5a638afae2a55bd5cf
         arc |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/e6376ecbd9aed205b765220b17d97152bb5b51ec
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/65c8c691b242ab4cf673cb062451936cc7febb25
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/83631f51bd744d78df8cd79192a00e35a7af353c
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/79673dc47ca1d2de5066495f1c16f00f42cddec5
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/ae57af5dce3d119d6bca6128b92a5e2f07da437c
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/d0413ea2f8b7a71b6ce8c1e65698042643402e6e
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/74fd19b5f4ebe0ae1a40c275b741bf4df34ba8c2
    mips64el | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/d9ba8f9ad9ca71a4b7255aafbe6f5a783879c54c
     aarch64 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/40d0b350b88630bcbb84f97569102dc0d0c1339e
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/9601f030af9e4370d1aea9fa9615c93632be767b
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/6d885707a1657c7c8b8a6370bd3cedc2e168318f
     aarch64 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/1feabce320b75e95dc32f0a9d088c3419a5b3419
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/2947ba6122132dbde1aaaeff0216590566f0267f
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/b0025164be41648e88665ec6494fd2f19a5f2857
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/d59d2e277ea906c18f7a427fdd91a41c82c03132
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/0c4321c1a271cc605c004f52fcf28db5d2d5dbee
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/61fe657103ca3d98f855557a81531530aab2bbf2
     powerpc |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/47fe014729bd9199f69b6394b4699003cb96f12e
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/c999030c77d236a62364648399686d0712c62fd0
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/bc3684ea9fa88ab0dc633ab841cc2016aacde9ae
        i686 |                    ser2net-3.0 | NOK | http://autobuild.buildroot.net/results/b4c87408c685afc7cfc1426ad5e7b927fc299d2f
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/076fca0b0fd58ce920852c3375529335a238bab7
        i586 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/b7a1ce37736577ccd57ba9831478fb04948c01d5
    mips64el | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/42a515acf4693cce344ecaad4b0077a44a17e6ce
       nios2 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/86f21884b08c4e8b4b77de4a6f72f1a5cea52400
       nios2 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/8098ebf879b659c4da5c8d2d2cbdac5dd3d272ec
   powerpc64 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/0d8c04008c321bc6dc64b7de79c15b84ee88a023
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/f35235936520e572084fd8562ef2aa19a8c6ad6b
    mips64el |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/66eedd0093ba483923aa8843614db1c35e14166a
         arm |                      wget-1.18 | NOK | http://autobuild.buildroot.net/results/c6abdff37b86471cf8b0ceffeff5472042923de0
         arm |                       x265-2.1 | NOK | http://autobuild.buildroot.net/results/c6d3fea9d5b4ea88bf2203030103bc951c3759ee
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/0c2e5eb4edd4f9427f61d3c9b67a12a7a0e24140
      x86_64 |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/cdcca29cb8763df9bbc9b790dbe14ce32046aa6b

-- 
http://autobuild.buildroot.net
