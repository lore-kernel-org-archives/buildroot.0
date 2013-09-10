From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Sep 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-09
Message-ID: <20130910063006.E19D94600A2@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-09
===============================

        success : 55 
       failures : 127
       timeouts : 0  
          TOTAL : 182

Classification of failures by reason
====================================

                  cpuload-v0.3 | 24
             util-linux-2.23.2 | 13
            fb-test-app-v1.0.0 | 13
              e2fsprogs-1.42.8 | 8 
                    mpd-0.17.5 | 7 
    trace-cmd-trace-cmd-v2.2.1 | 6 
                pulseaudio-4.0 | 6 
              opus-tools-0.1.7 | 6 
     input-event-daemon-v0.1.3 | 5 
                      icu-51.2 | 3 
               alsa-lib-1.0.26 | 3 
                 qt5base-5.0.2 | 3 
                   dbus-1.4.26 | 2 
                 libnspr-4.9.6 | 2 
                 dropwatch-1.4 | 2 
               libglib2-2.36.3 | 2 
               netplug-1.2.9.2 | 1 
                      gpsd-3.9 | 1 
               uclibc-0.9.33.2 | 1 
        liblog4c-localtime-1.0 | 1 
                   attr-2.4.47 | 1 
media-ctl-ac40b79f002a2315f... | 1 
          host-ruby-1.9.3-p429 | 1 
                  boost-1.53.0 | 1 
                  aespipe-2.4c | 1 
      gst-plugins-good-0.10.31 | 1 
             alsa-utils-1.0.26 | 1 
           argp-standalone-1.3 | 1 
                  libmnl-1.0.3 | 1 
               w_scan-20130331 | 1 
                  bustle-0.4.2 | 1 
                openssl-1.0.1e | 1 
                      udev-182 | 1 
                      qt-4.8.5 | 1 
                 libssh2-1.4.3 | 1 
              libsvgtiny-12121 | 1 
                  libusb-1.0.9 | 1 
           binutils-2.23.2-arc | 1 

