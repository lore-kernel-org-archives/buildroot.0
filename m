From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Apr 2017 08:28:42 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-26
Message-ID: <20170427062842.48D022077A@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-26
================================

      successes : 123
       failures : 55 
       timeouts : 1  
          TOTAL : 179

Classification of failures by reason
====================================

                    ola-0.10.2 | 12
           aircrack-ng-1.2-rc4 | 7 
                protobuf-3.2.0 | 6 
                 mplayer-1.3.0 | 5 
                    mpv-0.25.0 | 4 
           uboot-tools-2017.03 | 3 
                 xenomai-3.0.4 | 3 
                 binutils-2.27 | 2 
                  libcdio-0.94 | 2 
                  samba4-4.5.7 | 2 
                  boost-1.63.0 | 1 
                busybox-1.26.2 | 1 
                    ffmpeg-3.3 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                libepoxy-1.4.1 | 1 
                libselinux-2.6 | 1 
                    mpir-3.0.0 | 1 
                  nodejs-7.9.0 | 1 
                   scrub-2.6.1 | 1 
               wireshark-2.2.6 | 1 


Detail of failures
===================

   powerpc64 |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/e1569dac0b663b9c81d7b4eaabdcd557d4ab6a06 |     
         arm |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/b54bc31e820c906b501f390aab7d9a02e94fe490 |     
    mips64el |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/4b95875b9317f44cfab707de8a70e2f691a6a703 |     
       sparc |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/f10fd96a5ba41f7aacc3d1d2314e46dc984a9caa |     
         arm |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/7631470016f923e8f4a7696e65437c71b8668b6e |     
         arm |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/8182ce148de1127581813c0edbd90a33ced1d3c9 |     
     powerpc |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/309345957dfceff5b98f1bd360b0b420757ebd1d |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/f861555ae03535d611a1ae448a210afaca7525ea | ORPH
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/42e506b65ea3cb1bc4f74d214d96906aef561c7f | ORPH
         arm |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/2bc6919fc1183208fe5aed1c220b4d17325138c2 |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/ab7c50788d1f90ee51d3d1825d4ba2a55812e51e | ORPH
        m68k |                     ffmpeg-3.3 | NOK | http://autobuild.buildroot.net/results/899271c1e1b1da9c8cb0ab5cb03bc1e9d03eb34e |     
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/3858a1fc8c414a9636a5fd5b22d824cf2e28adfa |     
         arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/13c5cdede0221db4cacfac8a5ab82993cf35ced3 |     
         arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/e470fd6fd38a1052856d3eec190b9a025337c175 |     
   powerpc64 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/d2207e22d2a6c851b95739e2b1df32f9100a1f59 |     
         arm |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/d387aa27d248f8ff5bdc970ed5e14cb09c36e541 |     
         arm |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/fd032f7dbd4cace84bb31e8017cb6139ef3c1072 |     
         arc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/8461a0f1d71e42891e4a6e2d6dd5754cb0bb674b |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/56bdfeea2c1f6b1a993fe7ca2a33221a59476ea9 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/97e792cf9dc41f5678171385abe7966593cea33a |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b4aa3e3967e99284444928cd820634f4fc5495d5 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/36e4d8b7c2f7f9eda50c83782662c2ff6dab78ea |     
     powerpc |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/a4fc6d0107620a3558a9e6dc662b5766d77bbadb |     
    mips64el |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/f0ccc6cdd41a3649484e806d699a204ecc3c6a25 |     
        mips |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/07a1527066cd87d3a4a0f600bbca326b77fbe5a5 |     
        or1k |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/b658bd27a391c13731498d01256ff96719044ad6 |     
        i586 |                   nodejs-7.9.0 | NOK | http://autobuild.buildroot.net/results/df920e7b17617f1e4867d94eda52cab38f7b0622 |     
      x86_64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/bd30895d22003fb572abbffef849db1d58d384d7 |     
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/70073c38a91d0ac7fa98769323f0e8b3829df94e |     
        or1k |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/d6d657ae4437434887d0ad7f9d103a8a61bd8795 |     
        or1k |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/aaab38f94fd58e3119437278f9dcfdf5418abd76 |     
        mips |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/d0326ca1e7d0a5b5529484ecb5c58f4e00cdec61 |     
     aarch64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/261482eea27739eccd9a93326cf4227c2e1a00d4 |     
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/154f221cc607b3629dfcbb04013cf0c118b47070 |     
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/30e7daf0bf5fd74a13665352e684abe54b485ef7 |     
        mips |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/b83207bce589ecc85fbd1d353a40a1df7a2c3d5d |     
     sparc64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/787bd10cbdf9e3e80f197fc51801e11eea926e2e |     
      x86_64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/c9e389eb9db9620bd64b0f0b5e505b61314386bf |     
        mips |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/a423cf023d9f53c98d3042c81b8dc9dc446bba6c |     
         arm |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/c86f0df9c6f1f437e9887236618d93bb34f66d3a | ORPH
         arm |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/f7a47ee73ea7bae816c5bcda85a43f8031baaa03 | ORPH
         arm |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/f808670378ae66bab2c842448b9537083db43571 | ORPH
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/1ee16a289d1bc1061b2c45448d1545304f640190 | ORPH
      x86_64 |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/1dac9d5e49342700036c90ed4785fff7398b8966 | ORPH
         arm |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/da07861304ed14096edeaaded646ac109689b980 | ORPH
         arc |                   samba4-4.5.7 | NOK | http://autobuild.buildroot.net/results/01eaccf39a15557fa7a1a480b40ec2900f6eac03 |     
         arc |                   samba4-4.5.7 | NOK | http://autobuild.buildroot.net/results/1e84bc9271f8c18574a14d8468024f418a6b302d |     
         arm |                    scrub-2.6.1 | TIM | http://autobuild.buildroot.net/results/5d8dd2faf00d7240ad77d5eea5a366cfb413e20a |     
        sh4a |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/ace34f91656eddd038ac94c3de977ff9ca7e72f0 | ORPH
     aarch64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/cef4074286d3bcbb5be5e8f90134bf2613c69eae | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/1510f33692d04f0a18eedb6ace18fcc7b1029a0b | ORPH
         arc |                wireshark-2.2.6 | NOK | http://autobuild.buildroot.net/results/0a76f86a0373067dd37ab27e13e4fde825631975 |     
      x86_64 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/3ff8f5967f1e7afd4f46259dc3121b0405b2de6d |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/c0ffeb4c6c84153ed7dab0976f9313cd959f9a5e |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/6a5dd7a52b4cc6281193df29b63d1ba0d9c93479 |     

-- 
http://autobuild.buildroot.net
