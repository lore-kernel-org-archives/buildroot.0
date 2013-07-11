From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jul 2013 08:30:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-10
Message-ID: <20130711063009.6B34E52C0F6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-10
===============================

        success : 75 
       failures : 76 
       timeouts : 0  
          TOTAL : 151

Classification of failures by reason
====================================

            host-erlang-R15B01 | 9 
                classpath-0.98 | 8 
               libglib2-2.36.3 | 7 
                 libffi-3.0.13 | 3 
                  libxcb-1.8.1 | 2 
make: *** [libecore-legal-i... | 2 
             uclibc-0.9.33-arc | 2 
media-ctl-ac40b79f002a2315f... | 2 
                   mplayer-1.1 | 2 
                  zeromq-3.2.3 | 2 
make: *** [libefreet-legal-... | 1 
make: *** [fbgrab-legal-inf... | 1 
                      udev-182 | 1 
        host-util-linux-2.22.2 | 1 
                pulseaudio-4.0 | 1 
             gdk-pixbuf-2.28.1 | 1 
make: *** [neon-legal-info]... | 1 
make: *** [distcc-legal-inf... | 1 
                    acl-2.2.52 | 1 
make: *** [exfat-utils-lega... | 1 
                  iozone-3_414 | 1 
                 cdrkit-1.1.11 | 1 
make: *** [dhrystone-legal-... | 1 
make: *** [fbdump-legal-inf... | 1 
                   ncftp-3.2.5 | 1 
make: *** [/home/test/test/... | 1 
                sdl_ttf-2.0.11 | 1 
make: *** [libnss-legal-inf... | 1 
                 libnspr-4.9.6 | 1 
                beecrypt-4.2.1 | 1 
make: *** [polkit-legal-inf... | 1 
make: *** [ptpd-legal-info]... | 1 
                      qt-4.8.5 | 1 
                openssl-1.0.1e | 1 
                  webkit-1.9.6 | 1 
make: *** [jpeg-turbo-legal... | 1 
           imagemagick-6.8.6-2 | 1 
             tvheadend-5956233 | 1 
                   cups-1.3.11 | 1 
                      icu-51.2 | 1 
make: *** [coxpcall-legal-i... | 1 
                  opencv-2.4.2 | 1 
                  libnl-3.2.21 | 1 
            lttng-libust-2.2.0 | 1 
                      pv-1.4.6 | 1 
                 libevas-1.7.7 | 1 
make: *** [evtest-legal-inf... | 1 

Detail of failures
===================

      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/6a86f9da5231c52e048ec2fb0fcaead715c1f362/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/776bc03040514da31c7a851393bf1501629dc2fd/
    xtensa |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/7d817fd4839a442925e900e8ecdd90faa3a9b691/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/d17bcf93003ac7b1b2d5c3725ae749fb1f242a4d/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/e88b77b28e9a0f1d2960aaa782ec0cbfd4e5e451/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/886afe031103cf6fe58b31b974abd3992a757f15/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/720362105493bf197c694df09320e468f244f143/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/b0c30fcb28917da7bc22a177e2cca00bb52c4e8f/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/033b6601a5c6fa14422c9416394a70b29c7e3cae/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/03fc4bfa5b4b51653345c654feffedcf0ff1d706/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/a15482e0180cf812e8de1cee546c74149f0e9afb/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/4c2e676f630af0b3d31a09241b251f488a2372ac/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/9369f18a9ffecf964014b61e94cfe9d8eee23288/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/9bcd68c9a46f95c825bcc1477e63149a346e0948/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/3c0c5bb1303b9c8fb01c608611867a501ab73ee6/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/b5fbff0df6017c2c69a65edc886702a3e638c5f4/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/c1a6003257cde78101fd2429d9c9395fcea2e091/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/853fb6e56c8f252d37ee86103c215da515ac86a5/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/09ad52f64f596ae63d80786b22fae62d9bf30171/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/04a32d4e194ec11d29586467bb36e4c924e187f5/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/e2f512ee379840a6bd8bbe33c2c4bfca8328a72c/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/3038a00bdc0b4401e882301d0ece6574b5926c43/
       arm |         host-util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/c13a867355c3f7784810c03faa69e878737fcf31/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/1826dff54022ef870f1ea6bb08019b0affd86f83/
      i686 |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/c92618bb48b87cad0e63174c2942912a7eb3e40d/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/d44c842dcd2234b8f253e765a13e010e68dcc394/
     avr32 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/b3de529ef481587da529a55cc8b79bad0e93e4b7/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/4cdccca087bb07d823a1dcc2dbf8a394c61c6726/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/8c7df50e268cb1f9fc2246d03a04616f2b0d2932/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/b57f08cdfd371921c82759948407d4e19b53f413/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/d0b0446d0073f37789e34af6dae32b08b70c1e09/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/763eb3fbb6c90d977ad3866972e9092c438947ab/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/45181a293debe3564dce52f561f2b3126a14b67c/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ed61f2d694f7043f1065b8cfe1ff26d5701be32e/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/c19ec7c52b36c33393100d2a405ef93800f909e5/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/c4386eca4db78e3df1fc4f82f7f17d69f2690bae/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/aaeb808d7b629435da97ca24b4cf96d2ab855f9d/
    mipsel |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/9fdd1a87e7e7ac48d0f0fe650032bc933730e375/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/7e1ab623cdfdd4416b157726d6ad51c8bf1d3e1d/
  mips64el |                   libxcb-1.8.1 | NOK | http://autobuild.buildroot.net/results/674fb1eaf9724d093f8c3211edf98eb9afaefda7/
  mips64el |                   libxcb-1.8.1 | NOK | http://autobuild.buildroot.net/results/3ff86aa993bfca71b3634cc68da478e56e87b79d/
   powerpc |             lttng-libust-2.2.0 | NOK | http://autobuild.buildroot.net/results/a29ca7865af5f89f5bbfe22c3a13434fc037ad9b/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/7d0eee796407880a4554474e5affbe98b8caa271/
    x86_64 | make: *** [coxpcall-legal-i... | NOK | http://autobuild.buildroot.net/results/682c4d67cc342a0ed0908698036eb1f64c6c5add/
    x86_64 | make: *** [dhrystone-legal-... | NOK | http://autobuild.buildroot.net/results/2430ed21e888bcde434a3662c95748b058be0ff8/
    x86_64 | make: *** [distcc-legal-inf... | NOK | http://autobuild.buildroot.net/results/c86bf115fde6dfaf75d11a81e6f534fefb393d4e/
   powerpc | make: *** [evtest-legal-inf... | NOK | http://autobuild.buildroot.net/results/75f668bf6f088b97adc2de639e5b27663673f47e/
    x86_64 | make: *** [exfat-utils-lega... | NOK | http://autobuild.buildroot.net/results/a2411a863cb683d2dc288617216ed4587bebee65/
       arm | make: *** [fbdump-legal-inf... | NOK | http://autobuild.buildroot.net/results/3035a5844a7568cd0198445fd82fed29b1f057a4/
    xtensa | make: *** [fbgrab-legal-inf... | NOK | http://autobuild.buildroot.net/results/5f91f5dda27e0be2cf93b569b57c15c8a20076ab/
    x86_64 | make: *** [jpeg-turbo-legal... | NOK | http://autobuild.buildroot.net/results/9ca4f5d148265abde913b10751f6a5ee4dd5ccde/
      i686 | make: *** [libecore-legal-i... | NOK | http://autobuild.buildroot.net/results/18e056a7bfd4e8f18b847c096a4485a6d209f7fd/
       arm | make: *** [libecore-legal-i... | NOK | http://autobuild.buildroot.net/results/94dec19ce003acc262594f09472c94252d4b7b57/
   powerpc | make: *** [libefreet-legal-... | NOK | http://autobuild.buildroot.net/results/b4c1a8e2ca33c4771d3735eaff4b4fb61cb9e6f5/
      i686 | make: *** [libnss-legal-inf... | NOK | http://autobuild.buildroot.net/results/288bf34c89165b7926df8427aad2607eb2ae5ac5/
      i686 | make: *** [neon-legal-info]... | NOK | http://autobuild.buildroot.net/results/ea4dfc3d319da3f0ed5927087d2444b1e7210326/
   powerpc | make: *** [polkit-legal-inf... | NOK | http://autobuild.buildroot.net/results/ef70498f91155cad46019824d6b20797a0801dfe/
       arm | make: *** [ptpd-legal-info]... | NOK | http://autobuild.buildroot.net/results/7ef0d70cb90fba2dec1f7c8460edbbee9f24ce0b/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/8eb0f2f04c70d93a8225bf5cdf884cd4bed1d7bd/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/0b851b7969c66ccfccb9b0c791877d91bee2f399/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/26760bb7aa43b5de05b93c458ce08e93d2fc1437/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/0f374311152f9137d238b6b4e680005290577aba/
      i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/a29f072955262648a6835c9039e9b82df4e1881f/
       arm |                   opencv-2.4.2 | NOK | http://autobuild.buildroot.net/results/e569f4493f0e5424f3e99426ac3864440fb486bd/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/4cdcf69e9201bb72fa66faa61da22f5ac89c6588/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/6d22eaea3d0913e1be2d5c751e68eda532cc6793/
    x86_64 |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/d790a21f5a726534c74ad5eec63f1ed71209dccf/
    mipsel |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/e58db75c586b8b81e57fd75a851de02d7ebf6ba0/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/68d94410fc1b7ddebe7c82957892c4da6952dac4/
  mips64el |              tvheadend-5956233 | NOK | http://autobuild.buildroot.net/results/1d759a168d34b4d512df2e23ee78adf0c20144f2/
       arc |              uclibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/96bc587eb3fcb348b686472cb7e033eaa9f372aa/
       arc |              uclibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/9be385b2ff176b396b650b25d24c63032d66d5b7/
   powerpc |                       udev-182 | NOK | http://autobuild.buildroot.net/results/9b370ec3e8d639ae6749ac7e5a931847b6892c86/
    mipsel |                   webkit-1.9.6 | NOK | http://autobuild.buildroot.net/results/8bdeb01e7a55bd4c9a1ab02803a629712065a798/
       sh4 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/d39b183c494695fe9146a8f66598bd3b237d6b48/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/a833b78c15a63670c4854af7cef25124645a7b99/


-- 
http://autobuild.buildroot.net
