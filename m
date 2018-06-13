From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Jun 2018 08:00:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-12
Message-ID: <20180613060015.2A0B52072B@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-12
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  28 |   1 |   1 |  30 |
   2018.05.x |  37 |   2 |   1 |  40 |
      master | 183 | 102 |   1 | 286 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 1 
                       unknown | 1 


Detail of failures
------------------

     sparc64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/be796eb367c82da4bbb78758e1c551835312df0a |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/14fe41016f411d505fe1fa1fb9d119e41e89540a |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                    efl-1.20.7 | 1 
           python-numpy-1.13.3 | 1 
                       unknown | 1 


Detail of failures
------------------

      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/2cf5a769e628576e859c7a44a9e3412669ecf842 |     
         arm |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/83bd8221b49cd94596abb560aa29079b05de5b40 |     
       nios2 |                        unknown | TIM | http://autobuild.buildroot.net/results/9cb49510fdd71f856cf08e78121801ea268a39c5 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             freeswitch-1.6.20 | 39
                linphone-3.6.1 | 18
                libtirpc-1.0.3 | 13
          mediastreamer-2.14.0 | 12
                    host-rustc | 3 
                 opencv3-3.3.0 | 3 
               asterisk-14.7.6 | 2 
                  samba4-4.8.2 | 2 
              wireshark-2.2.15 | 2 
                        expect | 1 
            host-flatcc-v0.5.1 | 1 
                libmpeg2-0.5.1 | 1 
                 libnss-3.37.3 | 1 
               mono-5.12.0.226 | 1 
                     php-7.2.5 | 1 
                protobuf-3.5.1 | 1 
           uboot-tools-2018.05 | 1 
                      x265-2.8 | 1 


Detail of failures
------------------

         arm |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/e98f4077c2cb7cf96a03e2bdebbc0532480ca7bd |     
     sparc64 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/cf8f9a9534c18cacf328d0849912a441c18d54bf |     
      mipsel |                         expect | TIM | http://autobuild.buildroot.net/results/7084c55915cb6ae0b66dcf260703e09bfe286d60 |     
      xtensa |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/15bea79949572e6b784f3c01925e9024ff8df4ee |     
      xtensa |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/989cefc2abb51f5815b84841378053de5614ca46 |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/535c549f16f7393a9b16932100bd9e9a11bf9634 |     
      mipsel |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/b24c677b9727a68fd38861e94f40d0de639ebd98 |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/6f2710113156b12b138ff88fa522d410a18a0646 |     
