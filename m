From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Apr 2018 08:00:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-28
Message-ID: <20180429060019.11112209D4@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-28
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  28 |   3 |   0 |  31 |
      master | 240 |  53 |   2 | 295 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   flann-1.9.1 | 2 
             bluez5_utils-5.48 | 1 


Detail of failures
------------------

   powerpc64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/734df58c593b31f2d680ab1c6191d017be954614 |     
     powerpc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/aa9606bfc5815e642ebc8137dc226db9f24a22fe |     
 powerpc64le |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/b3995f9c0a82394ef855ac120a5979156850aa97 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     lxc-3.0.0 | 14
           libfreeimage-3.17.0 | 6 
                  udftools-2.0 | 5 
      gst1-plugins-ugly-1.12.4 | 3 
                  host-go-1.10 | 3 
                cifs-utils-6.7 | 2 
              dropbear-2018.76 | 2 
               log4cplus-1.1.2 | 2 
                       unknown | 2 
                  zeromq-4.2.5 | 2 
                         boost | 1 
                    gdb-7.11.1 | 1 
                 host-rauc-0.4 | 1 
                        libnss | 1 
                libselinux-2.7 | 1 
               libupnpp-0.16.1 | 1 
              lynx-2.8.9dev.16 | 1 
                 mesa3d-18.0.1 | 1 
                 mplayer-1.3.0 | 1 
                     php-7.2.5 | 1 
     python-subprocess32-3.2.7 | 1 
                      qt-4.8.7 | 1 
                     vlc-2.2.8 | 1 
              wireshark-2.2.14 | 1 


Detail of failures
------------------

microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/c3999b90eedf6fd144d13bee7c8fa6a3709ce741 |     
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/f0d6b3e8dbd8aac29e5b4c1aa04bee930b59ab9f |     
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/82e0c846c3c2e5249afe984855813feb0ce4a1b2 |     
    mips64el |               dropbear-2018.76 | NOK | http://autobuild.buildroot.net/results/545d665c8422527153c28943dc92c24f994ff4e5 |     
    mips64el |               dropbear-2018.76 | NOK | http://autobuild.buildroot.net/results/a88c78b175fd609f9f151f0cccfec4531312e4b4 |     
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/1bc8e55220df13486d595991d929c918ac4859a8 | ORPH
      x86_64 |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/b77d8ee3b839d1d8fa33b5b7d549072c75c7408e |     
    mips64el |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/90d92f29aa16976721efdebe211a8b345658ed03 |     
      mipsel |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/a1a62d79b39e70379f61b0ffe7ddf49320641153 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/f332c13c77198dd343bf579ec2dbb5e70b02c5d4 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/90a65232df66dbbec0f34f22e2a6bc439c4e973c | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/96b71a3feac6358436c194e97af044c58563d0d4 | ORPH
         arm |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/c9d5d643cb1362f3f5a850020eab19df603af3f0 |     
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/f6bc0532377bb5dea16f3ee9a2e551042d8ba607 |     
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/fef3bfe85a12df13d7adaa1e7d43eaebaa78f0f8 |     
       nios2 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/a807cd4598819e5d022fd12622ec78673ce1e63b |     
    mips64el |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/cf115844b7e8f70b531ebbb9281c6f3d3e0c7fe6 |     
 powerpc64le |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/d523a724078fa150b32d4b96e1bc6fbad808cf06 |     
       nios2 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/ac2efb306c2e44b2a170202c8d38e81423f095e1 |     
microblazeel |                         libnss | TIM | http://autobuild.buildroot.net/results/5ebd6a168eca0bb2c1ab521b5f4492c200d7edfc |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/473c68f4420e4a4a41909d4ba164e26c03629611 |     
        m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/2e9112b7653fdd7dd78ed6dcb711749e56290fb1 |     
         arm |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/a58007263355e2734a8074d52b1b26b88973c39e |     
        m68k |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/7d6fd0872efd23c7de552ab637956902b43c3f58 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/16831a1ee4afd9acb44b7fe992db2dddcf9aca66 |     
       nios2 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/7428e0e4429f821d563e1f1cb11f5a3b430da501 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/292a713175bc77ca2d709872576dc4cd406064a9 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/de892914daf6336c48d579607276346712635c72 |     
      mipsel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/84fc584d107204f00cbe1a39a3c8e35ba86f6787 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/6b3aad83f30f12e78311e5d7c718bb78b136af4f |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/9fc8a409090467a975cfebdc42776c2be6f28a0b |     
        i586 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/ec01f7870657cb408ed3895c60b5e8b506c3b3b3 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/0eab65d82f8eb73c0b7d4dbcde1166c517cc566c |     
         sh4 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/ae01c3b848ac0ede447e219c3457fb2f965ac4ce |     
     aarch64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/2068fcdd6db64a166bf64aa57f9cf08b1fd3b2a2 |     
        m68k |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/ba213082580ee4506a90278f9c78bfde23c10ce8 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/2202874e94280387e51377776cf1697ab15527f9 |     
       nios2 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/be53f361ed189d920eb2d945cb6dc91fb23402b4 |     
         arc |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/43b53906de657d49ee0415df45ccff0977b3dda9 |     
     powerpc |                  mesa3d-18.0.1 | NOK | http://autobuild.buildroot.net/results/5e8a471d2089e06dfad65c14e9d49451bf488624 |     
     aarch64 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/188b3ed2e888518c3e57eb8a570a6412f487f221 |     
         arm |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/6e50fc2ad6b705419e3db9ff4e57ee43f5c52b65 | ORPH
    mips64el |      python-subprocess32-3.2.7 | NOK | http://autobuild.buildroot.net/results/442c9bd714fb6859eb769f07ba101ea340f6e0e4 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/e7ede26aa36c117b91eaba97c0ced6145adf05e3 | ORPH
microblazeel |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/4328508ea7f2bb7500de68b833d38d9f6a163f26 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/4282da48e4b540d8f5364ad2173a51841f83564f |     
       sparc |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/050cb124fb3517a27868349336307040d64f7998 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/ef703629fe012384b7467b9fc8189d61b44ad18d |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/20fcc7dbd367a09f543570a4ef2ef25b83486272 |     
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/61588555b96c0d550c2e00cd503d05e61d945747 |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/55aa2fc6a3b58e35f2926f7931f4541ff615276f |     
         arm |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/2ca4c351d1017de8b5566fbb0c290e1cb66990f7 |     
      xtensa |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/f026cf427fe3e0244eb16f8a238f142cf71cd3af | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/fb7d0ea29ab27b0119e52d5e39f9676ae0593566 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/a8055affecae0788170ad6c3bb0313d257a60c7e |     


-- 
http://autobuild.buildroot.net