Detail of failures
===================

       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/1a11b68e43c18fd7607212054cb98fee8945956f/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/2d7acff28510f004c6115208257f254abb1affcf/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/6eb0c2748be2d477ad969b848006e846f7d83d68/
       sh4 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/15c88a52b68780bae842a6935eaa8d38fe889925/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/90c65579212726cd25c6b07f985e32f8a194b65e/
       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/dc26061d4128d52f1ee43b174282a934eeeae524/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/ce3f42819e01d4a3df085409e940f3a4dddca4ae/
       arc |            binutils-2.23.2-arc | NOK | http://autobuild.buildroot.net/results/6d937227f9a016bd2103a3f64229fd16f1259723/
      bfin |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/680a092d30a2c3613d0c6fa5d6792da27ee3fbff/
       arm |                   bustle-0.4.2 | NOK | http://autobuild.buildroot.net/results/8510734c862547d53f6445ba4ceaecb9c80abe3b/
   powerpc |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/4030a44a7db90c28577176b39b4c62ccf756562f/
   powerpc |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/e598442b0deacb8ca65c35f6da1e4a692db5bfdb/
   powerpc |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/ec1e3478bb1ad5c2665e70aaa809f9a96c96aa42/
       arm |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/eb1f69affad447f4408b204c6ca9aeedd47e36eb/
       arm |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/70d914f072ee572d705984cd6116a0b4d6558183/
       sh4 |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/bcdf4bdca4d5f8ffc9c84afcadf1b057fc03e009/
       arm |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/d1817ba90e33d2481d625d9684162283f414f558/
  mips64el |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/46380cdae8a0b276f1887750b198aaacf2a8acef/
       arm |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/ddd0045be499b30ea5f8b86e3570122d33e056b3/
   powerpc |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/9e4ff10f64ba085b73f27b824a68ab3fa3ce7923/
   powerpc |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/bcfbc772d0882cd8b6c8dccd502d1003655648a4/
       arm |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/a98dc1aaeaacb6ba44e5d2550a777a0c88971a11/
       arm |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/3a832f434dbb80245e0f6872670013b196e58e3d/
   powerpc |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/4d8507ee7dd275f9c31dff0a57835aa5c2909e9a/
       arm |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/a8a7695751a54a1c5a31c985cf0c75131add5bcf/
       arm |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/c008286ce3cbb3cc129714bfd78b6f818c851cb8/
  mips64el |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/ee86765080758b029185529344e2b7ebace6be3c/
      i686 |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/955ed1af28f6ff9912adddc0342d1f3ca65e5b4d/
   powerpc |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/098ed06b7c97030841ac46fd92086c59bf2ae4b2/
   powerpc |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/aad9010d36daf099deddfac8aec73abc0c67db62/
       sh4 |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/143c1bc6b02bb0a3f90832077f6f0b56ae8122b7/
   powerpc |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/0a77c4a609a609759f459b59530632f6928f0001/
  mips64el |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/38e0d62a4442c62b612feab31536c9a9168bdba3/
   powerpc |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/d2adbde925d07ecdf57dc682f36c47875568a607/
    x86_64 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/f94b136a21ab7b71128eef1cf84aa08845ca7be7/
    x86_64 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/0b1b06b3ce4b650e301bbd649774ea42ad28240a/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/291f9ad7bdf6f2e9b3c7fed948ab11d472aaeebf/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/d516a0f24bbe63610a14d1dbbd3da95f529e8544/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/baa94a3ffea54d71ca599918ee1c0a0a2abc06bc/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/22631aeb2cdf27d2560ca5f7d2205ff462e97da9/
       arm |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/a9f99a1486d7798d8f6acf2cc3c85707d3a67697/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/52420a21a3cba55b0b9758e1bc8ff1eebdd5d0bb/
       arm |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/e29f92d5e466e3274c00916edf5f83e609cdf193/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/2abceff3da9224e8fd9bde69a8f7c036a89dbd8f/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/ac703e2ed65e98635704524f22bfc8e69c029395/
    x86_64 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/2c5f2828844769c9b0ea3ca993f08f0a6e88d865/
   powerpc |             fb-test-app-v1.0.0 | NOK | http://autobuild.buildroot.net/results/6a57808365561e3033fb28707da06b8c2ee4e6fe/
   powerpc |             fb-test-app-v1.0.0 | NOK | http://autobuild.buildroot.net/results/77054bd80015dea6167a39c6d3ce75a0be7495df/
       arm |             fb-test-app-v1.0.0 | NOK | http://autobuild.buildroot.net/results/9f26d14822a6baf535f408ee0b32904ee927a2f4/
    mipsel |             fb-test-app-v1.0.0 | NOK | http://autobuild.buildroot.net/results/a97b6473e62fa9b62e7dc031af7c0a74e103fcad/
   powerpc |             fb-test-app-v1.0.0 | NOK | http://autobuild.buildroot.net/results/f1ed465637df228f7cd7a05339bf7aa1dd897c36/
    xtensa |             fb-test-app-v1.0.0 | NOK | http://autobuild.buildroot.net/results/0c9fbfe6d57672b0e369764e3d4cf99b5ab92797/
       arm |             fb-test-app-v1.0.0 | NOK | http://autobuild.buildroot.net/results/51c538ac7b593cbca648221bca69770023b0aef0/
   powerpc |             fb-test-app-v1.0.0 | NOK | http://autobuild.buildroot.net/results/2f88e8367e3f033a5131a733975e5b2bb1f42278/
       arm |             fb-test-app-v1.0.0 | NOK | http://autobuild.buildroot.net/results/9a00436222d340f94d65d31ae448779e8bd073d2/
       arm |             fb-test-app-v1.0.0 | NOK | http://autobuild.buildroot.net/results/ca8bc4f3007572c1c1b9a7ebf52f93c282765a89/
       arm |             fb-test-app-v1.0.0 | NOK | http://autobuild.buildroot.net/results/821ff800accf3c8ec64d55b1855bdbc69bcd6e4f/
  mips64el |             fb-test-app-v1.0.0 | NOK | http://autobuild.buildroot.net/results/d67eb8d2221de646468ad19815687f7eaef364af/
   powerpc |             fb-test-app-v1.0.0 | NOK | http://autobuild.buildroot.net/results/c56b6fdb224a21f1f7b9b246391ccf51a4118330/
       arc |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/c99833d6299c61fd0ff5a25e31f6aa6a7faa1f3d/
   powerpc |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/03094dfe2c3497bda98f58dea6834539b67cb7c6/
       arm |           host-ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/07ae922cf24c5cb650d985c3f9fd1af2b678468b/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/509557befbc3c3875140c4c47bdedf536a739b81/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/e58caf7de479c8ac0ee517161cdff54c5593f619/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/bbd5165eee7788554597dd01567b602f6a37ea3e/
       arm |      input-event-daemon-v0.1.3 | NOK | http://autobuild.buildroot.net/results/8027322ec2c24a417651fbb1b724b010896d527a/
       arm |      input-event-daemon-v0.1.3 | NOK | http://autobuild.buildroot.net/results/85f7d67664f2806fb86c24f2e87bd72094e7976b/
   powerpc |      input-event-daemon-v0.1.3 | NOK | http://autobuild.buildroot.net/results/f94abda2e1b6d8b68c3e1dc9a9a8e4e7af254a45/
       arm |      input-event-daemon-v0.1.3 | NOK | http://autobuild.buildroot.net/results/d10de927935b864e4d1e3d3006851075613d8b5e/
       arm |      input-event-daemon-v0.1.3 | NOK | http://autobuild.buildroot.net/results/62449f96c726640dfe6342a853ecbfbb8bcadc8a/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/0b7b4e49426b01a77c76b24dc6c275adf7aaf7b3/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/8ccc64521cb2f03124c50f901e71058c1b10e905/
      bfin |         liblog4c-localtime-1.0 | NOK | http://autobuild.buildroot.net/results/639542383bc7337532637c39062364dd58bdb451/
      bfin |                   libmnl-1.0.3 | NOK | http://autobuild.buildroot.net/results/a91e45ab212243670413a453a2f121ab26c859fb/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/40cbf9d83e44c8264eadc492624304833baffda3/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/966db1c38509d396d6bdf69a53634e88810a3497/
   powerpc |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/2878bc77cb2fba44239d967784ff9b25b8081a77/
   powerpc |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/bc406ba5632accf8fab83068470cadb4ad8b3b53/
      bfin |                   libusb-1.0.9 | NOK | http://autobuild.buildroot.net/results/b58f790d5e614ec98efa0d16df6d7e9af1421519/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/18f75132d17bd81c19e0ebd9cb6821be0b4744ca/
   powerpc |                     mpd-0.17.5 | NOK | http://autobuild.buildroot.net/results/042395e3e305eb36a58f969332030c25d6b06493/
       arm |                     mpd-0.17.5 | NOK | http://autobuild.buildroot.net/results/dbcc25c0d1721317c5373151138c4f3170a4c03c/
       arm |                     mpd-0.17.5 | NOK | http://autobuild.buildroot.net/results/6cf978d2d0f8a01637332f36993c67168c08e1c8/
       arm |                     mpd-0.17.5 | NOK | http://autobuild.buildroot.net/results/91832bf5a3f65c45f28732785835924910639845/
       arm |                     mpd-0.17.5 | NOK | http://autobuild.buildroot.net/results/fd193d0bd1366ceb3dd39d359ec99fc43e6f89ae/
    x86_64 |                     mpd-0.17.5 | NOK | http://autobuild.buildroot.net/results/bcf58aed86689f49dd4472ee02607a7e784456da/
    x86_64 |                     mpd-0.17.5 | NOK | http://autobuild.buildroot.net/results/f723484795167058aae19ad63cf5ea4b23f90448/
      bfin |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/2d8439f844dabeea6d57276978877d05580dfcc2/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/a3355d2069aacf5358f744d91c3f57ed1dd6f5fe/
   powerpc |               opus-tools-0.1.7 | NOK | http://autobuild.buildroot.net/results/8914924aedab68eb307a7bbaa25d652603c1e993/
   powerpc |               opus-tools-0.1.7 | NOK | http://autobuild.buildroot.net/results/377d03f7e421401b04f590c6a6dd28b901c68f47/
   powerpc |               opus-tools-0.1.7 | NOK | http://autobuild.buildroot.net/results/bca2f5d3ee5380f59b0a3b54c238e3b64ebba0ab/
   powerpc |               opus-tools-0.1.7 | NOK | http://autobuild.buildroot.net/results/11ab329066874ce042a2c7248c57299606558879/
    mipsel |               opus-tools-0.1.7 | NOK | http://autobuild.buildroot.net/results/57f435f7ee0e6fd411ba45d3266b9288a548008b/
       arm |               opus-tools-0.1.7 | NOK | http://autobuild.buildroot.net/results/245d1b8ee54cf95b0ab7dfe12ee7c32163af7da7/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/8e0837bc45fe51a3d8a2eacbc6058201f47e5c7e/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/647b9c148ef50f921c35ea24b8499dbe9b7a82bb/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/7d827436789230e43233746a2fba8011329ad596/
   powerpc |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/00e49f80f7e403c58542e8d0dd123caeb95486ff/
      sh4a |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/bfd5c2288c59fa3c092b5ed99afca1d172c7ac55/
    x86_64 |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/1c7f7f095dc941d1d0e53dedc56646ea677df748/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/4f12ad2e811ad0df29731276507ea6506742f5b9/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/22d29925a4cfb3fed672dd4843d5f1942c6c885e/
      mips |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/14623d58f99872f205d644545e85f8d9fcbd6c99/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/21159a8ea12187d27fd02eca5848ba1382719aff/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/bd1bd3e113bf5d7fc1ff9f23d9f3678c76db9bfd/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/8fa8e0ecae32e1bd4baa1156e7b416c1194a9338/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/2fa545fd7b2413d9b6fe675c0b01ce1db5e13293/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/10dff9eb364a2efa5339e651ea855314eb6193bf/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/67c0cb20ab9633e94e196278522d1610b020f4f4/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f62a98ae2986c538db88fa34aae7280b91be2602/
   powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/65aa0171ec61b787c1fc1beedec60d5e6e2a3450/
       arm |                       udev-182 | NOK | http://autobuild.buildroot.net/results/144be14a4b744ff8a76808b134b07dc67e2552f2/
       arm |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/1d587318b7b6fbb7ae88d124e8f7ec1fe823971a/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/a684785ae7eeab26a06c2aa6140671091a26f7dd/
       sh4 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/fc929e68c53e1453d0b56a34250dc9c33f9a0454/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/b0928377b77fe9c424d8e7a3a058cf7792010b51/
    x86_64 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/fcd99e8f9a66109c8aef04439a15e118f91b7785/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/f4a512ccf7cdbfdec948024cf0e2023bbd446ca0/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/6c67a2a883164887316a675526a576db97bd0fa7/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/b97d8a34003e6a3657c676813432f4ed20bf3809/
    x86_64 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/ed33bc353ae99c9ee9c45b6bbc8a25ea5a498cc9/
     avr32 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/f87eadd80753009672707ea1ff353e0d6b20d5ec/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/25f2d62cc1486afd47f41459ec1817412630d99e/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/89307a0cf7854b79f10bdb73f1d0601ffa5ab53d/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/95172f74dd4a70ac490ca651d433922b875233ad/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/6c5cb629f5e2549afa5eed517360d17b8a2665ec/


-- 
http://autobuild.buildroot.net
