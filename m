From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  7 Nov 2017 08:00:05 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-06
Message-ID: <20171107070005.BE8582074A@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-06
================================

      successes : 150
       failures : 49 
       timeouts : 2  
          TOTAL : 201

Classification of failures by reason
====================================

      host-uboot-tools-2017.09 | 12
host-vboot-utils-bbdd62f9b0... | 5 
                  ffmpeg-3.3.5 | 4 
                   mp4v2-2.0.0 | 3 
                prosody-0.9.12 | 3 
                      qt-4.8.7 | 3 
          usb_modeswitch-2.5.0 | 3 
       host-erlang-rebar-2.6.4 | 2 
       host-go-bootstrap-1.4.3 | 2 
host-google-breakpad-7515ab... | 2 
                   jimtcl-0.75 | 2 
             lttng-tools-2.9.5 | 2 
                  fwup-v0.15.4 | 1 
             gstreamer-0.10.36 | 1 
           host-mono-5.4.0.201 | 1 
                 ibrdtnd-1.0.1 | 1 
                    mpv-0.27.0 | 1 
             qt5location-5.9.2 | 1 
               qt5webkit-5.9.1 | 1 
                  spice-0.12.8 | 1 


Detail of failures
===================

         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/709da24fa597a2452ff528a5064ed3f450ecb57f |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/0c773166666130cbfc3ac6f4e51e39e896bfa37c |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/b00563c869c136eace57036f240a23079e29e98e |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/007769f9bafa03fc2784efe0175d46f52a4ed240 |     
         arc |                   fwup-v0.15.4 | NOK | http://autobuild.buildroot.net/results/a6b3052b6ecba89bce344f83eba0c38653cb3210 |     
         arm |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/889b7c5b451259a6be370bd93bb2da9837288f32 | ORPH
        i686 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/03f69aa42e288efae753a9a34c73a6227df25214 |     
     aarch64 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/4e1b9eeb3bb418d42c5f8d138dac989bf454f964 |     
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/0bb0c9f472c7c75264819d403ee361dad4ff165a | ORPH
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/d07c288bb45f4fecf70b9e0c47fd815ce4ae6eb3 | ORPH
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/e8b82c26085d787af7c99f582d9ab43606cb2377 |     
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/5045dd522e91720daa3bb8bc13d0712c7e94ecc5 |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/54a0481abb4e74cdf61a6d3cd3fe91c668c48016 |     
       nios2 |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/edda9ea57a7e459a8ba0249a8d733889edf8f34f | ORPH
microblazeel |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/9a7886ac330353561dadaf197761c65b82284935 | ORPH
      x86_64 |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/3fec4754716499a11a4a0b72b500e84449030d15 | ORPH
         arm |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/252d6b3c94e63b7905628a87eeb29bd6e0a767aa | ORPH
      xtensa |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/155855b00110460740bcfe0aa2ebad5355a95b8c | ORPH
      x86_64 |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/07457c72f0651374ccce41cf9799bfc040c2e508 | ORPH
         arc |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/907e7c66b5fec53dfa7a3984e84a3a0482d6fdbb | ORPH
      xtensa |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/efb836a1749fb7bba8db99dbe4da55906898c596 | ORPH
      xtensa |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/3a11c64065390b354b210f6194c88214381ced28 | ORPH
       nios2 |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/ab9e14a8b40bf0ef4a631a781d25c5ec0d817edc | ORPH
      mipsel |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/51f0c85b5a39ba96aef015cb690b82d5d186481e | ORPH
      xtensa |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/eb8f75f4ab0e5d510bd6c420c8b0bdaa4b061e83 | ORPH
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/60372b85d04b8e43733ec948e46628094dd988db |     
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ff05b4b6507ae9e7262f6579541e834ba6e662b9 |     
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/4d2b170045b5b39e9a62d74dc688693bf003db20 |     
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/bb5ef1c60530096501c90411a1dee26f7d4ef3c9 |     
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/33d22ae808221c29e90cd29e9952e0075bceb878 |     
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/f28980613173fd3fdd216218ab3ced92e01adb2b | ORPH
microblazeel |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/f424787197a86990577e171682e7ed8416fb0ea6 |     
microblazeel |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/284876bd649cab26e5ecd696c03c71c077ea7411 |     
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/116c68356223f1123b059b122b4a751b15bdaea7 |     
      x86_64 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/f46ba3cc8bf3ce979e9391db05780476cbba6ea0 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/ab1c2b5dd255f76e40ecd691c67b5c0bf9301ca3 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/f5ecae7923c952980891c4d0591be236c312704b |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/5f4b86c9b3c11755a3ca7e72db33f93548f27d6c |     
         arm |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/075feb0eb90dfebeacf5d121bbbc3d3ddd6eda6c | ORPH
      x86_64 |                 prosody-0.9.12 | NOK | http://autobuild.buildroot.net/results/562196650d6aea7dabe97ee6dcb2f1925280d079 |     
      x86_64 |                 prosody-0.9.12 | NOK | http://autobuild.buildroot.net/results/676d84385e0c3ddfc7a939e1b1dd929842ca5c5f |     
      x86_64 |                 prosody-0.9.12 | NOK | http://autobuild.buildroot.net/results/7f0eb285b75cdeacb21a1f9a9f64d2f0cbbf1d59 |     
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/cb29abe3ece7783089e22c71694ae13666c67d19 | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/28c08b9d525967e36189f54b6d93b0b69d9ec68c | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0e20b893c1396dd109146f79631d9d0db927563d | ORPH
    mips64el |              qt5location-5.9.2 | NOK | http://autobuild.buildroot.net/results/43794952aaacefddda954c5f0018505afa943ae1 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/d4c871a1e5cc27fe39cb22be37b61a2c92e42617 |     
        i686 |                   spice-0.12.8 | NOK | http://autobuild.buildroot.net/results/705133671b4bba5e97bd5bec3d3d8c48751401ca |     
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/fbe21bd173e6566dd93dddd58d4a848de8a3465e | ORPH
     aarch64 |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/edd9f4d598aded897e000bf8eac89aca9acb4f1a | ORPH
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/c79a6f8cb26039afb184275e46ac7e25cf4d72e7 | ORPH

-- 
http://autobuild.buildroot.net
