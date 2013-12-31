From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 08:30:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-30
Message-ID: <20131231073007.D03AD101CA0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-30
===============================

        success : 82 
       failures : 57 
       timeouts : 1  
          TOTAL : 140

Classification of failures by reason
====================================

                 xenomai-2.6.3 | 9 
                grantlee-0.2.0 | 5 
                    ola-0.8.32 | 4 
              cryptsetup-1.6.3 | 4 
                  iozone-3_414 | 3 
                  thrift-0.9.1 | 3 
                  libogg-1.3.0 | 2 
                     php-5.5.7 | 2 
                  libpng-1.6.8 | 2 
                   qjson-0.8.1 | 2 
                aiccu-20070115 | 2 
            libvncserver-0.9.9 | 2 
                      icu-51.2 | 2 
                  python-2.7.3 | 1 
                     pv-1.4.12 | 1 
                  tstools-1_11 | 1 
                 libevas-1.7.7 | 1 
                coreutils-8.21 | 1 
              e2fsprogs-1.42.8 | 1 
                 civetweb-v1.3 | 1 
               alsa-lib-1.0.26 | 1 
avrdude-eabe067c4527bc2eedc... | 1 
                       unknown | 1 
             gstreamer-0.10.36 | 1 
                lmbench-3.0-a9 | 1 
ne10-88c18f02199947b2c8b577... | 1 
                 dmalloc-5.4.3 | 1 
         host-elf2flt-20130904 | 1 
                  nettle-2.7.1 | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/f08b35d6ef8b02075325cbcab9cea56371b88db4/
  mips64el |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/d675a1f69d4919aa5feeacf4ad51d03bb334b2c1/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/f90dca46131e5b6a269572dbb171852ea19b03d0/
   aarch64 | avrdude-eabe067c4527bc2eedc... | NOK | http://autobuild.buildroot.net/results/646c53e2f5fb4be5fa27788fc23e4b10fd3401d7/
    xtensa |                  civetweb-v1.3 | NOK | http://autobuild.buildroot.net/results/d142f3ce17ab22cc39f9117c114318c1b5cadfc5/
   aarch64 |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/cacba7bd80bf4c47594bea98777d312b265d5704/
   powerpc |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/a70ec0e77a7c14115b9bd05cf8dee58b1b41707d/
      sh4a |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/835773657c10fab74bd2e82c170119d48bda2e1f/
   powerpc |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/d2803a3dd2907733c465726061d493b7701eacc7/
   powerpc |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/212b42ad8b5113f70a13af6824fc9e0a0cb542bd/
