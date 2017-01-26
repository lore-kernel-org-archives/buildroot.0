From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jan 2017 08:29:32 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-25
Message-ID: <20170126072932.A023820CC3@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-25
================================

      successes : 130
       failures : 66 
       timeouts : 1  
          TOTAL : 197

Classification of failures by reason
====================================

          mediastreamer-2.12.1 | 22
                  samba4-4.5.4 | 4 
               sdl2_ttf-2.0.14 | 4 
                   ortp-0.27.0 | 3 
python-libconfig-b271c3d9da... | 3 
                    ruby-2.4.0 | 3 
                  fbterm-1.7.0 | 2 
          janus-gateway-v0.2.1 | 2 
                  lcdapi-v0.10 | 2 
                     nmap-7.40 | 2 
               openswan-2.6.46 | 2 
                  stunnel-5.36 | 2 
            host-heimdal-7.1.0 | 1 
                 jack2-v1.9.10 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
libasplib-be7fac89218a84b75... | 1 
             lttng-tools-2.9.3 | 1 
                    mosh-1.2.6 | 1 
                    mpd-0.20.2 | 1 
            python-babel-2.3.4 | 1 
          python-tornado-4.4.2 | 1 
                    qemu-2.7.0 | 1 
                     qwt-6.1.3 | 1 
             rabbitmq-c-v0.8.0 | 1 
        riemann-c-client-1.9.1 | 1 
                 wavpack-5.1.0 | 1 
               wireshark-2.2.4 | 1 
                xfsprogs-4.8.0 | 1 


