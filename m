From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Mar 2019 07:00:48 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-15
Message-ID: <20190316070053.82CCB85E06@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-15
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  11 |   2 |   0 |  13 |
   2018.11.x |  34 |   1 |   0 |  35 |
   2019.02.x |  15 |   3 |   0 |  18 |
      master | 202 |  54 |   2 | 258 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
               host-efl-1.20.6 | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/b6dbb677e3a851c673e7e09a0e3f65c19b3caa4e |     
        i686 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/b3bfc0b28e664505ffffa30e127f03daef5630c6 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                poppler-0.59.0 | 1 


Detail of failures
------------------

        i686 |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/d9edf7463cfacbe26b121f1cafaf30688b7756be |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          imagemagick-7.0.8-27 | 19
            optee-client-3.4.0 | 10
      host-uboot-tools-2019.01 | 5 
                qt5base-5.12.1 | 5 
                   netsurf-3.8 | 4 
         optee-benchmark-3.4.0 | 2 
           uboot-tools-2019.01 | 2 
                   ulogd-2.0.7 | 2 
          wpebackend-fdo-1.0.1 | 2 
                        glibmm | 1 
                  linuxptp-2.0 | 1 
                  monkey-1.6.9 | 1 
                       netsurf | 1 
              qt5wayland-5.6.3 | 1 


Detail of failures
------------------

microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/916fc833a3563fabf6c80780549b82372f2237ef |     
 powerpc64le |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/0db6a7e51bde78d22561e6258e489c04dceba524 |     
   powerpc64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/56720e061d4eec7ac71446570cbbd239fceaed11 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/6b98c2d29f547409baf51c2314fa1d6fcf3e3702 |     
 powerpc64le |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/d3f8c1cf153d752e6b6d98604c7e8dd89782a798 |     
     powerpc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/40104b7649d353ce76f23535a1fae63fb08a3467 |     
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/84a8a3a3117eb9a89f66586a9396a234c76bd941 | ORPH
       sparc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/19e3ffc82a9d36c5904ecfae01c57c9e8a37dd4b | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/ea71248c6df6e5d819ecef455999bca1160416ee | ORPH
       sparc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/91c708f350ffbed47c266256900e8e23d38fb5fb | ORPH
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/75c819da1998142e6a45696039f66279a5b6f05f | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/e62b2eaaddaba13f5d5d186c582b4be502734ba7 | ORPH
        m68k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/6b225cbd0d5d8876381278745014cbfd0cc00be5 | ORPH
       sparc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/94adc4b7e69d6703a1d089391a5860558a1229e6 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/183a1fe8d3e0987e5c14a5098d612b85ea3069c2 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/96085bbc86d004cb738c5d691ee3dcb99545bfd0 | ORPH
      x86_64 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/93bfb415de73de3acb1bd46fd4f6eade111bf88d | ORPH
        m68k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/60d39b57e3b943a56de1dba71fec957620a5088c | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/84b40cc41768488fafe8a3218c788fd9593ee71f | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/c068f730ab46c0a502251aae0bf9e90808e9b669 | ORPH
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/d458427b295a206a4c088e2b71e85a4f236850fd | ORPH
        or1k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/9290e81a97c0bbf3d0c647341777769b5cec04a8 | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/592fa3810bdcb65b7072b27738e9df7606c01352 | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/72514b33292486d6742403d8434ffc8ff09f48fe | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/74f25c49310bc322db60b6810a2c7a15bf61ed5e | ORPH
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/bf29859cf5c1b4c237374eabb46cb3dd02a0a485 |     
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/3a6af125d004c8550a3dc62a4df9235a3d83badc |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/6f8958876257f3dc778884057fe63d9e6a1ea1fa |     
     powerpc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d4ebded04fed037c0f916c8f79e0406c86bce57c |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/9d1e13d78bd7b82d9ae9cdf0a8d7a56272eb0972 |     
     powerpc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/8273eb78e9c6258d67d20a60b5fdafd1adf67441 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/891c73a78126b58f52c6f7a4d7e521a9135f97e4 |     
        m68k |          optee-benchmark-3.4.0 | NOK | http://autobuild.buildroot.net/results/ea61442275d1790a29e02e2fa27f072e4c12daa7 |     
         arm |          optee-benchmark-3.4.0 | NOK | http://autobuild.buildroot.net/results/a04261567aa8673562b5832cbb4de15bba673afe |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/8fc410b07ea33d3be227db29d670d1d26c16510f |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/1c866f798613f5f894a35624b7aec635c458db3a |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/c12142b910845e9b9239054c611edcc54e65bd2d |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/188b87565d15860ec019ea49d585ed55cfb70b7e |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/e3b4741deac4230a8a56d0076bc86b76906dc981 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/65e1b924f158269e0aa916d43f047a089f11cb05 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/83123c594eeab1c6a8aaa81e157091b9a907d292 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/e9b8241d8d8c6847d9ca169b63adcd9c6dc77e99 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/0bc22a832a50a686f86302f93116c494c811c18b |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/e2e49831020435c1be1a8904efb9194c0f08961c |     
  aarch64_be |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/beff9cc73fef04d08d9b8f5de4107953ecdb6fdb |     
         arm |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/85df78bd5df252b64fda7297469402e1d94f6d5c |     
  aarch64_be |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/c820be282f63d7b7eb6a39fc8275e17b8ea3f2eb |     
  aarch64_be |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/7e9af80caa66c693fbc67578d679da155e818ec7 |     
      x86_64 |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/d46740e4456d412656d66d038971904cc57f860b |     
      xtensa |               qt5wayland-5.6.3 | NOK | http://autobuild.buildroot.net/results/b2ac8307623f2ef89ac86459c468d540e138028f |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/e65009c633b5d5be7b00ffafd7d4c4c33e4d0669 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/7ab8b9879f327e323f2a4015a4b20afe8729a7e3 |     
        i586 |                    ulogd-2.0.7 | NOK | http://autobuild.buildroot.net/results/6f13d77b33d291cf488645dd94dcf7c4cc8f38ed | ORPH
         arm |                    ulogd-2.0.7 | NOK | http://autobuild.buildroot.net/results/26fefd491a8a313c12d62c5f522ddfd48decf6c9 | ORPH
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/f9f33e5549ffbe178209a2c9d0afc6ba3f3e6cd3 |     
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/9ae3e20fbc15fbcd6dd76744f35f4862dd715fe1 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                  brotli-1.0.7 | 1 
                   netsurf-3.8 | 1 
              spandsp-20180108 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/66dce58bd3d791512f45f88e68f2493b15c76432 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/261a2b74391ef3d55cee26822fbcc3084371d55f |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/ed1adc7389d4fcad141310a7d88f554542f5f250 |     


-- 
http://autobuild.buildroot.net
