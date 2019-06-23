From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 06:00:54 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-22
Message-ID: <20190623060101.8ECF285CB8@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-22
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  18 |   3 |   0 |  21 |
   2019.05.x |  22 |   1 |   0 |  23 |
      master | 199 |  54 |   1 | 254 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                gerbera-v1.3.1 | 1 


Detail of failures
------------------

         arm |                 gerbera-v1.3.1 | NOK | http://autobuild.buildroot.net/results/f0ef1c651d0099c245ba6f29b48ff1d7619e55ac |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.3 | 16
               libcap-ng-0.7.9 | 7 
              libsodium-1.0.17 | 4 
                       unknown | 4 
               host-efl-1.22.2 | 3 
                harfbuzz-2.5.2 | 2 
              iputils-20190515 | 2 
                qt5base-5.12.2 | 2 
              qt5enginio-1.6.3 | 2 
               wireshark-3.0.2 | 2 
/home/test/autobuild/run/in... | 1 
                    efl-1.22.2 | 1 
                           git | 1 
            host-mfgtools-0.02 | 1 
           host-nodejs-10.15.3 | 1 
           libvncserver-0.9.11 | 1 
                 openjdk-12+33 | 1 
                 python3-3.7.3 | 1 
                 qt5base-5.6.3 | 1 
                    ruby-2.4.6 | 1 
               util-linux-2.34 | 1 


Detail of failures
------------------

        i586 | /home/test/autobuild/run/in... | NOK | http://autobuild.buildroot.net/results/6b9d97e5bac0e1072012feabceb5ac857b1fcab4 |     
         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/7eae29e9839ea263d483fd55320237a854a446b5 |     
microblazeel |                            git | TIM | http://autobuild.buildroot.net/results/7adff001631053ae5a3cb3e176d321f6a2d3cceb |     
      mipsel |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/f6c0b85fa476e0f52cc06f0133d2e4f9920f7556 | ORPH
     aarch64 |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/c3f5d1ade3f3ffe89b232d187db920f661dad2ba | ORPH
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/8182554a9b41ddacae8af56d6fb8936a4a3e96de |     
         arm |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/a5174aa59e041d7a5360c3c417e47f0ccb60d1b4 |     
         arm |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/6a56cc6c649c9268b57fac2681622470750ba2af |     
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/779a98179496326d485a956ca74342d4792ecfdf |     
         arm |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/23ffb2378ee1f23c839ea5c9f6311d24dc8f2c35 |     
      xtensa |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/8dad9aa56bd6b0c6e12aba0d6396f1c734ea6af5 |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/1fe16686bfad158a114d8e4eb0b527e861218d3e |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/24bf90afea8cf0257f6da9d3be0827ce1234ee65 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/4b688cecce61ef885ea1f3f72ac50d8bfb2364b6 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/b338bdfddc5706ad0211b76bb28775820864917d |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/e3762362d60d31f63d9b6b6a460e8d2e2c8d066b |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/b050ca12ebdec10aa2821db3fbdce0055fc62f29 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/13ab44e3456e72fdce8f7109bc251135e30202e2 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/afad2fa02116be732f3665de3bd61038c0727753 |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/4266e8db9d9ae8dd98424504cda2b62e078440d7 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/e7b22e5b1364745ccd677f51d5d565f80af5227b |     
      mipsel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/207ebd2dc1639204878a12ffbc5f918236a06ad4 |     
        m68k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/875117b6bcade5af526525cb2944b61a337ec429 |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/b040e25d812e518402333d5a3d1528fcb4ab50ea |     
        or1k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/483162a833a5db0ff1f402e1c31c09f2ee618526 |     
      mipsel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/a747f3a90eee2ae77917cdd5b12f63f470ff018c |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/ed8be3cead7c4d2f0c987f996268c55ba2eff6a9 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/fec11fa1650a6743cbcfba9a44c1196b8ca6c81b |     
      mipsel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/d4f0065bc1d149a95d7a1a592e45fad3a165c2c5 |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/9b9e708a74a3800089d4d1385d6182761cd90d92 |     
        i686 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/1612f356c6bf438fbd36e947dd7af34c24f2b0c3 |     
    mips64el |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/2acb9f4090e35b8f542a7d7316c83183a481afe0 |     
      mipsel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/f18361141aec9b527c6a616681dc9bfc97a14f18 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/777bbdc05a0ac3582a97d9f5a924cb33061375b0 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/59b467654863ce8db88139a82c1f7236f488dba2 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/e2ecc1e6073062281fd49aceb9a8e59fd73f738e |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/17ce523d464a328beb77861bb7606b9291a59d72 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/28860e57593db31438d8516c0d3c6c3d6403c07e |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/96867f5c92bcc47685fdf8eae3ea47361cf079da |     
         arc |            libvncserver-0.9.11 | NOK | http://autobuild.buildroot.net/results/bd6bddbc20c98e9c903e1c9defebc2f5ddef7abc | ORPH
     sparc64 |                  openjdk-12+33 | NOK | http://autobuild.buildroot.net/results/b59ce312b590c336560a19ff648ed4842877709f |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/cb5e31f13ed075ade51c043e309c16cdc13c5a4c |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/0be04b40ba65a524902bd338997b5458c65765fd |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/64e6732ea8c21f552d49dd9bd1ff6b347693dce9 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/d3fa51ebf42017a0ad9c9a887b8ddb31d310953d |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/4aec974468971a5af6b1ccd9614349d9adef526a |     
       nios2 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/42112e56e4045eefcc5f4dc70019048f6cb09036 |     
        mips |                     ruby-2.4.6 | NOK | http://autobuild.buildroot.net/results/091b2b94dabd01e679c6da12e81466f5e5c30dc5 | ORPH
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/db3589196f5d29fb2d0cc0c3afe31f1e0e42e496 |     
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/816d568d0421cbfdfe5cba5ab87992bfda033b8a |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/38839dfed569238832660849af6b9bc5a2c3309e |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/eb2dd08ce550bfb0903e2eab7325e483a92da8cf |     
         arm |                util-linux-2.34 | NOK | http://autobuild.buildroot.net/results/3790837c542e169706e07a57e0699bb58308a81e |     
         arm |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/31e778ace5866b613597117ec2278b5dd57bd1b2 | ORPH
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/6e8028b54a4a341e1bd529e7b644ee393bc63289 | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

               openldap-2.4.46 | 1 
                qt5base-5.11.3 | 1 
              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

         arc |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/8a3ec74098e4f908635de2fdc4a8ce1bae46eb2b |     
         arm |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/1a74851875867d42a1a4d211f2d6531b91d5051a |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/39b2b1d578a8c122944887dd546920d459cccaae |     


-- 
http://autobuild.buildroot.net
