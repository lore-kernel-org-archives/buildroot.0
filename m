From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  8 Mar 2018 08:00:30 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-07
Message-ID: <20180308070030.7B02A20993@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-07
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  11 |   1 |   0 |  12 |
      master | 141 |  56 |   0 | 197 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

           cups-filters-1.17.9 | 1 


Detail of failures
------------------

         arc |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/77a6369f3530a2a6a055f7fd664f1ad424274d77 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

zyre-1d949e4bf79b694ea883c3... | 14
                    htop-2.1.0 | 10
                  ntp-4.2.8p11 | 7 
                    liblo-0.29 | 6 
                  udftools-2.0 | 3 
             bluez5_utils-5.48 | 2 
                  host-go-1.10 | 2 
              keepalived-1.4.1 | 2 
                     php-7.2.3 | 2 
         libcpprestsdk-v2.10.1 | 1 
           libfreeimage-3.17.0 | 1 
                   libxcb-1.13 | 1 
              lm-sensors-3.4.0 | 1 
              lynx-2.8.9dev.16 | 1 
                poppler-0.59.0 | 1 
             qt5location-5.6.3 | 1 
              wireshark-2.2.12 | 1 


Detail of failures
------------------

         arc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/2118d3a8cc497c53de3a00688ccc4c9952e37f13 |     
         sh4 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/8daaa71e5a7890a4171fdd062ecfc5f2efab77a5 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/67f08ae7b113a1c3ac0d468ca95353bca0a80a85 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/5dd7e31331dd06ee9a038e6efd98054c3ef93b40 | ORPH
    mips64el |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/0791374657f33c130169d00d6f1708f2a6b8273e | ORPH
      xtensa |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/b90667acc1c26fa21a2eabe152b98edfc1f64d4b | ORPH
     powerpc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/4409d510c62823a99d0b01c08060151d4a7e20ad | ORPH
      x86_64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/71ded71c1d11a1952f68d82f13b7cdd0b70e9378 | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/f3a900e56dbb1fa15f456260dd12debb954fc29e | ORPH
      xtensa |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/335cdfb6a262a63928851714f46e050f43ef5468 | ORPH
       nios2 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/4dfc3ab1af995df2a5c49fdbdc63917aefc32760 | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/2023b3006c27242b041c9f85206932da942453de | ORPH
       nios2 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/fc130465b6f2846168719e9065bd64e00ceaf817 | ORPH
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/ab1c31e8075b619148d13b9e1a209aaefb888481 | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/57affc396984229ea6d7f9371f5c8adb6b9aa8c4 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/bfcdb69fe97484a5815b6211937a9332314e6cf9 |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/1eda2ce26ba1702cfeaf9243763547d0d7fcd760 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/7c82f7ca2bfdb0b209ab7ddbb7fbf7d7e9c8499a |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/1b8e67a348fd9ebd48af9fb7914156c56c8b6ac0 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/29d0b3a0c1bd6046b3290aa57e58a0ed51826894 | ORPH
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/00a1af9ccca0cefe5dfe8d9575150642d50c9014 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/1ddd6e0c3e0434a714021341ce4a3e8b19a4c612 | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/b79d3bc010bc3aed934a6ac6cefacd60df9e4064 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/cdfe21023e311b3bca218e0f83fd26a40c11c184 | ORPH
        mips |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/b535a765f47530544e4da96bde8a7599dbe3eaa6 |     
         arm |               lm-sensors-3.4.0 | NOK | http://autobuild.buildroot.net/results/25d580bee6f609f6b28ebd6cc96d180179901b0e | ORPH
      xtensa |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/2413808f2c918ecbc65a261072f38da1cce6643e |     
         arm |                   ntp-4.2.8p11 | NOK | http://autobuild.buildroot.net/results/60e8b9864932f2cabc7deb43234abe168bd113c5 | ORPH
         arm |                   ntp-4.2.8p11 | NOK | http://autobuild.buildroot.net/results/a9c26d11b40d5aef030e28a0d61aad643a0abb15 | ORPH
      mipsel |                   ntp-4.2.8p11 | NOK | http://autobuild.buildroot.net/results/519ccf7915c334af13a36efa5a4f244c42112d52 | ORPH
      xtensa |                   ntp-4.2.8p11 | NOK | http://autobuild.buildroot.net/results/5ef41032f4be842ba52c00efe7434b848b2808dc | ORPH
         arc |                   ntp-4.2.8p11 | NOK | http://autobuild.buildroot.net/results/d1d11c1a989510538ccd5ef3a6c49f73e416a820 | ORPH
microblazeel |                   ntp-4.2.8p11 | NOK | http://autobuild.buildroot.net/results/b070fbc66a928888df8d2561dad3632778d55e0d | ORPH
      xtensa |                   ntp-4.2.8p11 | NOK | http://autobuild.buildroot.net/results/592db6836817bb078a2f1146d2ce6241bf7997a3 | ORPH
         arm |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/a85b82ac70c2f2c4f94f9db2c659d48beae3ce7e | ORPH
         arm |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/898444dd97434fca30c834ce1fdc92f1e070b52f | ORPH
     powerpc |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/ad3764700449eb953393b1100af57748bb4ae92a |     
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/db8262c3cd5b49ae872d0646a4d81f9b32157351 |     
        i586 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/9ab9f9d2c8c23f06d70c13b8fc4e6465f2bdb46d |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/388f4105f927a9932fb0fd095ead5a96a8d82f4f |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/8dcf2db588c44913f6a9e2bb18a6fb866eeb7c67 |     
         arc |               wireshark-2.2.12 | NOK | http://autobuild.buildroot.net/results/efdf43693dc113a7bbbb941e29860aefd84007bb | ORPH
      x86_64 | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/53c6b222d77517f6528acd3bf7ea7e70a447c24c |     
         arm | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/344c210be73e3a9cb4176672593488dc7b93defc |     
        or1k | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/3ba35c828cb118ce69b50330704fa1968d896979 |     
     powerpc | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/b3d7b68da71c2dbf16800b765ab4e75143656a83 |     
      xtensa | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/6667b9ddf512dd987f3c8624ed03610cf8b1aa18 |     
         sh4 | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/5fe35d52d29556b3bb66fd4d10a76a09897a7ba3 |     
 powerpc64le | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/7bbaff020ba34310411f4036d019414bda0675cf |     
   powerpc64 | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/d48d3ef6a39b0f1dfe4aaa439507c42356dee5ce |     
       sparc | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/979617ae8b984077d1d8c7284ef0431a4b1cc6ab |     
   powerpc64 | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/8eb576713cd319208b511ada0d513d5841b46f76 |     
     powerpc | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/4ff4a709a6479873414bc5f242bbe0f191c047ea |     
         arm | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/257f6ec1b55e5f5f41e8b389e6affa712d5431b1 |     
    mips64el | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/438d37c932766ef8a21445f6935dfefd17f1db7f |     
         arc | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/871a34ec4f46ce1e6d98154bd3dddfbf875d9b18 |     


-- 
http://autobuild.buildroot.net
