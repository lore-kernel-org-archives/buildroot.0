From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-24
Message-ID: <20160225073019.0D337102BFE@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-24
===============================

        success : 174
       failures : 60 
       timeouts : 5  
          TOTAL : 239

Classification of failures by reason
====================================

                 mesa3d-11.1.1 | 3 
                    ruby-2.3.0 | 3 
               libcap-ng-0.7.4 | 3 
                      qt-4.8.7 | 3 
                  boost-1.60.0 | 3 
                   qhull-7.2.0 | 2 
     openvmtools-stable-9.10.2 | 2 
       host-erlang-rebar-2.5.1 | 2 
                   erlang-17.5 | 2 
                   fio-fio-2.6 | 2 
                 libdrm-2.4.66 | 2 
               valgrind-3.11.0 | 2 
                  stunnel-5.29 | 2 
               pax-utils-1.1.4 | 2 
                  trinity-v1.6 | 1 
                       zsh-5.2 | 1 
net-tools-3f170bff115303e92... | 1 
make[2]: *** [code/CMakeFil... | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                moarvm-2016.01 | 1 
                   mraa-v0.9.1 | 1 
                pinentry-0.9.4 | 1 
                   tor-0.2.7.6 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
canfestival-7740ac6fdedc23e... | 1 
        ltp-testsuite-20150903 | 1 
                  cairo-1.14.4 | 1 
                       unknown | 1 
               trousers-0.3.13 | 1 
 toolchain-external-legal-info | 1 
sconeserver-c4b8e14f6e9e06c... | 1 
                 igmpproxy-0.1 | 1 
       openpgm-release-5-2-122 | 1 
                   slang-2.3.0 | 1 
                 opencv3-3.0.0 | 1 
                 setools-3.3.8 | 1 
               nfs-utils-1.3.3 | 1 
                   geoip-1.6.9 | 1 
                libgpgme-1.5.5 | 1 
                  prboom-2.5.0 | 1 
                  ffmpeg-2.8.6 | 1 
               qt5webkit-5.5.1 | 1 
                     rpm-5.2.0 | 1 
                oprofile-1.1.0 | 1 
               iptraf-ng-1.1.4 | 1 
                 libraw-0.17.1 | 1 

Detail of failures
===================

microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/eb9b8ba31192a56e6cf21a9e3781c80c7ff85636/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e6f8e229ad913ace36f549760e0c0d1b2014e62a/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0eabe1993ec6a3253e82b7a45e024b432ca6e370/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/4639eb9cb0b348dc280c075bca12c3cbe3e4824a/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/58199967c8e3427cf6760af1a7588ab568f0dcfc/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/32b73daf24c30e937793b55d31341d77a072dc6d/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/2aaba850006443984a270c8573687f414b837c11/
       sparc |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/dc70f79b7891ea70262c41164b9234a5b59e2ba3/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/8aed221256b0d9ac36458f4e7111cbc187955d54/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/657878fd7d969659af931280536b7780f78d53b1/
        bfin |                    geoip-1.6.9 | TIM | http://autobuild.buildroot.net/results/72675452025e29ff251377eb45bf7fca79383b07/
      x86_64 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/97df441ac0d478627c528c2f1927c2cf0151368b/
     powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/0bfbaee25bb762c59f4234413bfe553ae40ce7c4/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/434098b8d4619832bfb334dc7c34e443a83b68e0/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/ab627c18ea8ac5a60342a3773915296b94719823/
      x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/3c2b4ae4c40c6aa2499240593897ece3b4101ab2/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/22a0cd56f63c808a6a184b21645f03c016954b42/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/355b2e2cc331bb4a012a47c876a00e3dd74d146a/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/f91c1b79cf9b65b24172944fbc514d4eb400a291/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/82abb4afc33e92306b38eb8842a1ffa346ee84ea/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/c7d9fd6d0c9b238555c0f5d062bcb0f0ad298258/
      x86_64 |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/49a4f2fd002844e8288bf2a5e5ce70914e9fd8a0/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/e9b3860acefae075a12e9ea761f307ff99179084/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/9d89bac218503a0f1384f3787dc0083738027f4e/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/623ddc3133b8c0d504e293bcf3c69529e2535ba4/
        mips |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/e8631d0cdee75ea6341418fd3e1d75fbe37a3ed0/
        mips |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/c1b5e426418721249f27009bc1f20e7c41de87d4/
        mips |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/adfe61a8d36662b2cf312f31c15d11f92e80c0f1/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/f3d65afc36bd8eda7ffc6032a480b963fcb5f350/
         arm |                    mraa-v0.9.1 | NOK | http://autobuild.buildroot.net/results/bb54aa56ea9c4ac9dfa30ad1b0fba97fff8fe75f/
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/0737245b6d9d00770eba75f1cdb74f682ade0702/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/eceea3b559649bc991f84cb53095370a0007777c/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/6592f83ed01a4655672739559c7646888d680918/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/e144bf54a01d5e7b175fe312875aabff31648e3c/
        i686 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/2e36e46a8f735585bd204b71e8d4aa01c8d20566/
      x86_64 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/46f7d064b1deab354fd19df9a5f242a53a9ad99c/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/871284086807bcac8a5facfbc664aaa0a5a7ec8e/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/c54c80c6102d32b2f6e543685b9bcfa522ea0785/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/6d745e96df264dde9414f630b02e44ef7ffc0eec/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/b0cf84aa830c67b86e61066213763f0834b98e51/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/75badd6e344c68a407d6737e0d66c79be0d691c8/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/6617ca811e98cbdd4c95ff52e7bd70b7040345d5/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/5f8e30d19f8a501b1df531b52c7811194d11bbda/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/9513564419eedb7b5a80e1c3e0209ab3898b1fc4/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/596b635e5bdae3f33b87bc6271e7fc61e8dab6c2/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/61df0d98fd15d304e7fe77064192f4de3dec86b1/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1f46e8bedb5c8cb99f010741c9667e0d36e9ad4e/
      mipsel |                qt5webkit-5.5.1 | NOK | http://autobuild.buildroot.net/results/339e7c2b313993fe1f4488c396869a389dce6f3a/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/5585ee2a45f2ed3e3941ced463571b2c4df9d217/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/e4649fcfb47f0d192d9cd2d39a0cb0b82ea81c3f/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/49dc1c2e18a3c442bb957eaee97cd0cddaf1e1d2/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/2ca57b9915491ae2468a7c8011d9a2106cab5aca/
         arc | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/f9b71eaf7a7d1fcb12305e2e447500ab193d4aaa/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/c7ce2f061b29026b351f2e1a5c0bf3624305231b/
         arc |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/1647cd9623d054fe456c7f34d50cf200d9f1353f/
    mips64el |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/d74645e6a02247a51024fc0bd4e0fa800848dbe7/
    mips64el |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/51da744f66843e0835d26dd15a460cc9e02cdd8f/
        mips |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/b8872c0057007438eb9ada87486e1f27392464db/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/11f225b03ec85ff9f0af77b4853dbf3f48150574/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/6601a21c5660a4745955987c51f42ab547445fcf/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/3ed5f985549b51f194ea96a2d7b66575c0937865/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/6857447328b9ce32d90cd29d0e7e31aea6ca461c/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/fb44d5728c3bd7300a593547d127a8590525b68c/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/88c23492aa8f215f0024795bea2a046a6b9570d5/
         arm |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/c0eba21079a1f31a0cfaf8ae8303aa6b6381a171/


-- 
http://autobuild.buildroot.net
