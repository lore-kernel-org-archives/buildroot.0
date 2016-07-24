From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 08:30:27 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-23
Message-ID: <20160724063027.25117102344@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-23
===============================

        success : 211
       failures : 93 
       timeouts : 1  
          TOTAL : 305

Classification of failures by reason
====================================

openblas-f04af36ad0e85b64f1... | 8 
                   dante-1.4.1 | 4 
           libmemcached-1.0.18 | 4 
                  libsepol-2.5 | 4 
                  fbterm-1.7.0 | 3 
                  connman-1.32 | 3 
                  babeld-1.7.1 | 3 
                   cmake-3.5.2 | 2 
              libarchive-3.2.1 | 2 
              gnuradio-3.7.9.1 | 2 
                openmpi-1.10.2 | 2 
               linux-pam-1.2.1 | 2 
                acpitool-0.5.1 | 2 
           uboot-tools-2016.07 | 2 
                pinentry-0.9.4 | 2 
                    mpv-0.18.0 | 2 
                    libiio-0.7 | 2 
                  nginx-1.10.1 | 2 
             bluez_utils-4.101 | 2 
                  cairo-1.14.6 | 2 
                   fwup-v0.8.0 | 2 
               libcap-ng-0.7.7 | 2 
             transmission-2.92 | 1 
                poppler-0.32.0 | 1 
                gnuchess-6.2.1 | 1 
              kodi-16.1-Jarvis | 1 
                flannel-v0.5.5 | 1 
               audiofile-0.3.6 | 1 
          chocolate-doom-2.2.1 | 1 
       directfb-examples-1.7.0 | 1 
                 lvm2-2.02.159 | 1 
                     eudev-3.2 | 1 
                 libunwind-1.1 | 1 
                  boost-1.61.0 | 1 
               tpm-tools-1.3.8 | 1 
                     mtd-1.5.2 | 1 
                    qemu-2.6.0 | 1 
                  samba4-4.4.5 | 1 
                 jack2-v1.9.10 | 1 
               runc-v1.0.0-rc1 | 1 
                     xen-4.6.0 | 1 
                    lftp-4.7.2 | 1 
                    owfs-3.1p1 | 1 
                wayland-1.11.0 | 1 
                 lvm2-2.02.161 | 1 
                  rt-tests-1.0 | 1 
                blktrace-1.1.0 | 1 
                    gdb-7.10.1 | 1 
                  libffi-3.2.1 | 1 
      host-uboot-tools-2016.07 | 1 
               lighttpd-1.4.40 | 1 
                 opencv3-3.1.0 | 1 
                   assimp-v3.2 | 1 
              ptpd2-ptpd-2.3.1 | 1 
              gettext-0.19.8.1 | 1 
         systemd-bootchart-230 | 1 
                  ffmpeg-2.8.7 | 1 

Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/12fcdc6c79e22de22f3bfbbb21c0e8dafc813ccd/
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/793892be156ea90bd8b52946cb00b96d59fb0ab6/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f33d3af075fce8bd99c409f9caf6b0fe271ff01d/
        bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/7a3bb45a825dba3739a32a6c4efb536c8abb7838/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/f07a76c19ca15f1243c3a2f43f3a3ab1e4a2ff2e/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/44cc9faea4b1834657ee9bed5747ebca29d7c332/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/91333ff05d8c994b7bb9ce60f056752f40b94d80/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/6f510fb74f9967057ea05d06265e91183574a37b/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/5a4b1ab071a276ec1c7f15f16df68c81d5592618/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/ce2ce82371a0aaf1e0b223afc510c9cc953f108e/
       nios2 |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/c10600c62dc4b08326b44c79a81b92464f766fdb/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/9e3bcf598672db255336e63de81e32761af7190e/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/eb337a9736eca4bf52bd9fd128fc3565413490cb/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/9a4da42a7f445d738978748707e1dab3b47219d1/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/cb99a7dfd239a3534af670ac4fa2202e867c21fc/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/2a9ad13a08ac71b0b0f5947f1918248c3d46a664/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/4a4e05091e09b08e158e7774a2072b6e760785bd/
        i586 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/745dba78fe5b7f53b606f6a378ebf1f8aa26943a/
        i586 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/9a30959e12d674d990d10718aad1fe9f4a9a4747/
      x86_64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/04055bdab00759d32d2898abb5533b973d9e605a/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/10257f4a5a705a3564b8486fb989e3adeb004583/
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/e448cbc7f995a933526d0ff1a01f973c0085fbc7/
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/79487b0955b70dda0e34cc8e182aaebdeb49cfee/
     powerpc |        directfb-examples-1.7.0 | NOK | http://autobuild.buildroot.net/results/9010cfc36a9c97601ffb7cb56e897713c7abd575/
         arc |                      eudev-3.2 | NOK | http://autobuild.buildroot.net/results/c752f10960b5a10b2bccc97831d3dc961206c39f/
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/2b7c5b330594114551c8d3a167207e6a56380c9f/
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/702d75f3033edbd1e0be56949aef1d9279128aff/
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/8bc4bd897ac5f6231ca30b991e456c2012f2ee27/
        bfin |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/63ac73b957fefd663bfa0b4e349c28fb72a90a42/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/541fbb1c8a1e82a6126867a9c152b854551e7998/
      x86_64 |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/fba44eaf9b8abbe40e3d23ff28fe248cb3108ff9/
         arc |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/98dd4f32dfe9aa0dca1751553eb516c0ea6d77f7/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/56443134388ee6c4a13add10cc53eff6f47f244e/
        bfin |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/428b390af7886e22ac067ab93bc644c64612207f/
        bfin |                 gnuchess-6.2.1 | NOK | http://autobuild.buildroot.net/results/1ac11be01fc9e3f53e71c5d49cbb78a0271da909/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/ccc3b37cb2162c41c56147f5ea29034f26eceb1b/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/595d1fbafeb3fc51dc4a9cab03a7c8f9c26c5ddb/
     aarch64 |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/1610b0ee63afaf2309c8d0fb422b72173db91b99/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d479f749cb912ba678f7b5739f671819375b0273/
         arm |               kodi-16.1-Jarvis | NOK | http://autobuild.buildroot.net/results/bc392094b5b05f5f4b4ede5ab3a54200d6d33be5/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/4dc3006d662d79f0e9e07521da5b911beacdecd5/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/f46fb53524149671cf894733e10bece9f4efb80e/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/8a3d4ecdea540500659218725329d46bba8be693/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/c046a2804e3847f986fa026f43405f3342fb7790/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/8b7bd84bbddbe23ae45a2009f7e179416f224d13/
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8ffda9b76f71eec4de375b47c9fc0c04021b9a7c/
        bfin |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/58a2bc29a167c8726fc7580ad761590d88a86fba/
        sh4a |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/41218b7786f6b030d7107c7e2c2836f3699ca561/
        m68k |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/0df38353bd3fa7b4a8c52efe7dd1262c5aae504f/
        m68k |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/a5193c842b2d7f588873ad39f0d41dbdbf34d27e/
        m68k |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/50345d3d3ddf0567ca454e64207c3d22aa60a624/
        m68k |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/489fd8ed24e0a6ddc993859533b43ecdda8f1d70/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/bc447ba32f5f170d0b1d35ca044a012960f43b09/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/5324bd592a99fafbb1a89cf918e24d9c0492df07/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/b13c98b5f0cb63c252ccd4756d62ea7ea9dfbe85/
        m68k |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/34117ebce04dd9466ba349252c829f4783e6df13/
         arm |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/4cf517cd81d3aa5da26848edaba5df0bfbab2c77/
        i686 |                lighttpd-1.4.40 | NOK | http://autobuild.buildroot.net/results/5901153a345c69d0a041309cfb79329bb42ff98d/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/0f7b8fdc2cb613089a16a075871ce73a7a6a45c3/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/a167f329d480d716610d9685f4c6fec2e525924e/
      x86_64 |                  lvm2-2.02.159 | NOK | http://autobuild.buildroot.net/results/53f6e486d4601ca74e96d1d0c85352d7c4930275/
