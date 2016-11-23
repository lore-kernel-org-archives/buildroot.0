From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 08:30:05 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-22
Message-ID: <20161123073005.E5DA720C76@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-22
================================

      successes : 170
       failures : 30 
       timeouts : 3  
          TOTAL : 203

Classification of failures by reason
====================================

qextserialport-ada321a9ee46... | 6 
                bind-9.11.0-P1 | 2 
         docker-engine-v1.12.2 | 2 
make[1]: *** Waiting for un... | 2 
                 mplayer-1.3.0 | 2 
                    cups-2.1.4 | 1 
kvmtool-bed2bd9e1fbef581909... | 1 
              libarchive-3.2.1 | 1 
libasplib-f7219142e790a329b... | 1 
                libcurl-7.51.0 | 1 
make[4]: *** wait: No child... | 1 
                     nut-2.7.2 | 1 
                 opencv-2.4.13 | 1 
               openldap-2.4.44 | 1 
                 openssh-7.3p1 | 1 
                oprofile-1.1.0 | 1 
                 orbit-2.2.3-1 | 1 
python-libconfig-b271c3d9da... | 1 
                  stunnel-5.36 | 1 
                   taskd-1.1.0 | 1 
               tcpreplay-4.1.1 | 1 
               trousers-0.3.13 | 1 
                     vlc-2.2.4 | 1 
                  xl2tp-v1.3.6 | 1 


Detail of failures
===================

 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/cd9deaf4e0ad886c72f9e86a90587d62af17694a
 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/c28270b716b5f11012d1ade95772fdb3e2052bee
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/4067937801fa9a1dcefe64b33e85a11a43925f17
         arm |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/2e8828cfd0fbeb389d66b412356f221fc3130f90
        i686 |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/ed3f77b250b49d4cc83f50667bd25c15793ea319
         arm | kvmtool-bed2bd9e1fbef581909... | NOK | http://autobuild.buildroot.net/results/b8d9afe22cd0d3ec5d940727d9d86f984c7780aa
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/aa5f3ab4aef9f8982cf91ab9a30a96721eed960c
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/cbd62567bd4fba15fd05a54da5869f9bc57b16c2
 powerpc64le |                 libcurl-7.51.0 | NOK | http://autobuild.buildroot.net/results/9302ad0a9bd820ba1e324ef0a4ef0f627d606ed6
      mipsel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/993af4bb6bcead4fa6cc44c4d8474d3f535f4ec0
         arm | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/d6a942272ef6c63447c5db229ef270435cc1d6a9
microblazeel | make[4]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/eb82a482b88fa89b7372a2fdd966e62d697b2e27
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/f588134930f99645f98c23286b39911bcdb30c83
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/35fd5b9947bfa034c91aa2632c8918ac64c348a9
 powerpc64le |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/fe50510d86872e7f7f67af5722b46c2003fdea36
        i686 |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/a5d01d22f9a830a14a1f4595e2aada0af084339d
 powerpc64le |                openldap-2.4.44 | NOK | http://autobuild.buildroot.net/results/751fe7e6fd3bc95c2f80a269a5f42d8042675891
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/d61ec66d7e8ac38f9c7b7ee1833b1f818c465f6f
   powerpc64 |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/c808ee1b1fe74b7e7527bc94b58fb16669a5a1b5
      x86_64 |                  orbit-2.2.3-1 | NOK | http://autobuild.buildroot.net/results/81a2be6a99d9a7e9047c557b6c969e9607c95ff3
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/1f6d8066709ff10a7b73bdce5baecf9e3411be4c
         arm | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/70a246fc4b9f4e7b23b5a619aba3547b1de5ffb6
    mips64el | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/2bfaef3c0a6f53bf4f7ce9233fa0c2f544b6ecac
      x86_64 | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/18140b5aa5d0a0d5b45ba81bf2f0b0d5d3623c01
         sh4 | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/e4138c271f6779a50063c577b4b7dd4154b7df37
         arm | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/329e156f071294511f608ecd1ba3f09a14d53492
         sh4 | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/31b554aded42eb91413d9d9f74b8697728ad009b
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/db352a7791a07ef69713f32799ecd53d149f95e9
      mipsel |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/bd6a412ecaa51611496497bb32dcc4c82caa6e80
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/6aafc0768812a3d8556fd562ab60e84cff47013c
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/d2c16d8ba022b070c4dbeba5e7ea41f14d706691
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/17252ed31ec12d72c9cdf7e2121e594ab5293283
      x86_64 |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/371f229843c9686034644d9d749f5173dfd1e157

-- 
http://autobuild.buildroot.net
