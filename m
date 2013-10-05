From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Oct 2013 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-04
Message-ID: <20131005063013.154E252C6B9@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-04
===============================

        success : 41 
       failures : 68 
       timeouts : 0  
          TOTAL : 109

Classification of failures by reason
====================================

             gstreamer-0.10.36 | 14
        host-util-linux-2.23.2 | 9 
                netatalk-3.0.5 | 8 
    trace-cmd-trace-cmd-v2.2.1 | 5 
               libglib2-2.36.3 | 3 
                     m4-1.4.17 | 2 
                  usbredir-0.6 | 2 
                 dropwatch-1.4 | 2 
                      qt-4.8.5 | 2 
               alsa-lib-1.0.26 | 2 
                   dbus-1.4.26 | 2 
                  nettle-2.7.1 | 2 
             alsa-utils-1.0.26 | 2 
              cryptsetup-1.6.2 | 1 
          enlightenment-0.17.3 | 1 
                 rt-tests-0.83 | 1 
                sdl_ttf-2.0.11 | 1 
             tvheadend-2b64995 | 1 
                libiscsi-1.6.0 | 1 
                 libnspr-4.9.6 | 1 
                  sawman-1.6.3 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                openssl-1.0.1e | 1 
                  aespipe-2.4c | 1 
               pcsc-lite-1.8.6 | 1 
                      gpsd-3.9 | 1 

Detail of failures
===================

       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/c2013a5a088fcca3eb6ff56d2e2583558b030546/
       sh4 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/3aecf12ff67db47803e787ea1c01d6bf48be007f/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/e0f5038da88863daa5b0b54703e230c14c81aa4c/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/1c756f6c437f1f7b68421efd8a2502de62692b84/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/821e445bb3833a52035bf2c93ab2067bbb5bd750/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/2a880468200fab75965c8c3fbbb4885af71402fe/
      i686 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/80a317e33afd1d5ba2f7dd9ecd89314b09b4b1fe/
    x86_64 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/2c3c040624652547bbeec363d7d6b03f2477ff00/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/758a6a0e451317fdb338387753335855869a35b1/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/48bba878fa48e95741a15f2392926fe1c17d27ea/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/a312ff975ccecbadd89c402733610712474e10e1/
   aarch64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/53388b4e8dcd46e7229427e9063072f71d6d98f6/
   powerpc |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/3e7abddb3c231f88768cc8d7f31f8e6055200d07/
      i686 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/509ee31bbe8aa9c16756a4ba793fc29ebf293ae5/
       arm |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/f2e6d9bbce5fbabb667a587293c78eac35270ba9/
  mips64el |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/eb4e59a7c09e8e657d4ee8b693d71204b49a7935/
   powerpc |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/2c5feb7cfb66606231bdd4866cb31fa8a40f6510/
   powerpc |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/df473cb34c9914b2c3d3d8ae344cbf7c19255468/
      i686 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/9574d95841730e740d97cd6de608285e2949fa6e/
   powerpc |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/77beae358c14f4d76288fa76b0a2504648a86eca/
   powerpc |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/21a7989428c8f284eda428ff285501b6f9d76e03/
      i686 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/1b4080a1e40fb4bc9346911b11f611499e04888b/
      i686 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/5951207b9ee2df79e1bda9fd6c44599e4e53d046/
    x86_64 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/3004395cb77deaa491c26d3e47eaae8f458a0afb/
   powerpc |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/ec7a98a78a0061386b95373680d59d04a038be55/
   powerpc |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/82083d5d045122b3bdc4813819be21b5bcb44941/
    x86_64 |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/fceeabb5bd78f48b273830248cd540e222f04b32/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/87a78e77df89a506f6ab9b06179861480967d14c/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/a24aa08f13fffe354797f1e5252a69f2b7ece582/
    x86_64 |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/9f56769b0b20a483a85ad62d701667afc45813a8/
       arm |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/a738ac0a09d3ca92f4abf1f2c82f37db57fb338f/
      i686 |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/91bc6340bfe291d3479e0764f8d56bb5d081f835/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/f212b20548369d5ff1e7cff34fc18456bc165cf3/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/636f97fae1917b4b0a7130c83a6b7cbc686b8197/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/4f8ec616ec1c151d94152c78e4aaeb0260d7f027/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/5b199b365817b3444c96fef8afd75146bf8e3f21/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/80a0d575d2afac933c8cb2fb596a0347c50e4912/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/517e2754256d39864d38befeeccd54c153e28971/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/f537b899b3b29695ab4865165a71040259061a11/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/d536b47a885c74feae98825edcf8cb1f26889bef/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/e75a279378cecf16a58dbb0c3c04f16bbe1d629a/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/b1616560ccdd8b6c9f43582ee1a297aeea628240/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/ed85689a77bc4470173e228ca2d61f33bac44a13/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/ee6644c8e6e1c27baff29e2cc7c88fbd28cba1ca/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/d89547a0f0e57bb30f521a77dc33803f3586ca17/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/00862b2a07fa82dd8494ecd31b3f0b579c60c11a/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/dbade69e610a079c5e12356991e6b908f4f716e9/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/8a6e0796ee81dcab70d8022e3aea7ca6c0c1d752/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/ec10240c33f7a52c561e9a1b96c871a3ada3aadd/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/13305369a38d65e2eabc6db94f0e0502551fab8d/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/119c75a5ecd276c52c4e4bb306944ce8891821af/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/9a3027a69dac63b4e621529eff18035530796e7e/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/4611c835d904fb5728ae5531bcc41ed33e1f5de6/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/ac8992a75b97f0baab55fe6e93ed0a8eeca08bcf/
microblaze |                pcsc-lite-1.8.6 | NOK | http://autobuild.buildroot.net/results/c1332dd02817e25ab8ecd0ceab8c4953b65c9f50/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/2ccf57cfb95bda58f25281c894b5d5465c4985a2/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/319f52aea74f4e91457eeb5d1db01866b027775d/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/ac5465105df912b2ca084f917bc980b564bed036/
  mips64el |                   sawman-1.6.3 | NOK | http://autobuild.buildroot.net/results/560d04f5a82c21a0756bcd7c96a8238d724deb3a/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/33228159ee568edbddf357e7ac8ebb7349cb638f/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/353ac6ab96b121cca3d7687718df9a1886e29637/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/c7f191dcd8646731bbc4ff316c916da194ba5a22/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a276f2d45b74e95af5294cc706c3382dd5d80b89/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/8fe4a097daac023d2cd3238b2d0bb8ebb6247d87/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/11bf009288b74764949fe25b9ebfcc7fa1e2546d/
  mips64el |              tvheadend-2b64995 | NOK | http://autobuild.buildroot.net/results/107e10050da2cf3e5f5509341480ce34a7aa0b43/
   powerpc |                   usbredir-0.6 | NOK | http://autobuild.buildroot.net/results/e46dd9a005d56bda936c5ccf44b77f81a9be5db6/
      mips |                   usbredir-0.6 | NOK | http://autobuild.buildroot.net/results/0efc44994898f8c160e91d3066f3d199eba16ebf/


-- 
http://autobuild.buildroot.net
