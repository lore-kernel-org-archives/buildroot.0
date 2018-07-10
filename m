From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Jul 2018 08:01:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-09
Message-ID: <20180710060108.074B42072D@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-09
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  15 |   0 |   0 |  15 |
   2018.05.x |  15 |   0 |   0 |  15 |
      master | 103 |  33 |   0 | 136 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  squid-3.5.27 | 12
                   wampcc-v1.6 | 4 
             gnuradio-3.7.13.3 | 2 
                    host-rustc | 2 
               mono-5.12.0.226 | 2 
                 opencv3-3.3.0 | 2 
                 wiringpi-2.46 | 2 
                busybox-1.29.0 | 1 
               domoticz-4.9700 | 1 
                libmpeg2-0.5.1 | 1 
              libostree-2018.6 | 1 
          openpowerlink-V2.7.0 | 1 
                  samba4-4.8.3 | 1 
              wireshark-2.2.15 | 1 


Detail of failures
------------------

    mips64el |                 busybox-1.29.0 | NOK | http://autobuild.buildroot.net/results/6b39648b466738162516aa50ab328d839ec85448 |     
    mips64el |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/a482fad34d1f1cc99472130e4dde0bb192f1d299 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/fde61220ddd3bf46846774a4737166d8a2f3350a |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/d05b7a1cb813e96e70402f75098d63f7ff73540e |     
    mips64el |                     host-rustc | NOK | http://autobuild.buildroot.net/results/356de6ede09587b16c8064604d5ebdd2b0602a6f |     
         arc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/dc8722c152d758beeb66f0647036d42a67e4c9d9 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/87b9f0a36ef4636210d51d0693adac51a5176606 | ORPH
    mips64el |               libostree-2018.6 | NOK | http://autobuild.buildroot.net/results/f8c80c8684634eaca813b572d48a35d1c90322a3 |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/735b2ac0908579b22da7768579754ef42dff5223 |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/8a03cea6f3b31551efec8ab0ec74903b02a925a7 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/028914bb646907c5f1a6caf9e211bc188c755970 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/9dadc09b43fc6cc14aea7e480e42a5172b80adb7 |     
        i586 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/63d5b21b5581f2005d6ca2bd0558601cc17eaee1 |     
      mipsel |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/7d76c397e4fdbd02611cfc2388bca30cf53e0ee7 |     
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/787400a619739668323c396a603094f29b39b7c6 | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/c7a36347bb7d2df83c7c2f7b542b0eb08e6fc5ef | ORPH
     powerpc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/a17863eba6c9f6bb111fc40dbfa1a91493318e37 | ORPH
       nios2 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/7bb3cc0b02c31e290dc5f7d52e793aad2dfdb295 | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/c16bf531a677ed49c3dce8c262da1a5bc528760d | ORPH
      x86_64 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/26824b0c689b86e1b06256cb36504b9831a1ed60 | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/975397b58139e8a8f7fe071d5b39cf2ec080168a | ORPH
      x86_64 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/e721f0a6e66c30a597d4f6957dba1876d08e177d | ORPH
     powerpc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/cfd093ffa50419d8b01f6460960d70d6595f2ca7 | ORPH
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/c15edf557ab9b6f337deab3b29e31f307c842e22 | ORPH
      x86_64 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/be715719b8da72006e4db88c1c92379003ba225d | ORPH
     sparc64 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/ac6a34ea206dbdfd2fd9e38bc648c3217b738140 | ORPH
      mipsel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/9b3fdf3369e9c3633d925d9e5c8a428d23dae5d4 |     
        mips |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/bf73b68c1bf5fd04295c0e450d3e931b28ef01a5 |     
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/6487f7516ebfbbe72ec4fd24f31b60c411dd224e |     
       nios2 |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/a6ca6516ad44d2bf0062d06b704ab0ee40193e26 |     
         arc |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/9d32877b506915f375f0c30b815c785241434ceb | ORPH
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/8805e1e95ab66d12bcddb7f2d8cf807c1651acd9 |     
      xtensa |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/9f0b7220af5947acf99efbb7d74504274063b320 |     


-- 
http://autobuild.buildroot.net
