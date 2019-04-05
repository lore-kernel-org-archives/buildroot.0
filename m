From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 05 Apr 2019 06:00:35 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-04
Message-ID: <20190405060040.852B587F9C@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-04
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  41 |   4 |   1 |  46 |
      master | 246 |  73 |   5 | 324 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  rygel-0.36.2 | 22
          host-libglib2-2.56.4 | 15
             dbus-python-1.2.8 | 7 
                host-go-1.12.1 | 7 
                  ffmpeg-4.1.3 | 4 
                   netsnmp-5.8 | 4 
               wireshark-2.6.7 | 3 
                   mimic-1.1.0 | 2 
                       netsurf | 2 
             openjdk-jdk-12+33 | 2 
           bayer2rgb-neon-v0.4 | 1 
                    bird-2.0.4 | 1 
                        glibmm | 1 
host-gcc-final-arc-2018.09-... | 1 
                host-libsodium | 1 
                       mongodb | 1 
                   netsurf-3.8 | 1 
                qt5base-5.12.2 | 1 
              qt5enginio-1.6.3 | 1 
      qt5webkit-examples-5.9.1 | 1 


Detail of failures
------------------

         arm |            bayer2rgb-neon-v0.4 | NOK | http://autobuild.buildroot.net/results/27b7944973fe2adc56ea9b8dd3da2212dd35032a |     
        m68k |                     bird-2.0.4 | NOK | http://autobuild.buildroot.net/results/d0fe86f01726812f7980b2cfeddcab988dd789fc |     
      x86_64 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/2fa28be17017a8601d6d71c91b0cdb4c94ee6ae5 | ORPH
        i586 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/692711ec34b112c9ac8e4ad603e16b566fe9fb7e | ORPH
         arm |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/1b9a2f2dc2d5627610c3a4dc0c15c7ff03b8c6c1 | ORPH
     aarch64 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/60c41df6302420fc8489a49896779e32349ac90a | ORPH
     aarch64 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/f5d20fae53624022b41571ea14af3a5aa49f3543 | ORPH
         arc |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/b63c85de3d11ed0c7a8698cf85f239692ad9d664 | ORPH
        i586 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/b33a731b220e0c9dffba332f81049cdf98fd5a78 | ORPH
    mips64el |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/fd350b7267f409b7bceef4df27459c87107a9e72 |     
      mipsel |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/34697f9c50b7b54622b895d56ba79f0e0ee115bf |     
    mips64el |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/27e3ebcd43bb75caf826512ad87a376f66b73cf3 |     
    mips64el |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/72791c3fbc073582041e97e510bb6c8733ec1b8d |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/ef8988bd6ec64f639a3ed2ce20210c7b53bfbd81 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/2bdfbc96b6b56c5d10a5ba821477a5af00084412 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/d5c4cd51c3c50bcf0c8892c18667ed944a2014c2 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/15a824db7fdf798ce8568e4d6d13e775fcac24d6 |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/98b9c7aaff2af4d19adfedac00b768d92530ce94 |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/2e9d2c54748ad71f2804fd9e370d47b0bbc9aff3 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/d058d900fde6073717360a23d8fe687e80754c53 |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/ce1be2bfef21704aa872cb805c5c9c53ded848b2 |     
    mips64el |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/db56d597667ff5c46184c25729f931f089990202 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1de11c1429a11bb1ad65545b9915194c379770bc |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/781e4754046df4889096928080c1efcf0cea6ea0 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2f453b0124737aedea78429b22ac372e5b2bcf1f |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d7f65bbc4e4746b542bb01c9a388385362203d82 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b5ca1b63f04e614acc663973a6d2a4cebef37a62 |     
   powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/52daaa94d20d04204e5bcf05374fc12653a13bfb |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d2775b83eff2551792c66e582ac07023c9c0ff18 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1b17aa38fc9994948dfa5ba54ed932af35d04f3e |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7aeb03a0e62c5fd21f428159681d39d7233c9e1e |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1e285d8840464b0486680ffe052fc763bf841de9 |     
     riscv64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/68af91e0592c1f8749bc8b553bed6e59fb09eac6 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/63a26fd44a08d5e72c2b723a9088d214534b3950 |     
        or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8e461dcd2fffbeb804b11fab68fd6abff938e073 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/da560b0751dbccad2af92bac01fc45fabb160892 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/03c53260d53e524b072a07d5d727cc0176aae999 |     
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/b9c42ae4ce100665c04cd585edf3c565977816b3 |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/8840d4058008ac730baa8d6d794abb3335a30ba9 |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/2e702928e5671458d2166e0125d4d9344e2b3b55 |     
     aarch64 |                        mongodb | TIM | http://autobuild.buildroot.net/results/2e5cacae90bec187c323a10f807d9b6dfa2b7d05 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/66606554ff1f97ffa5de8c2203a3c94c8c5162eb | ORPH
