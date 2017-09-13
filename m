From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Sep 2017 08:31:01 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-12
Message-ID: <20170913063101.272BC20762@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-12
================================

      successes : 146
       failures : 43 
       timeouts : 1  
          TOTAL : 190

Classification of failures by reason
====================================

                openjpeg-2.2.0 | 16
         s6-linux-init-0.3.1.0 | 9 
       gst1-plugins-bad-1.12.2 | 2 
                 lcdproc-0.5.9 | 2 
                libcurl-7.55.1 | 2 
                libressl-2.5.5 | 2 
                      qt-4.8.7 | 2 
                  boost-1.64.0 | 1 
                   luvi-v2.7.6 | 1 
                    mpd-0.20.9 | 1 
           oracle-mysql-5.1.73 | 1 
rpi-userland-29835184aa70c1... | 1 
                  stella-5.0.2 | 1 
               tinycbor-v0.4.1 | 1 
                       unknown | 1 
            xlib_libXpm-3.5.12 | 1 


Detail of failures
===================

     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/b363509d2995b0febbc380a673bc8bc5236c57ab |     
   powerpc64 |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/0221b642d071161c0db996179e278963c1e4fd74 |     
         arm |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/2657d338f5113619ed1ea707d3245d9db9a14fcf |     
        i586 |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/db8160376fd895d12002b5d023a1d5d9d68de9bb |     
        i586 |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/dd00738b87472ba59baaef9239ee95a06c532380 |     
         arm |                 libcurl-7.55.1 | NOK | http://autobuild.buildroot.net/results/39fa63fb2ecb75e4b2521d1ee3dfa357c4e5c594 | ORPH
         arm |                 libcurl-7.55.1 | NOK | http://autobuild.buildroot.net/results/5884cbafdf03d60f6a413d3ffe3951580a5e19e3 | ORPH
         arm |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/90959c03e25402171ddd7834120379cd23285301 |     
        bfin |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/1ea15be0093a23635a7ab70a670a07bdd3bcecb0 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/f78a1efe539016f18cb9c40ca36ecd3edfc87a14 |     
     powerpc |                     mpd-0.20.9 | NOK | http://autobuild.buildroot.net/results/b171dc2f0a0f602c0f86fab6f0498e62f193afa9 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/f3ee5e34585045e889c85bf9f0d900bbb8b08435 |     
       sparc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/1659464d50c1d0050fc1a46d27f1095b9818c4ba |     
     powerpc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/28765746b93438ddf5db06f8cc74321f68eaf85d |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/ab7c237563791628c71add99092ef6661860ccfe |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/afe7dd0e7b83b25acb3b32affeb4ee0e0fb26c86 |     
     powerpc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/620860438fa7a72fd000a3afe89c403b714c975a |     
    mips64el |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/3428c76e18eca5b27a994e7d1c7ff9803dac52da |     
        or1k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/4d0b9d344d1cd081779545ed8e10953e7d6ccf21 |     
       sparc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/f101b286338008ec7952971fe6cc75c5ad5539c6 |     
         sh4 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/aea0f6672231ee8e588f7da35172dc731f43af3d |     
microblazeel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/bbe509c8f633131150451aa4a6ffc5733feecc47 |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/5554381d5e9675070d582ad34ddbb19f72300871 |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/bf18335a96720fdbc8b02c2da088a40c84145fa5 |     
microblazeel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/777c00852310ce85464903d28970a1a92ee1d309 |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/fa9ca4ca50cf3a9e55b9827887459e444b3ec3d4 |     
        or1k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/a2675f84bc2d7995f819446d9183ab4fd4f0ffde |     
         arm |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/0a3948545704276adf38b2ea0ff7812607c5b7d9 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a54546a40ed922c7b5bf7468d9752ac6c4396e04 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fc519f09929401991ca26dce8b96cb91a882db37 | ORPH
         arm | rpi-userland-29835184aa70c1... | NOK | http://autobuild.buildroot.net/results/30f4f3981fe22ebcc7cf3268d31dbf30c1624c20 |     
       nios2 |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/38638064aef507a4f205a12020235a617140c1f5 |     
       nios2 |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/c6e1ff4157bb533992b96c197326d12542d0b53e |     
         arc |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/b8e77520a888acb85384ae65e6d9106f05a12adc |     
 powerpc64le |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/1275a0a946f2bbd5435c2415cfd7ffde35e23d10 |     
      mipsel |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/14fb969ef8691cfddeb1a4116ca4059b4b0b5863 |     
   powerpc64 |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/a0ea7c96d6b2a7642ca83ce358d7ef4313ed0c61 |     
      xtensa |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/8da4338f633ddc9207af4979c20bca345898646d |     
   powerpc64 |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/9750a5fbe1343636db1cc8912d95552000b7ae55 |     
         arm |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/6bc91a5c222df54fe396bf7e7f1eb3b9caf3446c |     
         sh4 |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/812b57a1e7b8eb1e19ff7ce1ad6ab5466005a16e |     
        i686 |                tinycbor-v0.4.1 | TIM | http://autobuild.buildroot.net/results/aa36b5e6890225ef345a9e2bd26f38e3e397e8c2 |     
         sh4 |                        unknown | NOK | http://autobuild.buildroot.net/results/f41c5d4dad9a272e28d2af85d815300a0684cf02 |     
      mipsel |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/a3b070911329d895b899bb6cfd6a470033dd2c05 |     

-- 
http://autobuild.buildroot.net
