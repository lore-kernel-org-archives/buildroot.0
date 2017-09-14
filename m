From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Sep 2017 08:31:41 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-13
Message-ID: <20170914063141.5B3FE209B4@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-13
================================

      successes : 176
       failures : 38 
       timeouts : 0  
          TOTAL : 214

Classification of failures by reason
====================================

                openjpeg-2.2.0 | 17
                 lcdproc-0.5.9 | 3 
                     mdadm-4.0 | 3 
                  boost-1.64.0 | 2 
               librsync-v2.0.0 | 2 
                       unknown | 2 
            xlib_libXpm-3.5.12 | 2 
       gst1-plugins-bad-1.12.2 | 1 
                libcurl-7.55.1 | 1 
                   luvi-v2.7.6 | 1 
                   mp4v2-2.0.0 | 1 
    python-pathvalidate-0.16.0 | 1 
                      qt-4.8.7 | 1 
                  stella-5.0.2 | 1 


Detail of failures
===================

     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/20dc7ffe626ecc8ca72a1a5f1472462ab39c3464 |     
     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/da5761c42581f7caff45513680f02a58b11bbd91 |     
     powerpc |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/a5506619a0d49f1f3ded4622828f90ec0c0939ec |     
      x86_64 |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/906ff044e92160bcd1eef11d6762d9ca98edcd9d |     
         arm |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/558e427ce9b08dfc49de2bf1ee74640c57200514 |     
        i586 |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/3e69ebc57ebf39341d06cb9e629d1eba352c5e63 |     
         arm |                 libcurl-7.55.1 | NOK | http://autobuild.buildroot.net/results/411c29ee819913413d82018dfdb7f99eb509633c | ORPH
        m68k |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/d6aaefc2af989d7fadab2da79f0394936e01f4f4 | ORPH
         arm |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/4b8db2d520373d0c9127e0d7695b5aeda6925dc5 | ORPH
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/83b32abde1b20b53d9b62a764be39aae373f443d |     
         arm |                      mdadm-4.0 | NOK | http://autobuild.buildroot.net/results/f3b3cc041ed4ed83f2bc6bbab539d64893f466fb | ORPH
         arm |                      mdadm-4.0 | NOK | http://autobuild.buildroot.net/results/3f48219fd909fa38ef4e2e48045039879dc944a1 | ORPH
         arm |                      mdadm-4.0 | NOK | http://autobuild.buildroot.net/results/f537f80fe2df22c0842841ea7214648bedd51964 | ORPH
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/401f601b5805bdd9cc8aa7075d8e260bf41176a9 |     
       sparc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/97bf5de4b1d8a325d522701f5918d1ca23f9a594 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/2696c277a5c80c5b64c5d8fc21699047a474cd03 |     
microblazeel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/569292133f677415e4e8f224141b5e6196788e71 |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/8f38f29229cdf8da48b1dff3dc23a7e283bcf80a |     
         arc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/1bda9b46b12ddeff4cc01e345a666b5c29b8ba97 |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/9d9ba3c2698c3cec7b30582d99cbd858030451a1 |     
       sparc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/8eb88b7feaa4a3bcb1e4ad6a68b20e2dc3c36af1 |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/66b68f0e04371785e0866b4aecb73f074facfee2 |     
       sparc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/0046bbdadb58b4b37e8974fdcf962d2ef63dfd80 |     
    mips64el |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/75527d792555d4a8ef82afad8be26c8d69a87372 |     
        or1k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/0a5e2e52d5fe6aa3069e6c4c6b12520d0760f8fa |     
        bfin |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/8a5f17cf58148c803595d32de5030ab317338b17 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/ac1937a2313efcd5f1e26e18bcc743a0bfee4b0a |     
        bfin |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/2fc61463956a662438b7992a6b22892779e490f1 |     
        bfin |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/41332a25f0ca14220a75609f315e701547860bc4 |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/326df2db0001f9168bb629f4fcb6c57970e08ceb |     
         arc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/e3ba9d02f07118994140a5269ea8df2929fde4ba |     
         arc |     python-pathvalidate-0.16.0 | NOK | http://autobuild.buildroot.net/results/0f3112e82a69b439498eedc250e085974e70889c |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/708066ef83855d1d1741098c2721d8076c9640cd | ORPH
         arm |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/6106f851c389f91b123005617f7e8c1b79960f04 |     
         sh4 |                        unknown | NOK | http://autobuild.buildroot.net/results/14ba18cd0c46d4c466be2154951764079e36a844 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/0bcc356603691823d95920fcd1e51a80e0e0495c |     
      x86_64 |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/db7711e9c1f73c16ef1de5ba69dcfc03f73e8529 |     
    mips64el |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/26f771ba8a1f84f843bf2dfdd4dcb6762182420e |     

-- 
http://autobuild.buildroot.net