microblazeel |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/5aaa6a16583ba5275845445f4ea64a00bd55bd56 | ORPH
         arc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/2ac94ccc8531a4b0d5e965d6fcd93902b019455f | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/16331b001b2af5f209f88b581283cd583c630238 | ORPH
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/9b5651605188e9baa1441f2155c2b04c1dd0bf4c |     
   powerpc64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/63f0443dc75a7700e3ad99a97c3ab60f32d0c1cf |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/24851e60e42f879dc1e7ef461b68c28d828e715f |     
      x86_64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/845fe32967c9879b6c1adbf0630f358be215e174 |     
      mipsel |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/751341042be3492353d5d0f69a9845dc19c437b4 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/0c4c030eb315afbb66c1a4602901893f1b2ce5b1 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/f15bb26bfedaca35f06f85dbc7745d33785f49b5 |     
     aarch64 |       qt5webkit-examples-5.9.1 | NOK | http://autobuild.buildroot.net/results/1f144257a4a3b85021d24d8554c7393f1d444e63 |     
       sparc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/59212e2925ff0f413eb2571068585a040ac4559d |     
       sparc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/1b0211ed16a0bacd6626e2e2f67e32b30525c37f |     
       sparc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/910e8e2e74dde3b40bbe39bf64c6a1e7150127da |     
    mips64el |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/b8ece247c4ca7a06d6933343418929836c3ba8d9 |     
     aarch64 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/4ade73a53bfc2ba7edd453cf6b622754beeb3e94 |     
        mips |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/f359e45232d4e57520849ca689e3ebbfae823baa |     
        i686 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/da06be49dd9d5e72f2ac59f2035786b22a4621b1 |     
     riscv32 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/283a08475194dbb5c8a861d3b5b1f6e1e6af21bf |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/66a2919d2ee59536932e11862e0ffe429fa8bddd |     
       nios2 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/fcb6e777121dda54c9c74d7e730c8ee31dea49ff |     
      mipsel |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/3388a7e5a972c81de5b207558427a0241151d3fb |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/56e9f272bd7ab705c137f2409fae11922d07fdb1 |     
 powerpc64le |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/ee8cb8ec0850730fc97ad9c359d5462a2bcbfce0 |     
 powerpc64le |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/a804d665af11cfd512d46fadeaacbbc694b838a3 |     
       sparc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/a8c391b0a87448e69631230c7f35de50da149a17 |     
microblazeel |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/12ffed7bbd407f89995dc88c4611147804005597 |     
microblazeel |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/e01729fe44d6dfc939fc3917ac3e1963d4999f02 |     
     aarch64 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/41b7fc7a8e31678c6392483c1931a2b7b01e5835 |     
     powerpc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/a87206ee1c1febf29bc77e6785c40ac130a069ac |     
      xtensa |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/b7615ed06cf8975a4d3f1c336be2c07328b47e55 |     
      x86_64 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/d77a1b6252c783e6fe249fc937d0742fbca60cdb |     
       nios2 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/e4a9f55c406ca347629e2aecaef7fef9dad43d52 |     
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/d54be740b4a8e1ee117e03e92f73ecd7d5d6664f | ORPH
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/abf4ea14d461cecf0bd0326bda75caa85507f5a4 | ORPH
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/aeb6fb5350c1fef72560e9bcd481e2f28e6f4017 | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   netsnmp-5.8 | 3 
                        glibmm | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/0aa93fbba7080d2e003227203b8ce24d9c3a6056 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/df75a89bd566b6290c1d1563273a4b1e760b3380 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/7600bc99de3b7ff81436ffb385cc83c66faa3452 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/69aaf9313e69060d86f9b459442232cb4cc67cd5 | ORPH
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/0d897c1a3c71057501d7c18f3d8226d6e23b9a1b |     


-- 
http://autobuild.buildroot.net
