From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 12 Oct 2018 08:00:31 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-11
Message-ID: <20181012060031.36AE4207BB@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-11
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  31 |   1 |   0 |  32 |
   2018.08.x |  23 |   0 |   0 |  23 |
      master | 186 |  47 |   0 | 233 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  samba4-4.8.4 | 1 


Detail of failures
------------------

      x86_64 |                   samba4-4.8.4 | NOK | http://autobuild.buildroot.net/results/c71a16b33e42fef2995c3b6fab69497b9d8fa953 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              ptpd2-ptpd-2.3.1 | 13
                  xerces-3.2.2 | 7 
 Makefile:709: target-finalize | 3 
mjpg-streamer-f387bb44e6c08... | 3 
                  cc-tool-0.26 | 2 
                 minizip-2.5.3 | 2 
                   netsnmp-5.8 | 2 
               target-finalize | 2 
               boa-0.94.14rc21 | 1 
                   botan-2.8.0 | 1 
     docker-engine-v17.05.0-ce | 1 
                libmpeg2-0.5.1 | 1 
                   luvi-v2.8.0 | 1 
                   mimic-1.1.0 | 1 
                   mpd-0.20.21 | 1 
               nfs-utils-1.3.3 | 1 
    perl-class-std-fast-v0.0.8 | 1 
                    pigpio-V67 | 1 
                      qt-4.8.7 | 1 
              qt5wayland-5.6.3 | 1 
                     vlc-3.0.4 | 1 


Detail of failures
------------------

         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/a6f32a3f053daebfe9b9889042a5a69fd87f9563 | ORPH
         arm |                    botan-2.8.0 | NOK | http://autobuild.buildroot.net/results/c15715a05a41035954f32510483314060ea31260 |     
     powerpc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/09145641a2befe7d9e269325bd6c6372b10f3318 |     
     powerpc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/d77cf3f630120d832debeb7beca98c92e59622ef |     
         arm |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/86d00f87669a210d5732c0a166c8b021f9147082 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/d02cda7fd4abab2c8aca46abbcbf58a0a0c40ce6 | ORPH
         arm |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/1aeeaebd4ded230e3d3efc2ebf63f045e90dd75f |     
      x86_64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/064b18ddc8ea01fcb49e8a5811cbfe8ba83e0262 |     
        or1k |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/cc830c621e968ba3ec3032febf50798d5d216f33 |     
      xtensa |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/a5772fa43cb266ebb965aa366842f4f3935a9845 |     
         sh4 |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/7d4f5db92320b414092f041f30e6d395d0f312ee |     
        m68k |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/325ce2049f837a93a2900cd2e89a912a6e1851a9 |     
         arm |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/2f2ec412d1c34dce0466af8150d070894183df14 |     
microblazeel | mjpg-streamer-f387bb44e6c08... | NOK | http://autobuild.buildroot.net/results/3da3f4099ccf62a314c099c5720dd5b1e9463914 |     
         arm | mjpg-streamer-f387bb44e6c08... | NOK | http://autobuild.buildroot.net/results/91fa80348db0c248649fe003df2dfa854f37a5a2 |     
microblazeel | mjpg-streamer-f387bb44e6c08... | NOK | http://autobuild.buildroot.net/results/10438190453bd7ef7cc157929e74a9ffce9f7fdf |     
         arm |                    mpd-0.20.21 | NOK | http://autobuild.buildroot.net/results/9e1c4d73949557bcadce5aba3c11f4277e7b503e |     
      xtensa |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/d3606a500276972c6f7097cf111d7e975a48b3d8 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/126805e500c228d70c66b5c67e982d7a63243953 | ORPH
         arm |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/4234a0d40a8f41ed905e55dd05b334ed3d74959c | ORPH
microblazeel |     perl-class-std-fast-v0.0.8 | NOK | http://autobuild.buildroot.net/results/519538b05e6977a7f5aa17637fa2704981fec118 |     
         arm |                     pigpio-V67 | NOK | http://autobuild.buildroot.net/results/2f64c993db402decf92a5f8010033acdbc6b884f |     
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/501917180484f5e76c4eeb0b441d04cf229aac32 | ORPH
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/eaf921a3a1468c77a36a2626dc068a8d816d62af | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/ffa28ee2cecc77d66d934fdb03e1f2014189e45b | ORPH
       nios2 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/98c808e91b7bfc6d2520a8d31c37ffa5e5013675 | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/9826a097c718f63d9be5e497ea44ad7d94521206 | ORPH
        mips |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/36c154ded737ecb0518ab805751543bf3ee37cd1 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/95a8167c1692785b0e078c139e31052dd0df2872 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/7e452ef5a51a4485e63f1ce1da4b500e2f17a8e4 | ORPH
 powerpc64le |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/9fc3528399bd39499d708c46c1fd57cdd03c4c47 | ORPH
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/a9a892463d575602f45f19c647bdacfa2a4200f5 | ORPH
      xtensa |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/8af157317161f1d4da0f0ce2483f55f7088d41bd | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/ac3f201630ee0a75b095d6b25b9e7f49402ae24b | ORPH
        m68k |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/357655e1a823882a3ce43c091576a060f2f3f294 | ORPH
   powerpc64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2ecb0e4148e986998a0d1ef17bdcc4af389a1781 | ORPH
         arm |               qt5wayland-5.6.3 | NOK | http://autobuild.buildroot.net/results/5b83ee6893dae5d7031fb4373400c0bd3deaf2d4 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/70d5fb3d2bf9f95736e7ec469c795e8f87ec7bf8 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/ff45e5b913c75b9652e791636b4f37ca20c4bb84 |     
      mipsel |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/07b84073b9a0e45e08a77727f6810bb4d114caf5 |     
 powerpc64le |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/09504c49edf9d2c3c391613282f49ca437b33efb | ORPH
   powerpc64 |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/784918c58310474e8b4a0b42850a55ba35a1a19e | ORPH
        m68k |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/29ca90fff2c8e38f2edf7240eca3aa3fe7397c45 | ORPH
         arm |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/63cc4d3d69db19d0c639437d6996f881888a926b | ORPH
      mipsel |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/7f02a684e6788ee561311d984ded0b22066ec1d7 | ORPH
         arm |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/5c01093389e52f3eb0860550e002fb7f84678a7e | ORPH
        mips |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/4482e2d721f81edcf0cd24c8cc576fe31a06fd19 | ORPH


-- 
http://autobuild.buildroot.net