microblazeel |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/da20cf8cd30b521270a02202c760954e46bda7ee |     
        or1k |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/58818660a2922e851a8a91dc8055f95e2164be74 |     
      x86_64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/3e51f758e16441fc95e812d5f11aa66623d1dd43 |     
        i686 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/343bb277ed5529f94f607dd93ce46895d8cbddd8 |     
     powerpc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/151f053dec7181a8d91279e16479a4b5523f30ec |     
      xtensa |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/e5d796d69b8475c18f795eca0b91662e232a93ee |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/b60c9226a530ec55303ef974a6a4d040a55dbe2f |     
      x86_64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/ba942d762f18b532ed311c0a2ed2c6766b846226 |     
       nios2 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/d101b1daa1a9ce2df85270a3b3f64cca8aa6d73c |     
     powerpc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/63a11e256ce08f121f1ee3259eba98f6dc613ae0 |     
       sparc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/1c1c5adec11fb6b736568d15b94ec576b448b590 |     
         arc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/bc8087f986dda38e433b7612529ebbfd54ada592 |     
      mipsel |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/5cd77d54cdd78e0858faf4c57b3aa890a40178fe |     
      xtensa |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/6fe608087f40c27cfc81059303a83aad120402b9 |     
        m68k |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/927b5af7ff8ee883b39c37c8f6d731d61714449d |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/8fdaf44407d7a184e46f3484a04cc5ceb267c849 |     
         arc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/8cfea19b4a5b57929f1dd872068f7a089931e330 |     
       sparc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/07ca40cb8b06398f8f3bb5e738d77e3c75ab9c7b |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/ff2e4c2014809c357485a0dd0a9f9e252f4194ae |     
        i686 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/9be51a9f9f446b9d49d2335b681b4b0bdd4ea4a8 |     
      x86_64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/64178617de42580ba5bf6742c6129cae33700c29 |     
      x86_64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/b24f9c9ac1ce92d0087b65d024444e0e82ec1061 |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/aa3c4c8a82f15e467a58f135cd1a3a01dd8c042a |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/5678a159574f0129714e138ece8eb2a0f8da507b |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/290d724a4aff1deb6a90db73f647e7f8a0420869 |     
   powerpc64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/1b8604f7f2e868a7e6844b3e9fc52e37e2873f7f |     
         sh4 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/29abb0ca2010f08a711dbd2eb83a7c1e5155e060 |     
         arc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/c26796f7e7ed75c76c6b34dfa4aaefaa24a87436 |     
     powerpc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/f11212f859acc2ae164d8a6f916603df9cee3ec0 |     
       nios2 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/12804726e146ac553d8c0284592aaeec7ae910a8 |     
        m68k |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/07a8ec7b890bd67d3678ea5fbb00d10490f7064a |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/19aa51b60b8fc9caeecf1b95834054a7932e6c42 |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/5c48c8d28c73d3eaac7d391591b707b960aac49f |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/2dcca987dddcea2b263c16a958d6f9ff488cdd99 |     
      mipsel |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/24d74ac98006970a9924dc52339368904c01fedf |     
      xtensa |                     host-rustc | NOK | http://autobuild.buildroot.net/results/8bf82f6263477a5f7ae8c64bfcdc40366e9bba0e |     
         arc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/d1ba6da1c4303ab9b60497fdb2a756c7709372c6 |     
    mips64el |                     host-rustc | NOK | http://autobuild.buildroot.net/results/f335ed517b402c094ed3b10a3da4cdc23620dbd6 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/52de702ec2233bcadc53063abed8a330f476bb79 | ORPH
         arm |                  libnss-3.37.3 | NOK | http://autobuild.buildroot.net/results/d1ccdcd1534002d99802f0123ece5c782de9732d |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/893a7a48d26305b7a008820ad9344797ec86bbb4 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/005b29a998165248d02b9d223f4a9e96b6fd59d8 |     
      x86_64 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/7377fa9d63e60772170d213a53d5e4b69ed80e0a |     
      x86_64 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/d08b8fdb5bb44db76a22fe3f48482974c4a32817 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/07a9b0b337bb18c84f1fa75db25ad20b1bd1f77d |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/582fd097b1b6abc5435aafa690a6e14ce78128f4 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/feb77f4c903ce7368c7c7bc41fa8febbcd83f8e9 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/3c1b25173214e7ec2a8ea149f7960fa8a17df440 |     
        i586 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/007ccf01ca2c168e32a45c637ab7f4e215a1ae30 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/3e2af7aa6765d41a0605835492e08d9aa4d23f3e |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/20ee31dd485e0fcfb829f64eab41567373cd470d |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/5b56d0cd12d21506e32e84709a758a070ef149a4 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/d142f70cf718c8e7068cb714cff368d4df9f053c |     
        m68k |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/868ce3a2a963e32acdb93dd6ad9e40fd23ea560f | ORPH
        i686 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/bb0288e3b9fa00782cc6618a7f1c650d69f8c545 | ORPH
    mips64el |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/ad3a68b02114e5ba3cdcdea241a7ca89656531a7 | ORPH
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/293ff11ee3d508fa83541072ec275d5480c8c82d | ORPH
        or1k |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/11e650c1f2716df8c2f7f9895e377da92a468123 | ORPH
 powerpc64le |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/aeb79caaa5674b5df6d4c15f9c2f50e2a66b9f24 | ORPH
    mips64el |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/ecb0cd07bd0dee51b15b0585404553b930011552 | ORPH
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/95898e34bd29621ebd76597e70c7e92726573663 | ORPH
         sh4 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/eed88850fd915d581e0eb9d6bf15a704536550f7 | ORPH
         arc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/eadc9376f0635f6bca80732502708c86074b1b97 | ORPH
       sparc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/a97b65fc8abf14d50204aeb23433413592e5a609 | ORPH
      xtensa |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/4595ef9aeb9845f04344e708e226a4c287084617 | ORPH
   powerpc64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/225f37cc8696640aff351d9882b9d4759cb9943a | ORPH
         arc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/154f5ac5088761eb2207dfeba29e3815cecd5231 | ORPH
    mips64el |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/3220a0ddd45e4006e93b93a57e19e1dabb97a6f3 | ORPH
      x86_64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/6cc0692147748cc862eb7080cfe16cf5fa80b221 | ORPH
    mips64el |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/da0eb8bd16159c3fc6a1ec45171fdc277b553e56 | ORPH
         arc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/e1a477eef8dcbc1e083e52a0e5f4534eec2a3b29 | ORPH
     powerpc |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/6f5542d01c6d71fee5549c1c584ea046421015d1 | ORPH
        m68k |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/8b6364d6a0e2b588aa6767c2137d06f98aae3520 | ORPH
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/be0d50dae1f86ad96fbac559b5a17a9dda036c1c | ORPH
         arc |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/eb5f7dbba8320fd2b4f07b487602289b457ccb55 | ORPH
     aarch64 |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/514f13828c546759fd068d89447b31bf6837ae4c | ORPH
    mips64el |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/a47d2cbcc431147ccafa7a895b2a627cb18205f7 | ORPH
      x86_64 |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/64662d5d116531f4b53ad26359a7faec7f6ed341 | ORPH
       sparc |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/3997bcd4b9a1af66a39bca5dffc121e71dc9a70f | ORPH
microblazeel |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/c8cb42f40ed3400b36dc58ee6c699dfbfa0b4a91 | ORPH
    mips64el |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/6fe751253d439521e22931f6254fe2fc2fb1ed94 | ORPH
        m68k |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/f107b2681e4066cccfdd2a4a84d89e651c9cd6fd | ORPH
      x86_64 |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/be716e9417d9badc35c0677a15f356fbe8286cb5 | ORPH
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/804225ec742e0d6795853134a2afcdd63c2f9f01 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/171e962e597ec05a12a1aae38e364f236fae7263 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/2ea367b59260a40bd1b048352cd25bfb48d27f11 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/e8d3d8ba8e622d053c220b291e977d53ee3aad4b |     
    mips64el |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/4ec4ae24c0635fc212dbe24318d90634ac87e8b8 | ORPH
     sparc64 |                 protobuf-3.5.1 | NOK | http://autobuild.buildroot.net/results/8a33135092d564ebb403f1ce7998d45cf6ca5e76 |     
microblazeel |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/ae33b37a8243a43aff2144106c57b338fb2c706d |     
   powerpc64 |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/18a2c79f414e89b3ccd7641bcee4e93cc9f8f382 |     
         arm |            uboot-tools-2018.05 | NOK | http://autobuild.buildroot.net/results/e3401027d2fb3ce565ca9e2456a427afd3610a87 |     
         arm |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/faf98f5441bbbcb409dd125b3c01330d2e974aaa | ORPH
     powerpc |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/caab0f68ed9cd5fcabddd7722fc57777e003cc4f | ORPH
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/179cc66492735407280195f26a864d85165b073e |     


-- 
http://autobuild.buildroot.net
