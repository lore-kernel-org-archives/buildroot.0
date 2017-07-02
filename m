From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Jul 2017 08:31:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-01
Message-ID: <20170702063108.884C721D96@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-01
================================

      successes : 140
       failures : 85 
       timeouts : 0  
          TOTAL : 225

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 29
                  cppcms-1.0.5 | 6 
knock-258a27e5a47809f97c2b9... | 5 
linuxptp-97c351cafd7327fd28... | 5 
                kvazaar-v1.1.0 | 4 
                 mesa3d-17.1.4 | 4 
                 sngrep-v1.4.3 | 3 
                  cc-tool-0.26 | 2 
                     gpsd-3.16 | 2 
               host-rauc-0.1.1 | 2 
                   strace-4.17 | 2 
              alsa-lib-1.1.4.1 | 1 
                  bwm-ng-0.6.1 | 1 
              dieharder-3.31.1 | 1 
dropwatch-7c33d8a8ed105b07a... | 1 
                    ficl-4.1.0 | 1 
filemq-3dc89932903b0320853d... | 1 
                   flann-1.9.1 | 1 
              gettext-0.19.8.1 | 1 
           libmemcached-1.0.18 | 1 
            libpwquality-1.3.0 | 1 
              librtlsdr-v0.5.3 | 1 
         libspatialindex-1.8.5 | 1 
          mediastreamer-2.14.0 | 1 
                      qt-4.8.7 | 1 
                  snmppp-3.3.9 | 1 
squashfs-3de1687d7432ea9b30... | 1 
              syslog-ng-3.10.1 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
                      x265-2.4 | 1 
              xmlstarlet-1.6.1 | 1 
                   zlib-1.2.11 | 1 


Detail of failures
===================

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/aa44b4fa01ae4dbda2b66ee15f7ab757354166f4 |     
         arm |                   bwm-ng-0.6.1 | NOK | http://autobuild.buildroot.net/results/afc6c7e174cc3317d0a4b2b80c53f126d43a94ec |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/7196a5a029211ee42a772e05a4c3e3ea2f662e55 |     
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/1b1b62cd47e211cf135e5649155a127ed1074098 |     
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/e9854e67243970b088df3c86702f26e7aa019bcb | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/a918d22f4a3e1ed21551e9cabf881fd4e62d0b12 | ORPH
        mips |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/8ce56cb1af37e1159b5163edad45e8e80ba50826 | ORPH
        i686 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/4ecafbc5eef69bad325dffff0cb7c15d47a1682f | ORPH
        mips |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/cf1bbc3bd703a6ba1c56ad3f5b3e9044bb80bbde | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/5419eee05c80232429448e840eaf356a6f04af80 | ORPH
         arm |               dieharder-3.31.1 | NOK | http://autobuild.buildroot.net/results/37920b26f9c4853a0d620eb4a33b50b53e548888 |     
        bfin | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/fa910548064cfc5b770a735268d1f5cc9cf14939 |     
         arm |                     ficl-4.1.0 | NOK | http://autobuild.buildroot.net/results/b6da8adcfc293b89771a04c22320381d56c98d79 |     
         arm | filemq-3dc89932903b0320853d... | NOK | http://autobuild.buildroot.net/results/88da842e86b3770a005155a6c8938b43fc206b5e |     
       nios2 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/0afb4caa52b046906d317a949051e1953a7edf72 |     
         arc |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/76f7f36467ac69011d1e4b990c55d97e4624b2dc | ORPH
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/da07a8f59cf8b07baac8bb5cff1413e2e7b3ef2b |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/f74d29b989028777a24df08349e176f600b2837f |     
         sh4 |                host-rauc-0.1.1 | NOK | http://autobuild.buildroot.net/results/2695202ee3b0734430abc2db03828a45cd5e5ef5 |     
        m68k |                host-rauc-0.1.1 | NOK | http://autobuild.buildroot.net/results/77a5db1120bf90ccaac00cfc0a8db358cacd894c |     
      mipsel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/7394963d4620205e01fbee401461c5c706c45924 |     
         sh4 | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/c34bbd26b5fad050af53142ea3700ee177371ab5 |     
      xtensa | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/bb0a9540ff830ba08e20a096835db17076720129 |     
      xtensa | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/f6b22ee246dc62c9be0ee168a999432ee0e4966f |     
