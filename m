From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 07:08:36 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-12
Message-ID: <20200913070843.BF8DF2034A@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 18  |  3  |  0  | 21  |
  2020.05.x  | 22  |  2  |  0  | 24  |
  2020.08.x  | 16  |  4  |  0  | 20  |
    master   | 128 | 64  |  0  | 192 |

Classification of failures by reason for master
-----------------------------------------------

                       iwd-1.9 | 10
                 gnuplot-5.4.0 | 5 
             kismet-2016-07-R1 | 4 
                rocksdb-6.10.1 | 4 
              asterisk-16.10.0 | 3 
                 fwts-19.09.00 | 3 
                   libcap-2.42 | 3 
            live555-2020.06.25 | 3 
                 opencv3-3.4.9 | 2 
                 uclibc-1.0.35 | 2 
                  weston-9.0.0 | 2 
             babeltrace2-2.0.3 | 1 
              bitcoin-0.19.0.1 | 1 
                     efivar-37 | 1 
                      ell-0.33 | 1 
              fstrcmp-0.7.D001 | 1 
                   guile-3.0.4 | 1 
                harfbuzz-2.7.2 | 1 
               host-efl-1.24.3 | 1 
              host-grpc-1.31.0 | 1 
                 htpdate-1.2.4 | 1 
         libcpprestsdk-2.10.16 | 1 
            makedumpfile-1.6.7 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
                  pdmenu-1.3.4 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
            qt5location-5.15.0 | 1 
                re2-2020-08-01 | 1 
   sofia-sip-1.13.1-d10a3d268c | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                  uhd-3.15.0.0 | 1 
                       unknown | 1 
                    vlc-3.0.11 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/15036059e50440340d07cfc30b119d1d55e1aa9e |     
   x86_64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/3332f1090d0e78c6cea37831b3d3b5af04feb24e |     
   mipsel    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/7b4a610048a5c3564904bab30454b42a6455c8c7 |     
    mips     |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/ff41326f913e71f982b3d5cbaf054f8be47913aa |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/94a1b3214070dde786e3edcc8a344840540f7988 |     
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/6f2cc81d15e1fa35858539ffa6f3f871a16175e4 |     
   mipsel    |            ell-0.33            | NOK | http://autobuild.buildroot.net/results/f7d757ac2c21d1f409e92be5a7423f283e1a1b65 |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/7f8d452d35d20680caacd77d145f6565e20be827 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/5da72e121413f92ea8b959f4d1ab08e9ebf5a4af |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/591ea6fe819ab46c2c944564459e1112c6677658 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/d58f3799a9c6229c7497e157426fb3135a26b6b0 |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/402f8e8d554dafaff12155ae84d9b1cd583e98ff |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/d9464495003b5ee04c1ad92dc17abf0d7e1215dd |     
  mips64el   |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/f91df992123e90438b03c2fcb8df7498779474fc |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/17499fcb912fc526ba7e085913690a1e8b4216a5 |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/3b511ac9bbb756bbede3fbcff4c1f46b8caa9d01 |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/0142223ed67de4b29837e03729687dfd2a7250b0 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/19388e726d3855819a363cf4126c622ae16a7281 | ORPH
  aarch64    |        host-efl-1.24.3         | NOK | http://autobuild.buildroot.net/results/ca125b7c5cd401f0c292a829cb3f04386b5968f5 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/7a4b726d530b3236409c725924f654a1f5afa8df |     
    arm      |         htpdate-1.2.4          | NOK | http://autobuild.buildroot.net/results/ae946ca72238840b3eaa5fe823e8d620618f7462 |     
  powerpc    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/eca57ee03220cb9dd3b4c63b736dbb44c22866ba |     
    arm      |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/82f55b832183bd4c5ed3e8a7cf68b83cdea1b966 |     
  powerpc    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/7ef92e15344becba43f03b1bf7181fbec255543a |     
   mipsel    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/9757d1ae52e00d9d2c15e4b3fcdfb68ffdae2dc4 |     
  powerpc    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/24afb660f03ad6ab464c00b30e875f56e9b3abb2 |     
   xtensa    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/0d04f1e6477a3f1abcb4f5a63aec7d00a1c6cdf2 |     
    arm      |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/e1658379c5f147ff1a7866f646315ea92bf5c4b1 |     
    sh4      |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/b28485730f1de49f7ccfff5cf29f2b7c602eb36d |     
    arm      |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/b34030d0c967fdfaea3bef30e25b89bf75d70266 |     
    arc      |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/d1f571ee20f39507e3a5a4d5ec8173305838dda7 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/51945d4bf46c0dff8e356bc59f9da197dd683764 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/bcea94786a6e643765bf1aa123bd374ed87ca7bf | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/fd3886c982f827aa4ae4b978728b813971a43508 | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/869849335735087f8b06b0bf62b4d375d60ae219 | ORPH
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/5a83a25352a85b0e911d51168a47a048820e06e2 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/795ecee0a13d7b11042250fb0f5a1fb31510e068 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/70c319465597f7b05e4966f4fe8927226c084444 |     
 aarch64_be  |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/c82f767f38e65bc7520119aa2b761dbec4811e89 |     
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/8da3efffbbab76f269f5df9e08d1502d0a0e0155 | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/3593fab2b79d1fd21f8ac3c9b33fe4e5a3827d9a | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/78f3a8da44f6e3b87b5cccd21ec45a6bf6b72f14 | ORPH
  powerpc    |       makedumpfile-1.6.7       | NOK | http://autobuild.buildroot.net/results/dda174ded49d5440abacd466a96683bccf9a4a39 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/fe9b2ec05fe6ae8524d91c7761a0190bb174284a |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/34ced712c9c2cf2d264b8a5e5546a3202e430f56 | ORPH
    mips     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/f12371cb346f0924495de5138da4d0a844ec435c |     
  mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/451cb5e6a5d8d8b10bfefee9413272c125fc3f92 |     
    arm      |          pdmenu-1.3.4          | NOK | http://autobuild.buildroot.net/results/78946a381f9f70975b41d24b0b050ba2073d6ef8 |     
    arm      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/f82a9bd296494138d0a52577e66d2aa8b1076404 | ORPH
   mipsel    |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/0f2a0f6a072dd4d34e43ace00ef49658eabf80af |     
    arm      |         re2-2020-08-01         | NOK | http://autobuild.buildroot.net/results/df7244d0c8b017b2685bf37f01f9744f672ef2a6 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/3e4b947323175ce437c9ac53fb2183d974dacfa3 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/f829258c940754c7d1eda9b1c41e22094eb7c7fe |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/3d71d06d625d479eb07b6f8c2e91bd1a556b3b63 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/ce90df6f364e8a9f751b413c6ec958eb95e36401 |     
    arm      |  sofia-sip-1.13.1-d10a3d268c   | NOK | http://autobuild.buildroot.net/results/8a0c9dbad74a3b358f90c7a3b56b638c4bdb8045 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/f4ff4856ff05012e9b44b0cd90a58a01eaf47a57 |     
   xtensa    |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/d39cfb0d43421915d9d780c9a5b5529403acb68b |     
   xtensa    |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/06b0cdb7a4b74874d9a2a58d1bfb486d964e91e1 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/a1360c45c70aec9af0c6c9bd8728ee9316d6120f |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/21dd73705287c1c452f117a3d7d810669a32e590 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/40e20c3cbd4335acea60b11461b3983222fc229f |     
    arm      |          weston-9.0.0          | NOK | http://autobuild.buildroot.net/results/647a8e90cab9a85341a64adca852a9584ddf9390 |     
    arc      |          weston-9.0.0          | NOK | http://autobuild.buildroot.net/results/c3f74976f321e48b660b6bfe551028cfc7c46e68 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              bitcoin-0.19.0.1 | 1 
                  luajit-2.1.2 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/8490f90f237cccf4977274e5e66029beb6cbd940 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/fef269a772092cd919036224b68dca601911d0b8 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/758c0d7cea8af5b91cccca04d038dd97bc5d7de9 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

              host-grpc-1.25.0 | 1 
         uvw-2.5.0_libuv-v1.37 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b23461c128c8cd3ced77cdc11e516f688f5aef96 |     
  mips64el   |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/b7391fa9d5737a65ec521f4f8faa36906a513049 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                  fbterm-1.7.0 | 1 
      gst1-plugins-base-1.16.2 | 1 
               host-efl-1.24.3 | 1 
                       unknown | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/71cb49aa2707dee908d5df1557cad4f9e25b6f2e | ORPH
    arm      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/741851a0fbb75447d24c675a0fb745ae021236d7 |     
   x86_64    |        host-efl-1.24.3         | NOK | http://autobuild.buildroot.net/results/de095c1629ec41d77cd7275b4d2f4a8c8f418294 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/2f63b08b65b1ce4c9dea8ad58d9ec1b478a32337 |     



-- 
http://autobuild.buildroot.net
