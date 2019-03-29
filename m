From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 07:00:41 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-28
Message-ID: <20190329070046.9CC332A121@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-28
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   2 |   0 |  29 |
   2018.11.x |  29 |   0 |   0 |  29 |
   2019.02.x |  27 |   2 |   0 |  29 |
      master | 219 |  71 |   2 | 292 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               host-efl-1.20.6 | 1 
           qt5multimedia-5.9.6 | 1 


Detail of failures
------------------

         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/4deaa3cc79975fadc73a89feba67089058702ec9 |     
         arm |            qt5multimedia-5.9.6 | NOK | http://autobuild.buildroot.net/results/02cc1b1e760fec1254749ad735372d6f4eab0fce |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                busybox-1.30.1 | 26
      host-uboot-tools-2019.01 | 8 
                  ffmpeg-4.1.2 | 7 
           uboot-tools-2019.01 | 4 
          wpebackend-fdo-1.0.1 | 3 
             gst1-libav-1.14.4 | 2 
                host-go-1.12.1 | 2 
                   mimic-1.1.0 | 2 
                   netsurf-3.8 | 2 
                   dvblast-3.4 | 1 
                grantlee-5.1.0 | 1 
                      gzip-1.9 | 1 
                 haproxy-1.9.1 | 1 
                host-libsodium | 1 
                host-mtd-2.1.0 | 1 
                  libssh-0.8.7 | 1 
            mesa3d-demos-8.4.0 | 1 
         mono-gtksharp3-2.99.3 | 1 
                   netsnmp-5.8 | 1 
                       netsurf | 1 
omxplayer-2ee17b22a6149a043... | 1 
                    putty-0.71 | 1 
                qt5base-5.12.2 | 1 
              qt5enginio-1.6.3 | 1 
          qt5multimedia-5.12.2 | 1 
              webkitgtk-2.22.6 | 1 


Detail of failures
------------------

         sh4 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/0a3ff656f6dfad8d9dc7c496a84a1a0617ca920f |     
  aarch64_be |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/85ee3a4f3317513fa85411c8d1a3cdfac1236504 |     
     aarch64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/8933592372d3a06029ac1f5f10d13b405eb41575 |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/6b1b57abfdf0a13bb5bcf83b328439fabf356e4d |     
      x86_64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/cb593f9529d105ab7a8566fa52906cfbc818cda3 |     
    mips64el |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/fc3ac4c5b21ec66cc4ceaa5d63af588180f47ea4 |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/ecc64d77de3b13cafeec1e79a9f28c658a9f5ea8 |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/fdd9a2d35aa104dddc90f6d91f02b26aa088aeac |     
     aarch64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/14092774b3d9df544bcbf660b237b5372f3fa0d9 |     
         sh4 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/6481b76eaafa228653cf64c939f5d7c5377bd548 |     
        i586 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/c3949dbb0d78909a4d462b271f43c43863b8f6f2 |     
         arc |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/00545f4b032c1543364a6f002ff2df123043ddca |     
       nios2 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/a7b96617097fd5e8d397a15424367095063dd179 |     
         arc |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/d47a26c7c58514df7842826fad286f8b2a50e779 |     
        m68k |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/a6c656d3ef34b0d6011b81eb9e768a3b74082219 |     
     riscv64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/141ea8ae1b521dec91d4531ec318f25cdbbf1722 |     
       nios2 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/4d315e91f6ef70d69ea43a4168263188ca85c039 |     
         arc |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/1f9d149699c0580bac0da6ed3aff4a38872935fb |     
     powerpc |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/e5e666c78539bca396ad2b6a911ac4cd83829993 |     
      xtensa |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/21cf6b40f704c695b674d23c9f480f74af6cd9f3 |     
         sh4 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/165cf298603dff0f4531752197309430a2252ae9 |     
         arc |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/4a926eca2f27e5c865686dd315437cd1745f9f12 |     
        mips |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/908ca7cbe142638f17a35f6d9e7baf03c82268b3 |     
     powerpc |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/09648f73ec6a64aa0c573b2b0479fa1183acc7a4 |     
         arc |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/f0bbb72e4ea0c1e958f54778d5f276895ea81468 |     
     riscv32 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/df1487e9a9eca43454d9e81844fa76fe9f895220 |     
         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/77e2bf96d0cc75f0bd835d2a651da56836b3f1f8 |     
    mips64el |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/cf5589f05a4348be0ed4ddda3bc9bac72b444d3f |     
      mipsel |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/5c02aa4cd2c160849860ce33a1a56a29e3bf6d42 |     
    mips64el |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/beb70bd6c1dd9abf7bc1b53299ba0094a36f4179 |     
      mipsel |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/cbe1c52d7ad86282cbfd2df6cb6a12188e16660d |     
      mipsel |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/cc9df26b81ec78dbb5dc1e7968b696f0b7059c64 |     
    mips64el |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/2b2156873efd03f0fc039f653b9b305e362b0054 |     
      mipsel |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/4fb7c26df1d636d7eaf4c34db9a752ddf60da832 |     
         arm |                 grantlee-5.1.0 | NOK | http://autobuild.buildroot.net/results/f082ace15a1a07f0aacbedcea02b91194b9719d2 |     
 powerpc64le |              gst1-libav-1.14.4 | NOK | http://autobuild.buildroot.net/results/a1f22975d4a4a6cfc553a450da464a431702800f |     
     powerpc |              gst1-libav-1.14.4 | NOK | http://autobuild.buildroot.net/results/be2d161443c5ab24979e6b9389eb21a53d4b4066 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/0f18dbc1c1d3bcc4ac73c5ef2c8752e5efd091e6 | ORPH