microblazeel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/510d7f07d20d88691308ef8a3f4250daa2c29d30 |     
     powerpc |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/5eeca56e403f71efe87ef7edcf1435c5205d754f |     
     powerpc |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/7d5e67f2159eb71c9e64a705f89591308e225fa1 |     
     powerpc |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/76c76191f84748326d76fe0cc89456a72738a06b |     
     powerpc |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/e851bba7bd68056ea0525ca067e91095d92eba26 |     
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/d810a89693f2cf1b6ccfe1713505b7b15ee52ad2 |     
         arm |             libpwquality-1.3.0 | NOK | http://autobuild.buildroot.net/results/5d849e4ba71386c40ea939b3946e3a14303a0ebc |     
         arm |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/d6c54202b8b9a9674d6564c1ea92501a33d7d77a |     
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/2f8d6cb3243e73852cb79c45929d0a2ec33c4caf |     
      xtensa | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/394414df25b0b7261b27ca5d4901fde0f639e73c |     
      xtensa | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/c97b05ef44d446beb79c57933e04f3cab68f4a2e |     
    mips64el | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/70dfd05acc9d951169267f2820ecedb37f0711fe |     
      x86_64 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/6adbc8c77c2ca70246b31600ab66b37c56c1e89e |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/7a377959bd08e08e1c3df34d7cac623adf2966f5 |     
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/4b5494fa5f26efc7cad481278e41716e91991a6c | ORPH
       nios2 |                  mesa3d-17.1.4 | NOK | http://autobuild.buildroot.net/results/e95643f6b2117b0b32db660eae6f2685871c168c |     
   powerpc64 |                  mesa3d-17.1.4 | NOK | http://autobuild.buildroot.net/results/69da0f581284bf34147b9508d749aa1c38c198f3 |     
         arc |                  mesa3d-17.1.4 | NOK | http://autobuild.buildroot.net/results/ea5b6623df787f7dbe6d9dea789dccd2020d0726 |     
         arm |                  mesa3d-17.1.4 | NOK | http://autobuild.buildroot.net/results/608846674e070c991f65f65076da09802252478a |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/da17850086111cb3bdd5b9d261d7529623fa7d82 |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a53f569108a7d77b9aaa06b6e57515f4a17282b6 |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/80a6bfd8420daa13f5130be7198612b3acf1353e |     
 powerpc64le |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/572fc8eb6cfb283f9dd462be0c269541e8159af0 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a1c2834a8a4c7929d8ae2413c733a6be66516e84 |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/69685d81fb3e0314b5ca8399e0800db914e4de37 |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/42e44c4844019d611278a5d5f8487098fddfdd7c |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b62f59c01de36dc93439953c52dced03025c1b23 |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/244ee82f8f95d6707856289059a4918970f4a43f |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/082f2695fdbe51ddc2b0275e41fa5e32e0adf13e |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/51205625cf1a7bbb6bb2cc332ab4a299d3b022e9 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/64a1d7d0cd1d3ea2224b761e4e2e93ddeb1e01e7 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/aaf0126e2baa8af0a4ccbc8ed44a9670932521c1 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/06df37ddd1b17896334946b17fa0c94250d45bae |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/27652a92b79e81f855131956ecb91a5d3a01f8d4 |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/2d1f1cb13add21badec2e3e09cf416af8305261e |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1157860201c519a48fc2253bf06a3696e7b929cb |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3a56268aee2fd795f0eced10317595fdb9ba66f9 |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/cf91a5b394edc096d88f8a0d7e9e26e17249269e |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/cf85162a28d3f69ee98981621be98d8212c0c85f |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f5c4a8dc7b43ee7a6c4cb8884f7e79696f950474 |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/87fad8d7e7ebbca3a1829f95ec32905a81ee3150 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/cd4556ed6889c432dbeeab88f11613e55ba89756 |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/44538dd0f6412e06d76b991ae570202309a961af |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/877806ad6e3872595ee446ee08fe27064a7f6cf2 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/9c61749a32183dde545e4b76fa01ef6005bb2f78 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/2c68e4fb3488d186815a201bb4f83d3bb11b4692 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/56771e0fb523535ea8b8247d64cec04147aa5461 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6bc4d65239bf010de4bad25aa0e0f99584c1a492 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0d2f7990fed2508ef4927e90c7584fa46a6d8d6e | ORPH
        mips |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/eef8dc2eea980adac8d8a3ee4ec7f425a0b03df4 |     
      xtensa |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/ca312f38ef1c843b83a6bffa597cb45c5f090540 |     
    mips64el |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/70438c78808469ea6595b8a1190ecdb2bebbe24b |     
         arc |                   snmppp-3.3.9 | NOK | http://autobuild.buildroot.net/results/70d9c8395aeee5c7da06eabc6594da9910bf4611 |     
         arm | squashfs-3de1687d7432ea9b30... | NOK | http://autobuild.buildroot.net/results/693960ed7c01622c756dcc929e83b3b713c16ccc |     
         arc |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/a1328c8252061cc98d4b312fc0df817ad7e7c3fa | ORPH
       nios2 |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/a50873b0bf7b6e5174eaf9b41d16e971644d63d8 | ORPH
      x86_64 |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/bd7a9cb2f1daf9e8afc6179ee7c09037f2faab9d |     
        i586 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/8b484ea47f6cb65b72e89e3b5f8058d9ef363297 |     
   powerpc64 |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/ed439c5659712938268bd96b9f060c22cd26a9df |     
        m68k |               xmlstarlet-1.6.1 | NOK | http://autobuild.buildroot.net/results/de31e6b97b77ead7e8e662ac4e3d4a6002e0c9a8 | ORPH
         arc |                    zlib-1.2.11 | NOK | http://autobuild.buildroot.net/results/dfaf2f6f6be28d1a2a57857ac828d450141c1c80 | ORPH

-- 
http://autobuild.buildroot.net