microblaze |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/2876a95a7361832abcacbf51af407de96b70ae38/
    xtensa |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/79cdb149d349ce9fe2dffbf53e3ff127a050ed24/
      i686 |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/52c7b405ec3a3dceda99ab31b43cfde1eaf378b4/
       arm |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/08c1896182230cfd64b262da30cd1e8596c6d370/
    x86_64 |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/b0e49ad30cdf0c6405cefc7418e171fe3728831e/
       arm |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/9ffe2aa1d6631dca34117d2872ca8ea62db24adb/
       arm |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/6ab26de019b39b676a52a3d80a74351273d01bd8/
    xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/a0cca019b0b2f33b6c2be17e5a44a807bbb4dac1/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/3e687a8bc3e24cf24fdf0055f911846547b616cc/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/e19adeceb5ff5d2564b504c1b53879f28b283069/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/9334f34e9f94acb41874387126130bc0dd142666/
    xtensa |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/d54012d167dc7f70c796a109f7fc659690b5c548/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/de5b700d93383c4c08edcf183971c4816c0b9146/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/56e10554ce95115baac64c0960ef301f9d858c07/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/3888b30a183a01afff43c3f463eb8d794d0b4124/
       arc |                   libogg-1.3.0 | NOK | http://autobuild.buildroot.net/results/8c66862d50d5d0244af8e191073f8a0b1caf9fcd/
       arc |                   libogg-1.3.0 | NOK | http://autobuild.buildroot.net/results/e0c6afd85970a4d5894a0ecf0df1d2449f074f07/
      bfin |                   libpng-1.6.8 | NOK | http://autobuild.buildroot.net/results/6346f2206e88efc936013aa172d7a1b5f1d1ec36/
      bfin |                   libpng-1.6.8 | NOK | http://autobuild.buildroot.net/results/0f97a6af631332a658575fc8a2f3f2e6bbf9ae33/
      sh4a |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/89f734ea893e8e6e1272dd0171141accbf54b92f/
      i686 |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/365209675de7c51b3c699258ea03b64aab800b52/
    xtensa |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/afe9f4550e6ac9a41e4ba338773c1d51034273f7/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/61fefc2cc907c28713e4d8daa554d79d01080e07/
       arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/250817d264db125c483c9f93a36cb3e99bbf8587/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/638001d328d19ad71ad378141a1fad2d23041dcd/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/9303df55796287c8264438aaccf59351eaa41e62/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/72d382867eff398e21ba348ef85e2bdbb489bfe0/
       sh4 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/addd20f9833e53612c2756e0c71a7913f0a5ac67/
    xtensa |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/a9a1063104402ec28e01560ec7c8f8a5b6d43dd5/
       arm |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/99f111552c0a8d9c99960770abc58480abba0a3d/
       arm |                      pv-1.4.12 | NOK | http://autobuild.buildroot.net/results/0c2c47051fba1645bd5536b17b86ab257f4992d7/
       arm |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/dc41414d59b5f2038961ff98d1d8b542070c73c3/
    x86_64 |                    qjson-0.8.1 | NOK | http://autobuild.buildroot.net/results/040d50399793b2ecee535af89069f44097b80b81/
    x86_64 |                    qjson-0.8.1 | NOK | http://autobuild.buildroot.net/results/2df10c95f2e6211799f62004e0f1a574bab1fbd4/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/c0ac776dee9da5a10f833967878326f70ebaac00/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/4c5d963341baa25e9f543ba4fa20f25fed330084/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/e98084140156576c57f545f90c9404817ce70376/
       arm |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/7a964ed3e5c865aa5f082bc3df6cf87d1c68d1bb/
   powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/4dbbb8b7987714436cda851df8348a8d9f2e72ee/
      i686 |                  xenomai-2.6.3 | NOK | http://autobuild.buildroot.net/results/063d75f8ddd0bf0d451638e1616a7da2e852ce04/
      i686 |                  xenomai-2.6.3 | NOK | http://autobuild.buildroot.net/results/e5b1f534e41eb4fe132728d1f5ba09e9d00847a7/
      i686 |                  xenomai-2.6.3 | NOK | http://autobuild.buildroot.net/results/81657a0fec6b3ccaf996c9975175557f274f57b3/
   powerpc |                  xenomai-2.6.3 | NOK | http://autobuild.buildroot.net/results/8987259d5f1ec94cb9e03ed9a3c5812d07cb0c15/
      i686 |                  xenomai-2.6.3 | NOK | http://autobuild.buildroot.net/results/dc79c4d3df97f6ba0a13b2adc9868ca4c702736a/
      i686 |                  xenomai-2.6.3 | NOK | http://autobuild.buildroot.net/results/9fd97c110679915bb1ed0f72c25cfbf3a3a5bae7/
      i686 |                  xenomai-2.6.3 | NOK | http://autobuild.buildroot.net/results/8cea5191deecd0c3efcff320ad29d9c9fc240d60/
      i686 |                  xenomai-2.6.3 | NOK | http://autobuild.buildroot.net/results/868123319a2df86ed859f31dbbc55768021763e4/
      i686 |                  xenomai-2.6.3 | NOK | http://autobuild.buildroot.net/results/39ef88a9dec2c60867e36d300b7f4e709d23beda/


-- 
http://autobuild.buildroot.net
