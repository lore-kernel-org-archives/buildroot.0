From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 08:30:43 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-23
Message-ID: <20170624063043.4336020982@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-23
================================

      successes : 131
       failures : 79 
       timeouts : 0  
          TOTAL : 210

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 20
                 openvpn-2.4.3 | 8 
                beecrypt-4.2.1 | 7 
                 sngrep-v1.4.3 | 6 
knock-258a27e5a47809f97c2b9... | 4 
x264-df79067c0cf33da712d344... | 4 
                     gpsd-3.16 | 3 
                kvazaar-v1.1.0 | 3 
                  cc-tool-0.26 | 2 
linuxptp-97c351cafd7327fd28... | 2 
    trace-cmd-trace-cmd-v2.6.1 | 2 
                      x265-2.4 | 2 
              alsa-lib-1.1.4.1 | 1 
                collectd-5.7.1 | 1 
                  cppcms-1.0.5 | 1 
              dieharder-3.31.1 | 1 
dropwatch-7c33d8a8ed105b07a... | 1 
               gnuradio-3.7.11 | 1 
           host-doxygen-1.8.13 | 1 
            libpwquality-1.3.0 | 1 
         libspatialindex-1.8.5 | 1 
           linux-zigbee-v0.3.1 | 1 
                    mpv-0.25.0 | 1 
                     mtd-2.0.0 | 1 
           python-pynacl-1.0.1 | 1 
       python-smbus-cffi-0.5.1 | 1 
              syslog-ng-3.10.1 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
===================

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/a36a5ce6a5307933afac84a6102a1a4d552980ac |     
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/04e9c07a5aadf6d0e972f2fbea26e6f94d3181c1 | ORPH
       nios2 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/f78665a4e7ccd4ad5e08c38db4ec9d30e6bf85e5 | ORPH
        or1k |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/c5f6368e4f2f2537a90b100ef37ba1f16a6bc5ea | ORPH
      xtensa |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/950eca3f2a743c10f1b90e6e08373d3aa3572ac9 | ORPH
      mipsel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/e26e5c77059fa49dd184b1429fe06693df1a04f7 | ORPH
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/befcbb4fbf62ef749522b147a7d7dd1f68eb700a | ORPH
       sparc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/2d57760c4869e18b7aa3feb73c3327e27c5e3819 | ORPH
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/0fa0b742c5c71d9d90b22474eea4684047f0e9d8 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/22dbf752da95693c037047a67277f17f4aa59407 |     
         arm |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/ff215f023458f1243ec60de1527e25c2728c367c |     
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/da6faee8d0da3473f2f000b7b3fcffc8cb2515cd | ORPH
         arm |               dieharder-3.31.1 | NOK | http://autobuild.buildroot.net/results/b629754c6a820446ff38df8202ea1ed0041bc4ac |     
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/275b6762fbb3fa906a6a3969e963b3915808feec |     
       sparc |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/f4804b5445be3f41ad6601f6aad343bce369f433 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/28eabb5a4109b5d20b4031a36f257d4883efe5db |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/d711b5c9f50fae0ab15194170c428d13797c8258 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/99cd029d2252fb6435a60099b365795310d9e277 |     
     powerpc |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/8bc5ca19b4d4eebd610fe5a034d0e1ff94f2047d |     
      xtensa | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/b12e235a656b9d1dc8871a38b6693afbaa64c2b9 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/bab2ff8e755a22f8c178298029e4bcc83a8be3af |     
       sparc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/024ed43ac7de73f8808405430c505b05870b79d4 |     
    mips64el | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/b5f1a57080fef1526c2f059a583e69d94d12e43a |     
