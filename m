From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-24
Message-ID: <20161125073009.11B4D20B57@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-24
================================

      successes : 209
       failures : 42 
       timeouts : 1  
          TOTAL : 252

Classification of failures by reason
====================================

                     exim-4.87 | 3 
                collectd-5.5.2 | 2 
kmsxx-bd5f6471e619a6ba2987b... | 2 
                    mpv-0.20.0 | 2 
qextserialport-ada321a9ee46... | 2 
qt5webkit-b35917bcb44d7f200... | 2 
                xfsprogs-4.7.0 | 2 
             berkeleydb-5.3.28 | 1 
                bind-9.11.0-P1 | 1 
                  cppcms-1.0.5 | 1 
                    cups-2.1.4 | 1 
                     gpsd-3.16 | 1 
kvmtool-bed2bd9e1fbef581909... | 1 
                  lcdapi-v0.10 | 1 
                libmad-0.15.1b | 1 
                 libnss-3.27.1 | 1 
liquid-dsp-1191179b786703b3... | 1 
          openpowerlink-V2.4.1 | 1 
python-libconfig-b271c3d9da... | 1 
           quagga-1.0.20160315 | 1 
                    quota-4.01 | 1 
                    ruby-2.3.1 | 1 
          sane-backends-1.0.25 | 1 
                  squid-3.5.22 | 1 
              strongswan-5.4.0 | 1 
                  stunnel-5.36 | 1 
                sysklogd-1.5.1 | 1 
                   systemd-231 | 1 
                   tclap-1.2.1 | 1 
               tcpreplay-4.1.1 | 1 
      trace-cmd-trace-cmd-v2.6 | 1 
               trousers-0.3.13 | 1 
               wireshark-2.2.2 | 1 
x264-72d53ab2ac7af24597a824... | 1 
            xapp_sessreg-1.1.0 | 1 


Detail of failures
===================

      xtensa |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d8826f250b359fc5dc08300d1e9af87938a42a3b
 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/dd8063856b05e66526c9e5888eb984303fa4374d
      x86_64 |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/749366753688eed7ea639f75f24a97e12cada996
      x86_64 |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/ccf62c183f05e0b77331d543a1661ad0209cd4eb
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/bba2b2d7cc5ab36446e16c8866f9da2f475f4f74
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/7d60ddb07c19720e0fd7353caecee7b8deb88646
 powerpc64le |                      exim-4.87 | NOK | http://autobuild.buildroot.net/results/b486b152a796213defef2059f3457f02b66128c9
 powerpc64le |                      exim-4.87 | NOK | http://autobuild.buildroot.net/results/972742a87cbd83a45fed4b5faff0d8130c824848
 powerpc64le |                      exim-4.87 | NOK | http://autobuild.buildroot.net/results/f4611fab1de83972108632df570b94b976eae66d
         arm |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/1a4dbd9ee5e0c7255843228731beab030ca005ca
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/98fe8b67562f6e24c4aaaaebb1e816964ae502f8
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/4abf607dd5e4a84799bbdfd3cd57ec12e4b20518
         arm | kvmtool-bed2bd9e1fbef581909... | NOK | http://autobuild.buildroot.net/results/0b4d8afc23c118fb97722c0fb37050fc10627472
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/cdafc79035df083ee1e997e3c4216339d31c641e
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/5a4f7152bf5b8b80843da2f09190aff3ce470433
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/6e271ad0911aabe33d9514b74f09c2cbe9e44c66
 powerpc64le | liquid-dsp-1191179b786703b3... | NOK | http://autobuild.buildroot.net/results/ef4eeb31f0cbdfff06e41f759ffd6c5dfae75e1c
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/ddca9c9b12a054e9305b567ae39e6fc42cf5cef4
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/d62eee7b904354b291f9c699ceb89ef702811e79
      x86_64 |           openpowerlink-V2.4.1 | NOK | http://autobuild.buildroot.net/results/3859dc0f4de7e3284a96d5841f040f69f71842df
        i586 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/a10f0cecbf4a43655a270f20cf720bbc559ace3b
      x86_64 | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/4342ba2fa4ed0510801d398e164ac7c773f3d78f
     powerpc | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/7edfd8c9abc4f6051e5b1270405808b002ee7e65
      mipsel | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/553f2aab88fd5379b697ef3f79985e85ce0e9660
      mipsel | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/0f569be5c6ac6e18eda9fc18904d1d02ffdefb32
        i586 |            quagga-1.0.20160315 | NOK | http://autobuild.buildroot.net/results/085b0f2decd1348804955385f11b99d517b88f32
        m68k |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/9422ae6b001e7849517b15ba82f4c9a66e7a60b2
        i586 |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/f0775416614eeeae8c12086968e91ad7d1976923
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/1b9eac5303dfed638063f3b18dfff5571a2c4231
microblazeel |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/597319217728df8f142af5fed8d07a141154679c
      x86_64 |               strongswan-5.4.0 | NOK | http://autobuild.buildroot.net/results/c045c0c66fdbee561341a6b3c65ab50c3b37baf1
        i586 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/4ce222b13e6477f80a2dbb3eb3041ea751e4be50
         arm |                 sysklogd-1.5.1 | NOK | http://autobuild.buildroot.net/results/8fa2bf73f983330884bce2e5ac31e01dee112ba9
 powerpc64le |                    systemd-231 | NOK | http://autobuild.buildroot.net/results/c8eb46f3b715a47be41db437dbebcc6bf9e48620
      x86_64 |                    tclap-1.2.1 | TIM | http://autobuild.buildroot.net/results/e6a9f520ebaa081af7e979c4516ef2dc764250fc
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/0ed794a5840be8ce256bdcb6d8f30e05b76d5ac4
     sparc64 |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/689b63d95d836247983c06c049bd89d6290d6e73
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/4ac9596252a9a49e127c2c333caa8ceb4849ee75
        i586 |                wireshark-2.2.2 | NOK | http://autobuild.buildroot.net/results/e0c2628520e5d212cad8755ffdc4d1c9dd5ff8d2
        bfin | x264-72d53ab2ac7af24597a824... | NOK | http://autobuild.buildroot.net/results/6f296139633df24031b20d8bd5191e0f5928ec68
         arm |             xapp_sessreg-1.1.0 | NOK | http://autobuild.buildroot.net/results/ea48cc0b49ed425408fe694fcf6ff4f751abb119
      x86_64 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/eec6cefa71928f3a702aa74fad5e0de4ad7877ea
         arm |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/54711cac7b5c4140dc7ce0ef45086ca7cb11f94d

-- 
http://autobuild.buildroot.net
