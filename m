From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Sep 2018 08:00:48 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-28
Message-ID: <20180929060048.8B1DE20AB1@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-28
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   1 |   0 |  25 |
   2018.05.x |  22 |   1 |   0 |  23 |
      master | 154 |  91 |   1 | 246 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-file-5.33 | 1 


Detail of failures
------------------

     aarch64 |                 host-file-5.33 | NOK | http://autobuild.buildroot.net/results/a1f2369d31c2387efdec908877e0bcaa728b5aeb | ORPH

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                   mpd-0.20.18 | 1 


Detail of failures
------------------

      xtensa |                    mpd-0.20.18 | NOK | http://autobuild.buildroot.net/results/13f8c894741edf8ec6181389074fb473c1b2efae |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 21
linux-firmware-44d4fca9922a... | 20
 Makefile:709: target-finalize | 11
              ptpd2-ptpd-2.3.1 | 8 
                haproxy-1.8.13 | 6 
                  boost-1.68.0 | 3 
               bootutils-1.0.0 | 2 
                   dante-1.4.1 | 2 
                 lvm2-2.02.180 | 2 
                qt5base-5.11.1 | 2 
          synergy-v2.0.12-beta | 2 
                blktrace-1.2.0 | 1 
                    brltty-5.6 | 1 
      docker-containerd-v1.1.3 | 1 
               domoticz-4.9700 | 1 
                    efl-1.20.7 | 1 
                 gadgetfs-test | 1 
              glibc-legal-info | 1 
                host-libsodium | 1 
                   mpd-0.20.21 | 1 
                   netsnmp-5.8 | 1 
               qt5webkit-5.9.1 | 1 
                  samba4-4.9.0 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/0401d343748b3b288cea2adb506d9aeb19a1cb45 | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/afa4a63c978f0b8747300203d39abfcc761eb16c |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/0e83ef2c0286b81343eb19df75b0b47fcf614266 |     
        mips |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/34eaf7480c4d744cf334268259f8f24d4268a43c |     
         arm |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/439a80c912ffd2bc822cabe1feac2afca0e1df11 | ORPH
         arm |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/c26761663a764a2eb7af54316a6dc78bd01490fb | ORPH
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/ad18def6bfe46c180da9833de85a6a54d3e4fd26 |     
    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/5d964b00685fd0a387a44c3a36d24aed9f3d2c35 |     
    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/7cfbb85c22015ef839619d834cb7cfb8ac899e55 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/96b2927c7a9f73f2b7fa4d93d1a975b8e65397e4 |     
     sparc64 |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/1c7cfcbae5ae14c2dc3e966de646304cd6a949f4 |     
      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/e1c6e01bb8fbbb9d7ae3b72da181c4e872d6fbb3 |     
         arc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/f1e78832b12a50596bcfbc1de134158b535fc3c4 |     
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/4fe8f89e733455f553e3e792208f4e83c26a1706 | ORPH
         arm |                 haproxy-1.8.13 | NOK | http://autobuild.buildroot.net/results/bf15ce4997ee1046a797264485065aaad5667273 |     
  aarch64_be |                 haproxy-1.8.13 | NOK | http://autobuild.buildroot.net/results/28b6672188bb0082ac1467d3b45904880e3634f3 |     
microblazeel |                 haproxy-1.8.13 | NOK | http://autobuild.buildroot.net/results/490bc87b43074623d2338cfd2acb77d5de0abaa6 |     
       nios2 |                 haproxy-1.8.13 | NOK | http://autobuild.buildroot.net/results/180843a353dfcff6e4397c5578ca037354b48d59 |     
        or1k |                 haproxy-1.8.13 | NOK | http://autobuild.buildroot.net/results/74cb5477f07dc7ee81b180ec1871446ceaf472b3 |     
     powerpc |                 haproxy-1.8.13 | NOK | http://autobuild.buildroot.net/results/528eac96999b1e5c34e63467c57b4e527d7712e6 |     
      xtensa |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/d6b0033be61461d03dcdb639e216e6e895651d8d |     
     aarch64 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/418361f0b2bda9c5d4786f17ec0505a6302cb009 |     
     aarch64 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/1519be02df701c8d88dd7ab5cc9bc20fe0d95b38 |     
    mips64el | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/a808e7d20c56421b1f3f0de1549efa1ca148ae64 |     
        m68k | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/1ff016d46fd42498b9a313e5ee1d0b8a93ead97c |     
microblazeel | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/bc5d4f7cfffd203b8c5700e2ab0e611cc6a01f28 |     
     sparc64 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/54cd102bdb4c077413fee0628cdba8b018598940 |     
