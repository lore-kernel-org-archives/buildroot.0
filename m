From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 07 Apr 2021 05:12:22 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-04-06
Message-ID: <20210407051227.50C2660658@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-04-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 33  |  8  |  0  | 41  |
    master   | 121 | 40  |  0  | 161 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 7 
                      iwd-1.12 | 5 
                  zeromq-4.3.4 | 3 
  gobject-introspection-1.64.1 | 2 
          python-hiredis-2.0.0 | 2 
                rocksdb-6.13.3 | 2 
          sane-backends-1.0.32 | 2 
canfestival-7740ac6fdedc23e... | 1 
               capnproto-0.8.0 | 1 
         coremark-pro-1.1.2743 | 1 
                 dc3dd-7.2.641 | 1 
                directfb-1.7.7 | 1 
       docker-containerd-1.4.4 | 1 
               luasyslog-2.2.0 | 1 
                    mpd-0.22.3 | 1 
                  ndisc6-1.0.4 | 1 
                 pixman-0.40.0 | 1 
                 rt-tests-1.10 | 1 
                    ruby-3.0.0 | 1 
                      tio-1.32 | 1 
                   tor-0.4.5.7 | 1 
                       unknown | 1 
                    xen-4.14.1 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/3fd118fb87299099e47026161c1d8c948eb9a5c1 |     
  riscv32    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/648c05f0195368357339393a2edc38951b45abff |     
    arc      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/32b51bb9eda7899b6cc331f10a860644bd6004fa |     
  riscv32    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4e401f1cf9250c61a53d5ab14c139f3fb82e707a | ORPH
  riscv32    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.net/results/bda6e23b8aeac44eac938668d1435e5654894142 | ORPH
    i586     |    docker-containerd-1.4.4     | NOK | http://autobuild.buildroot.net/results/8bd66491be1d492c362e9889fd86d5e6514cac0a |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/aa3a0f4cdcc91f52384e5c4c9eec15203ebd6d42 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/54be2524c785775a7e404622092425b73745ce9d | ORPH
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7eccd8d56b240491cdc68895dd35358a3dbfdd2f |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d8fa8fe230a5201526694bc57a6b8aad925d76f7 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/081b2fef6b18e67b5ac41dfa6f90668cacd5357f |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bc9c4530070127b37b6745356c3f07b503b2486e |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3e2b19354ef222cb39051ea8c551a0e8d2577ab1 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d1123dc7e2440581cd00eca5e4d9124223fa4b02 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0da64476ffc611476747dd507c3e7b93efd1389b |     
   s390x     |            iwd-1.12            | NOK | http://autobuild.buildroot.net/results/becdd2135b6bd9f4037e033f310b871cc457d42b |     
    arm      |            iwd-1.12            | NOK | http://autobuild.buildroot.net/results/573487379d97639f8c9cd24e1ab447efcdf8fb17 |     
  aarch64    |            iwd-1.12            | NOK | http://autobuild.buildroot.net/results/875a38b37543f90b67d5f14fc5c66778b53d30c2 |     
 powerpc64   |            iwd-1.12            | NOK | http://autobuild.buildroot.net/results/de1e5cfc799caeb6da741e8a1298b2f92e5cc96b |     
    arc      |            iwd-1.12            | NOK | http://autobuild.buildroot.net/results/66f652cd7459ae0df20c88323226cb45c19f64a0 |     
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/d9db468fe9106f622a1e0c15c7cbe8f66f8e8311 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/6e03eec09789860e447cdca281bc79f6ba498c2c |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/2c5312f1017d4c0ba3f8434b324e042ca3884c33 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/37825041e3c3ef53476c53b9406ea0590013687b |     
    arm      |      python-hiredis-2.0.0      | NOK | http://autobuild.buildroot.net/results/884a40f6717b0d3c19b224aa007965a0150a0ee0 |     
    arm      |      python-hiredis-2.0.0      | NOK | http://autobuild.buildroot.net/results/04cbcddf6d83ebad8c98400754f9445375e9e489 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/90051a8e51be7c8dcebe7add7a9efb6b194062c9 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/83a4b7d7cdb6d836bc64feaf25c36b1666aefa5a |     
   x86_64    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/e32a42853fce8d9fe65d176e0c30c50477a5b939 |     
   sparc     |           ruby-3.0.0           | NOK | http://autobuild.buildroot.net/results/35304cbdf1e1b98593702f9d66166bfcd7f8a841 |     
    mips     |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/9a345f82c7a010f6b2a3361f25b14caefa9dcbef |     
   mipsel    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/5a96c8e33e817c305f7f01733a0e2f909019c8d4 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/a20a153c386bbbc00d789ed11ea634079510a91a |     
  mips64el   |          tor-0.4.5.7           | NOK | http://autobuild.buildroot.net/results/b807f19283528b9f0d0c46250b660ea84695679c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/78214ec2a16df840433bd8bc05f3e4dbabcfc807 |     
    arm      |           xen-4.14.1           | NOK | http://autobuild.buildroot.net/results/e0e0cd58c0404b271e0f72c2723ca2c5b7b7ad6a |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/70fc4e0465b46380dc1e0578fdfcc931fa984ebb |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c1b79f17b098c408229ca4521679fe12ba6f0eea |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/61e8a1f037c98b3e09e3cbbf87a16bf5455c7e9b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a2894b4ecab8bfc66198967959f4190bda261387 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  mender-2.3.0 | 2 
                  boost-1.75.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                 mesa3d-20.3.4 | 1 
                 pixman-0.40.0 | 1 
sox-7524160b29a476f7e87bc14... | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/c6d8d63250d81c93e5c955d359fb5ad27658bbbd |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d6f807dd2601084b4b311856a35b13d63017d8ef |     
  aarch64    |          mender-2.3.0          | NOK | http://autobuild.buildroot.net/results/d6aecd1d23cbb1198771d0734eb644278fbaa5dc |     
    arm      |          mender-2.3.0          | NOK | http://autobuild.buildroot.net/results/841d49ffa0ce275fde088b46845d7c74bd30b82a |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/a30a43097f9fe2b10efae7975a69e43610ec0e82 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c4e9af64df79871f6dc7b96f437f481090438cc7 |     
    arm      | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/664e65b6fb0e609d00ab2ba702ce7159ec69b5f4 | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3517dda4fb61932fdc5f9440b527a52e135f8583 |     


Gitlab CI results for 2021-04-06
================================

Detail of defconfig failures for 2020.11.4
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1153386614  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1153386616  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1153386618  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1153386620  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1153386621  |      
                 arm_foundationv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1153386622  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1153386623  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1153386624  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1153386683  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1153386688  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/1153386790  |      


Detail of runtime-test failures for 2020.11.4
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1153387265  | ORPH 



-- 
http://autobuild.buildroot.net