microblazeel |                  lvm2-2.02.161 | NOK | http://autobuild.buildroot.net/results/eef69a7b44c9c8f2d09f95b25d76660499388355/
       sparc |                     mpv-0.18.0 | NOK | http://autobuild.buildroot.net/results/5a215f3425ffec71ca716c8a4626ce06660eaa96/
       sparc |                     mpv-0.18.0 | NOK | http://autobuild.buildroot.net/results/5a40d8c76f187a237890e21fbc757b67de36c652/
        bfin |                      mtd-1.5.2 | NOK | http://autobuild.buildroot.net/results/eb304b63b0e7798081edd4bb169051877fb96590/
         arc |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/500b3cabdb4eb9a5e4a7b5fc8c77709443bf2b27/
       nios2 |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/8d444028b2f6bfe9339f80e265cf1706fbdfcae2/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/5fae254057277064edba1d6f00118a34fa8ec771/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/f4f5077b52dc9af9cf0ef5198beae10001379ba9/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/6f266334c56bd17a75c330108d54e1047ae06bad/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/bacf09919fdeeeed29cc0e8ecef614e62c296cc8/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/4dfdeb5bf5e892b995c97af04b5e00e4265e9afc/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/a4f14c2cc646596e0fc50b61880da6f55aa6b45a/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/a624cbc9a63d520018db22d83e57e3a16ef0797d/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/f6a190b36cb862bc3638d7c43659f58eee85ec9e/
         sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/828b3b2454d439ae6dbf787aaa26a6793f34f6f1/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/785d9471058bc37e50ace63fa266cafe9bab6d6b/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/b0397ad10b5a7b08cc10f0dccd8a8ee97ac32440/
        m68k |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/187aaeb2905c400911a20a5ddaee1b20e3b4e446/
      mipsel |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/b9e41e7215521738a1357229e40c3c742e705e74/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/43f5bb3b0921cf78bd5bd168ec0267a6e725b203/
    mips64el |                 poppler-0.32.0 | NOK | http://autobuild.buildroot.net/results/b7eaef3c84bc7e864430af05aa6793ef91503325/
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/9b2605ecdfd78f1f0e2c5f92eb6afe64bcb4a1c5/
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/83639f38300b9bad1cec2b81e9e9a86df028a94d/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/56573283ebabe89599dbd78e221a12362a993175/
         arm |                runc-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/212cf7c3a8d1fa68782c978a900cab04f7d39c12/
         arc |                   samba4-4.4.5 | NOK | http://autobuild.buildroot.net/results/6900c3c159e08ca2b6463aab45b6bff604ce3133/
        mips |          systemd-bootchart-230 | NOK | http://autobuild.buildroot.net/results/163313afb4f421ad28761f9992659a55ff124212/
     sparc64 |                tpm-tools-1.3.8 | TIM | http://autobuild.buildroot.net/results/e1d5fa149e97b2b629a6dbcbf45b6d4fe3e95f2b/
        i686 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/a2174500eab99653fee809073e77bbec80c4d3d7/
         arm |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/1faea54c7787826a5943fc2cd0d4db2bb51409e6/
        bfin |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/fb93e8fbe94da1c393a043dbbd354397cd06212a/
      x86_64 |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/2b63bd5607a885d265a19595566b62c202c68035/
     aarch64 |                      xen-4.6.0 | NOK | http://autobuild.buildroot.net/results/a923c6446f325f847ea0cac29c31c1e392b05f3e/


-- 
http://autobuild.buildroot.net