microblazeel | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/9d7a9bb484de74a46903371e91fec7f363be4885 |     
        i686 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/7476becbbcac8262658a8db2ec2a14b4903d5019 |     
  aarch64_be | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/d95026e28e83d30e3c64ba918805624d83d6ad09 |     
    mips64el | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/e6a3f4ffb3d081284b7234bf86244dec39ccdbfd |     
         sh4 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/10a9dd13bf7eb4e21a5586abb03e6ed0f07b9c63 |     
     sparc64 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/81ba22c2a76b4bbb7ffeab717381ee6bc5a6b00b |     
    mips64el | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/410c435efa7021123ebb78232b1f948b2ee3ee30 |     
         arm | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/039b8526c5634fbb64aa45d6143d9a987e0cdd8d |     
    mips64el | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/9994b6540f615fcd610331b1511e4b766ff9fcac |     
   powerpc64 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/657602c98d49e63d20ea4a16b1480d83c0b241a2 |     
    mips64el | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/1ffc65a3c125a028c0fa96ceaa14f3ecd4294395 |     
        i686 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/6d13341fd185dc61953825f2f050078760280508 |     
     sparc64 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/4c0b0587aa68115feb8119fd2d3f9d24529db0b5 |     
   powerpc64 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/c2359fea7a4244c53723b0bee37b80d4d29e395a |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/152e520722c0bd98e8a1e4b5c3b89f8ec179b982 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/6d1c5d4daab960258058c25eab831142305c0438 | ORPH
    mips64el |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/151b0948f0b7cfa63a74734466d14adf356f45d6 |     
   powerpc64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/af5aa804c3612ff11d285c80ec80ca7ebde5cbc7 |     
         sh4 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/3e813e5d613cdfd7bf2c5b3150c019f50cdd0007 |     
      x86_64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/970a4094da80971da5f977c1b14476de3cebb465 |     
         arm |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/463bedda6d9947abbd512c285e4f756c8d7fcc21 |     
microblazeel |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/fec38fb2316e917bfa07afe052c89b484f261b39 |     
        i686 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/7840382c1eec70d934473b173711175488756ffe |     
        or1k |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/c111e6be562990df2df462c5a5eee6ba63931981 |     
        m68k |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/4697802bb01e78a3b5a18f2fd2ac069f3c287254 |     
        m68k |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/e7cb6621b634916a2a15c7b38d3107820e971a2f |     
        m68k |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/2f02919186330f8d228811e7b3a92b99a5a464e0 |     
        i586 |                    mpd-0.20.21 | NOK | http://autobuild.buildroot.net/results/bd86fb8b4e4ebeaddb62c6b8a2f88b950c94e5f6 |     
      xtensa |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/b843afbed9d475fed262d93edf564b8ff5b383e9 | ORPH
       nios2 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/fff513bca67bc7b4d42e8c179fd66f99ee7fb283 | ORPH
        or1k |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/c599daf59b8e56b72e1f6b6e89d3d2c668047749 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/4f17f28f01df556ea69a2172c38dc020fda7e4ee | ORPH
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/7b9917625632938ffdda1947c4426d20eb18d902 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/e2f4c5af193e4cfd70a1ccde668ef09d2596d342 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/364bc316606350fcfa40532731fe61a158ab36ae | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/55af0c2caa9dfcc524203ff3b62709087fd7ba62 | ORPH
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/f65ff6ed8be4a677125b38d722f90d5a0f4cdbff | ORPH
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/fb4168a2c73a6ec188404d5b5bf248b58e02cb7e |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/892cf41db216f59b55d989ee9e162983ad8e6b91 |     
      x86_64 |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/f246bc8157f2fe7b0e31432f761b7c292926251d |     
    mips64el |                   samba4-4.9.0 | NOK | http://autobuild.buildroot.net/results/6c7548283cc5a3bba299bd9144d5c70c9d5a9003 |     
         arm |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/712745d00df5b605ef58d40f4eeff06ab43f0987 |     
        i686 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/4ca2317ef52978a73a46480ca411091d425f9bfe |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/6466439e784f72dfba83c789404e0f4fde40bcfb |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/4d53a3bb956be388caf13c7975fd10c67d92edf1 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/27cb0bff4632f5112fc897d266133ba564a0b20c |     
        i586 |                target-finalize | NOK | http://autobuild.buildroot.net/results/5dd392f9c61d7187a826e932d0786a2f3b12fdee |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/e169ba7606f5226f032c740e9f096f6bc1c7ce31 |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/f634048bf7db47ca596164aa634acdef09681804 |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/1c1a51f0049a4436bd5defa2f7340bbff1914c3e |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/609a8baea7dbfcf8f5d8bc0d178b758a93ed3c4e |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/e1ae2a0fd0597986281baa8b66fcea77f5ddbb69 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/6d04381b6324d321cea019327bd3d21904f6fab0 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/250c17ffaa4e3b5d906ea4ee8c468bb773a2defb |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/e27461f2fa00c2f99b3876427531269fbe91a38a |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/2961a7fc054ed86b0183ee830048817b8dfe3422 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/740b6737b47f80dc81ffedb67d6b5458c1a129be |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/94856d292d0cfa513cf60f3b24e0858e6cf56779 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/0fa0687328ec3edb92db15927ab0077caa8d68bc |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/792da5b62683988d3f1e5a2a5d81a06a4523be5b |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/b23fcfc9927f767bbc32b00e582887ebfe4926b5 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/f8cb5c0c78aede6078b8517e1d883d33355c6327 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/c236081e88b6edd42289360c67051dad4c1fa380 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/3a40c23bc44eef642c9de7dfa2776161535ac61d |     
         arm | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/aa96616d5326bea85f57fa6aa735a4d9243c9315 |     


-- 
http://autobuild.buildroot.net