microblazeel |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/64706f96db793777de9d3ec63b0a47d776cf33fd |     
    mips64el |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/b3cef4614532d05fac5a561b49510802e7a068cd |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/42286bd374963a889f8a69efb91a241804f5bcfd |     
   powerpc64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/69b1be9c514f34fc3250a6116f981ad4050fa3c4 |     
       nios2 |                 host-mtd-2.1.0 | NOK | http://autobuild.buildroot.net/results/c8993d792b9b7fc0c9539af87597674ec566a159 |     
      xtensa |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/6ab6f8ea587b68e7ce760d87ecb03aeb699e291f |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/13892a7555c768ce72475ff4cdeef6df9ea409a1 |     
     riscv32 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/d4f3da5c636b74d1ec2125ab4ae2f07ecedccd6a |     
         arc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/0c2b0fd80caad8a9de9273025f7ccaee29dae0e5 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/9bd368c78c1c29cb8a4aa9b269fdf442e9fe7774 |     
  aarch64_be |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/24fccb3170def882b1187d7fb45b89b192c8c7b9 |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/5cea704c5d5e62856c81d7452be1cc840a6cc8b7 |     
       nios2 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/2747f5c28705ca239913b66466994ef97682c1b2 |     
      xtensa |                   libssh-0.8.7 | NOK | http://autobuild.buildroot.net/results/5fde02d513240ecb98082d74bcd7cf733fd24fd7 |     
     aarch64 |             mesa3d-demos-8.4.0 | NOK | http://autobuild.buildroot.net/results/fef495c85067059e6ef99b0f848350f32091ef5b |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/f1d88c0b160641eb9de38a3c8952f9ec585059b2 |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/973e936d14c0a394cd9dcd2426394898db8d9e66 |     
      x86_64 |          mono-gtksharp3-2.99.3 | NOK | http://autobuild.buildroot.net/results/56e130b0a81be09d84ff95d977ec7af421ce0db9 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/bf8dfa63c9db9e746533b52cadec4751966688c1 | ORPH
        mips |                        netsurf | TIM | http://autobuild.buildroot.net/results/c5b856175a76647391d3edde1811e4fa6f7fafd8 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/3aee58ef5259b085be65cc8db637aecb1378eeeb |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/88578b93c6609b7c2df3e7f64aa6e8412a73077c |     
         arm | omxplayer-2ee17b22a6149a043... | NOK | http://autobuild.buildroot.net/results/e413c9b2ad7b97f0552f2477293ca5fe861df06c |     
microblazeel |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/a66d787d62030a2af69b9b8495394a2fa5be8bde |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/30b3dd874401ebee322807278dad791182d1e26b |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/7c3be98ce7677b7b834a1dcf6763224a4870b0e6 |     
    mips64el |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/00acbfc3cd1b6eb20d4f9ec9f31796514a980b15 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/202f635ffeb838d7ee616e38b3e60ffd5048e9c7 |     
     powerpc |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/d819f7d0c335280398d6b99a2dce44a23822f499 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/db3ebf8d58c1c99d96e3bbaa6ce7a80f50ab9a3d |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/2b58fceaf305d2176e609d308f58d631661d5ef7 |     
      x86_64 |               webkitgtk-2.22.6 | NOK | http://autobuild.buildroot.net/results/e4b435e05c49528544337006b09cdbfa44ff159f |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/63c1461e86baec0d767107ec0cf897e2ead2cf1e |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/b3814bbf3fd8d6896830ab05fd41da39c9aeb176 |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/7ad463eee8a4c2b78fb997156bef7954968ffb7e |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                    qemu-3.1.0 | 1 
              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

        mips |                     qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/54cf6468900b44699d60d3d713473c4e835acc7c |     
       nios2 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/6628c19ad21f73927ff553a450169effd76312ec |     


-- 
http://autobuild.buildroot.net