Detail of failures
===================

     powerpc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/854968803290a0370ab635562ee3438f6c9e4270
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/0f82ef09e9b88d52100cc2eac0391a6fc0fa8035
      mipsel |             host-heimdal-7.1.0 | NOK | http://autobuild.buildroot.net/results/42b97dfc5cc544a3a25000b3e7668309a1b039c3
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/69dd0baf8c46c5261e1645f51b793701b5045ab4
        i686 |           janus-gateway-v0.2.1 | NOK | http://autobuild.buildroot.net/results/aae2de770d105c987a83dcd536b80c8f7fd88031
        i686 |           janus-gateway-v0.2.1 | NOK | http://autobuild.buildroot.net/results/1d4e9acca3464d1ba7de656bd861dee85c83c366
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/6521a5a70bb3cca842f6f21b23fb528ee1d5cf39
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/286f1574b711dd1029c910f420a8ad43a3f003c3
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/ddd1bf56d2aa6d49695a3762b2998ec6f4d30d73
         arm | libasplib-be7fac89218a84b75... | NOK | http://autobuild.buildroot.net/results/515dad49ac2ab0dee49ca6b655836c50425e5314
      x86_64 |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/76c0e5dd0ea52a8dc1a96c4a0edb821637fc9aa8
      mipsel |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/f4bace195e9ad960c6307e38b0e364e200bba5f8
      xtensa |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/4fd24727c626239c2efa24ce651774422e98d3aa
       nios2 |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/ee89195fd53fa47cbecd85dbe96f9ed413a807ed
        bfin |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/3f93ca72be74f18b0fedfdbb72456681c06b2e13
     powerpc |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/615fb62b7e58230281da3dcf0fa2b1e2b484fe9d
    mips64el |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/138d86684daf1e94fc6c858588e04b766b07ca25
      x86_64 |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/2ea1d0b918fb6f3657ae345931e49930707fd73e
         arm |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/c3ae2424666b7b53cb9d482848f70e12aa70bf4c
      mipsel |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/68a1e460ae8100794d9743dcad11112da1c299a5
         arm |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/476e44d3e70c4088d5f2c9d532edbac3feecc589
      x86_64 |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/ef9a7bd80a2b53c78ccc9db1294844809c572ff2
    mips64el |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/0c18b7e6887df076585264fd09bcc18dbf4b1893
       nios2 |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/08dfbf11140bf2a3090fe61224c711fea12e5836
      x86_64 |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/40c10ec956fb403feafde9a4687b5ccae71dbc2e
        bfin |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/25b1bf9fb8c9065ccef2206bc148181e95851771
      xtensa |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/c2a11ef1116882ece8d5030e2dae3ed8c998f5d9
      x86_64 |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/6a873ee68037e937bd548d9f0d496d2d8727e7a7
     powerpc |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/ee68075ae3ae910c23d7282e2d46ecdc05577ec6
        m68k |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/cb8dedac6a549ae4e6f111893fd66d377d302934
     powerpc |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/27f46467dfaed44bfbc3176a002fef60cf987912
       nios2 |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/e1b8486d1a41c4e14bcffd4fbe33faa8a57f68e5
       sparc |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/027e07bd72e257487331741ab7c85bdb4abe7fdb
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/5d4ca7258649fcdc5b2ee8832209c3fe91e44e03
         arm |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/d1d18c8dd8cf239f07079294ab2b60a8028e6ec8
       sparc |                      nmap-7.40 | NOK | http://autobuild.buildroot.net/results/02cafac5a7c88dcd44cba7cbdb3e42f86f6d3cb5
       sparc |                      nmap-7.40 | NOK | http://autobuild.buildroot.net/results/4f48d7d4dd67017a32e8cefd787955a37fc32eaf
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/5405d79aeeca2919abea1586fda697310b6beb1b
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/7b98001c1c8318d1a49c4a31238404b3c7d83388
        m68k |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/b3b8b0749a759fd3076d473de353c5de0c0db640
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/79a9d01cb4d0037c972a0925c5a61cf2e8dc77d0
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/810c4b390f6679c346462ad713dddd9a0ce78a23
        m68k |             python-babel-2.3.4 | NOK | http://autobuild.buildroot.net/results/aebeab6dc61cd9ee21db343cc96edf0df95e1fcd
        i586 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/0bf7fc368b0f038083617be967864eb6b965e8a1
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/d0489fcafcb68a64e264dea8087372cc66956d53
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/fe49809e2c55dae8f1ebabd85246670b70334502
         arm |           python-tornado-4.4.2 | TIM | http://autobuild.buildroot.net/results/180c80852df3e624ed37d0671a45d070f772dc7a
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/ef2a79fe58157635dcba3bdc1f222bfd6f863d96
         arm |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/a58e67a8efc9a672019aa77dd8073cda384fc097
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/d2c4d0e56c61e68a1ddb06f9df1a2800bd6d3fee
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/adefbb47b0042df7bf1bbbb10bb85b28ac5fa31f
         arm |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/868d54b6034d2f04aec9c58fc12c73366974257f
        m68k |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/af1b9ebc254e47efee06d0d627d06592a6592885
     powerpc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/bbc51c277891a836a27dac4aefd9598d57af21e1
 powerpc64le |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/fc625e52c3d90f23e08c2e2fef73f8f0fea74231
    mips64el |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/9027232e1e874bc20f37ccf25276aac006a64566
         arm |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/19e5fa603202e21a08cde3a6e811b5d196830ecf
      x86_64 |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/a5d8c48cef96cba5f71bd60651e7313c6806ac94
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/894f17dc3a1e40e23496e00cbd60be61d48f2361
      mipsel |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/380c8d1c3cb9012684d8f5f15c165620f5ef15ad
   powerpc64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/5ae874cd2769b9efd62cf7d8e41a3504196c4937
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/5d59a18f21569896934eda3a073c8d3b30c0fa46
        i586 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/cee52505f1ac2da2f5ba86c9ebfd1f5cd9e301be
        i586 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/f7b410b3188bd2e664f636bb0a024ec640de520f
     powerpc |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/ab934ae65116e94557517de5ffe00bd50d2ea856
         arc |                wireshark-2.2.4 | NOK | http://autobuild.buildroot.net/results/d3279d9cebcb3d903a280de3acee5ab3682363cc
         arm |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/809bef12606b37725f5fa263d6ea1b3cbf366786

-- 
http://autobuild.buildroot.net