microblazeel |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/9f5998cbacc275cbf6384099e1b653e7667fee41 |     
microblazeel |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/c205ef5fed7c88a61c3ed0663bfe26b15dc78b79 |     
       sparc |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/13e40fbfdc14f665fd436c259749c02ff8e64a52 |     
        m68k |             libpwquality-1.3.0 | NOK | http://autobuild.buildroot.net/results/41917294d90f68905f0d6f140d5fb313f3e9de15 |     
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/20c0d12ebea0b7b09ca5360896f144abd780067d |     
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/99e7b6ad058ca3226820d75dc37e8767421cc55e |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/138e6fb4175969706a928b7fefbf6914aebdc540 |     
    mips64el | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/dc56562030800d21d4d01360bcb43b51cd0c8eab |     
         arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/ef5ac8b6750d4bf1d627cc490615638634d86049 |     
         arm |                      mtd-2.0.0 | NOK | http://autobuild.buildroot.net/results/adbce445043ba8a1e33f45b32239ecab9c884517 | ORPH
     aarch64 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/937c2c1e025bb16ca6fc26bc025ca728ad92bd3b |     
      x86_64 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/d397964e0a9b97fcc887143cdeaa02137e92469a |     
      xtensa |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/dccea3d71f2433f45eca4403343a15d01dda5be7 |     
     aarch64 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/af9accf066801b61bc05f0deef0ea6cdf36dabed |     
        m68k |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/a114fef820ed6e25603ded8594e6930f952cdfa2 |     
     powerpc |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/e25e8b031a944320c6ab5260220910b03820bfda |     
       nios2 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/ee77acba11239511009bd98255599c9ecc043f6c |     
      mipsel |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/059e916b409e8aac42f565c9eba29bd8fad9cadf |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/5bf26c3faeff824ba9c2f1fd2baa52cab5dadef4 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ac458cee04d1db9173e3c027ddde76db9502816d |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1ca79f56eb0f661dbeec2bde8730de1a0d69ef55 |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/cded23a178e679d27e865a3504872eba9d2251d1 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d3f609cad30b06abae3136f902c61d66d8fa5397 |     
microblazeel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/185e63d5c2979f94b4149f034bfdc9382b9830cc |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/668c75f94286d826d38b707c3a7f32a8ba2c432c |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/62f996019cad204a0cb8e7bf1dc06c565f870d9c |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/89f017bb6896457605bb291e8e5fc2c1710ae6b7 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/eb9285cdd676527fbcc397523e95eb2694545ca1 |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/5841b2ee34b613f34ac5f37182233cf5e3998727 |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1902a079b17dffff8eee6830aa666b5874e09043 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4624e4ffa249f9f4db258ed21d67837af01f1075 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c9c52c3b0868f99d53dc4eb5a53a1bc5312d7110 |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e9fc0b72053d26858286a97467ace31ddc6961d7 |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d648b99b443ed39f9bfc35804709d53af33fcc60 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4d7e74363b2111406c9e29112ed5d7748a747681 |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6bff4acf1b4f74e5c239a9618d79ed4b5113cdce |     
        i586 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6c1678dcf4e8d7802e43486b1e2a35f2b80310a8 |     
 powerpc64le |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/70b6dc7fb9aa916e3a3ad236007cdf194845926f |     
         arm |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/4c56059acc065363f6c080e62d84abedbfeb6251 |     
      x86_64 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/24508a5b91e93adbb1b90d14e78e305e37ed0821 |     
     aarch64 |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/069a81ae4c72f8e233784c96dfe0e5e022eacd3b |     
 powerpc64le |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/909400a7a9c890f6ef5ae840d03f961aca75074c |     
    mips64el |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/5bc9874000d91c1028fdb22f3506fed57425b823 |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/e0897c0422e82c6f7505d6676c521f90fb9935e8 |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/80001bc0e8f3b25fa4597ac0f05db2eb1d90e7b4 |     
        mips |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/e9b3b2929cf5586222fd0cdc079eb50b41483523 |     
         arm |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/0f9d7601b92ca31d024bde0d2222415415f2037f |     
      x86_64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/c9a1c200bb3041ecda07a2cc7398afc6a3983a65 |     
        i586 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/24a239b0a46a7c6eb02f2be1cdaedadf81af17de |     
        i686 | x264-df79067c0cf33da712d344... | NOK | http://autobuild.buildroot.net/results/dc5c98c862fe7a5b4bde7c1ed37a4574802c2b16 |     
      x86_64 | x264-df79067c0cf33da712d344... | NOK | http://autobuild.buildroot.net/results/9930d34466de1aed73933ba033e10d63605bc5ed |     
        i686 | x264-df79067c0cf33da712d344... | NOK | http://autobuild.buildroot.net/results/0c59f6717a093c4686a3245b382e92ae84a884aa |     
      x86_64 | x264-df79067c0cf33da712d344... | NOK | http://autobuild.buildroot.net/results/d46db4a4dbdb296c4a123eadd9dd2c00ba0a0023 |     
 powerpc64le |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/f6a7cb182491f2e16075c37e30306a20291cbe28 |     
   powerpc64 |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/63286431c69e4eae49046cceb6de790b5a1f8f27 |     
       sparc |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/f9aa5ba1bd026cf5aab88e32a3775ce2e9d928ab |     

-- 
http://autobuild.buildroot.net
