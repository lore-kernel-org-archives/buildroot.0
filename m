From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  9 Sep 2017 08:32:46 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-08
Message-ID: <20170909063246.2B388229FE@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-08
================================

      successes : 149
       failures : 31 
       timeouts : 0  
          TOTAL : 180

Classification of failures by reason
====================================

                openjpeg-2.2.0 | 10
                   strace-4.19 | 5 
                  stella-5.0.2 | 3 
       gst1-plugins-bad-1.12.2 | 2 
                 lcdproc-0.5.9 | 2 
                libmbim-1.14.2 | 2 
                     mdadm-4.0 | 2 
                  boost-1.64.0 | 1 
             lttng-tools-2.9.5 | 1 
                  luasec-0.5-2 | 1 
                   luvi-v2.7.6 | 1 
               turbolua-v2.1.0 | 1 


Detail of failures
===================

     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/76c33de9cf07de802d05e4d5a5c1d7ec8d799423 |     
         arm |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/4ae684910bbfcb147d2ed52f769c1033c68055c6 |     
         arm |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/6b07f32e78a7cba333e6ca86a68069abaa11d4d5 |     
        i586 |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/58a9b98d08060c6ed9e8855ba9f59d03aa2f3e2c |     
        i586 |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/5b2c1bc872cebc7aadf93995b71178bba29e0b25 |     
      x86_64 |                 libmbim-1.14.2 | NOK | http://autobuild.buildroot.net/results/121479dad39e9f2f49844d037f859beb6e8fff8a |     
         arm |                 libmbim-1.14.2 | NOK | http://autobuild.buildroot.net/results/641542cfeb3064f31e8da31134491b58d26efe8b |     
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/ae1ec3aad4c0af06da887f6cea403b06fced3598 |     
      x86_64 |                   luasec-0.5-2 | NOK | http://autobuild.buildroot.net/results/8e30451bf56098632745d94d13bb60859675a5b4 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/6d5df91fe7856b4855cc8913f9c7c964745f8e87 |     
         arm |                      mdadm-4.0 | NOK | http://autobuild.buildroot.net/results/f7fb7b13486c1b3b9d99513ac9a502a972cf3ddd | ORPH
         arm |                      mdadm-4.0 | NOK | http://autobuild.buildroot.net/results/8ce2002816184a6317c1da5762843d831b45c472 | ORPH
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/9bef36af4e4ffa1a67da9e7779d41afa23405a2b |     
        bfin |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/09c2f4caf256d70bb21e3bfa8601e28680dadd3d |     
     powerpc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/2ceae5a917ba9c5781acafb89f6b558e50c78dcc |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/6e4f55c5dfc03515f3d35090cfd46b53821cb077 |     
         sh4 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/cdfc77dd747973f7634ed3c1e30edddf1280cadc |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/35dcc43aba74d0aad446af511ad2811bc022641c |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/e54e5b90da9f258a9e5b3cd3bc4819d634b49018 |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/87a9734d14af2c5fb5bd380bd6e067b98620fe92 |     
    mips64el |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/682fb26eb4deb92911fb0340f1591aef5d8663d1 |     
        or1k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/0fe7152c0340c8afe2817aeba230165dbea1dd95 |     
         arm |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/bd30388ee24294158d0a373764408c8c846853d4 |     
         arm |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/ad1571cecfc697650b436c147b5f3a1b4326091d |     
         sh4 |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/ce65e99740d6283061dd92c6194b7713124f63a8 |     
      x86_64 |                    strace-4.19 | NOK | http://autobuild.buildroot.net/results/5f0852f3ffb46f8fb2b4c9318652c5ab3ab5e97d | ORPH
       sparc |                    strace-4.19 | NOK | http://autobuild.buildroot.net/results/9a981a2ceba3143f426c3e9ed330661fe901845a | ORPH
      xtensa |                    strace-4.19 | NOK | http://autobuild.buildroot.net/results/c8e3de926dd6c5d9bdc3b3010fcd02df86a6326a | ORPH
         arc |                    strace-4.19 | NOK | http://autobuild.buildroot.net/results/625c110ff4cb360feed9d76abbb333c041b75d7e | ORPH
       sparc |                    strace-4.19 | NOK | http://autobuild.buildroot.net/results/579144974c8309d74967a41d97af63d6382d64cb | ORPH
         arm |                turbolua-v2.1.0 | NOK | http://autobuild.buildroot.net/results/6f107b62f105508044185576b071323e5d73dd83 |     

-- 
http://autobuild.buildroot.net
