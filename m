From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Jun 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-11
Message-ID: <20130612063004.881EC52C0FD@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-11
===============================

        success : 107
       failures : 68 
       timeouts : 0  
          TOTAL : 175

Classification of failures by reason
====================================

        host-dosfstools-3.0.18 | 16
            host-erlang-R15B01 | 12
               openswan-2.6.39 | 5 
media-ctl-ac40b79f002a2315f... | 4 
                  iozone-3_414 | 3 
               libglib2-2.36.1 | 2 
               sconeserver-211 | 2 
             tvheadend-5513b44 | 2 
               alsa-lib-1.0.26 | 2 
                  ne10-88c18f0 | 1 
                 binutils-2.21 | 1 
               wireshark-1.8.8 | 1 
          host-protobuf-c-0.15 | 1 
               wvstreams-4.6.1 | 1 
                  zeromq-3.2.3 | 1 
                pulseaudio-4.0 | 1 
                   ncftp-3.2.5 | 1 
                   mplayer-1.1 | 1 
                   cups-1.3.11 | 1 
                  weston-1.1.0 | 1 
                       kmod-13 | 1 
                  gnupg-1.4.13 | 1 
                openssl-1.0.1e | 1 
                   mutt-1.5.21 | 1 
                      qt-4.8.4 | 1 
                     m4-1.4.16 | 1 
                    systemd-44 | 1 
                directfb-1.6.3 | 1 
                 libnspr-4.9.6 | 1 

Detail of failures
===================

      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/dc2bd152020b628620d2f322aec405127fcb0412/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/f76a9f0fe7bfe68aa948cf6b93a21ae23dc00ac5/
   powerpc |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/85032fcae03aef716c071dda594ef9905be22df9/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/2a524309384a94b39f603c58427f7d43573ddc08/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/0ea35374a1137072178e8f85d9da6d72013920de/
    xtensa |                   gnupg-1.4.13 | NOK | http://autobuild.buildroot.net/results/5dc97fda41c5e9ef5b111b1ec6ddba1afe307965/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/a9993b5f1c9ccf89c48b0219bf9b42f6804c2da5/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/efaa347fea36bbc76b95c17e6455ed15364841e6/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/9c4f32d61081bf1d452b89f382375d58164a0f19/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/06dc2907245a6ea0eeb2741c6839c1c654b1450b/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/90aaa0ef143944e340db89802579c50153cb7eed/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/336f7659846ecaefaa4978f40ba379e936c64ba0/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/2ab25a502cf206eeb6315fae013bf95f2d98b3e1/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/15264a63789e13991ac8ceed783e9c801c757fd9/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/fcd3b5ca4f5aefdd220bcd2172d49a2ae3989194/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/488e7c2d99f21f72a680a86097d8251938fb3189/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/2b7bfefdda28a2be9b62559a2e68cec0bc2e2e25/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/6829384d8d1262e356e7961bd3344e58e9823ba2/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/15b9840b5ed72744bb7f4bee89e9d4c0ac29cab0/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/cb009ebf75b42b494f0da90c9cb7f09e303df6a2/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/27c1f1ff7900b5df2492079282648a4f6ae1ce57/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/1290999617b3a1057b00b8666120ae4a3b134fa8/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/5c0fa506a93227e4433f08ac66ab713f4186c662/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/78673d124273c6d643454afaf4d3d20f0b979e24/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/b08de9f7aa5c8475205c12b6064e35c1cc38c541/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/69fbba217e235d494add84320a4acee3e6de05bc/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/d79910a1637e176f00370d9f95425e13fb1bfafa/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/fff5c4d6a07bcb7572f4b680d66394436c6e6677/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/662fc463ba7befa7497c899b0630b374f6977ccb/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/43e89d035b1c680bec11cf99e5ec79be4e9f5a78/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/0dee6c1d5a88c8abccf8c3f5b301c18ad716230b/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/b097d15a78031d6f130134ac8ade6a21a564838e/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/7857e69f74824fd7a81958e50ac61c197dca42d0/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/9a4dd0faf960b955917fbad905b177f6d01b0779/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/b711c3b6f93d5211923625f25162a60a09310a90/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/847ff57ac64d4997f8b67373a3fc70c0f62df17d/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/6239cfaf964389cbe3aaa4d4e45dd3c9705837ab/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/1547c45d507b372fad834853bc05fd152824e8c4/
      mips |                        kmod-13 | NOK | http://autobuild.buildroot.net/results/f2cd6869b7eb022999b58549fa6af98f186a522a/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/62c27caf48107d4c1350f4c027cabf4104c172e5/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/3817d2046fd63a9871d1b2cf39ff1ec67a49e877/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/bbb49ff0e058e7031768b4fcf5b141ce97a75cd3/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/f6aef4f5c34ea7623a6eeafef3c2a30e4a96ff03/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/f7589e7250a9a12ed643bae60ad6ef866963512a/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/1feb2ff50598090d08b70377fae087d572fff0cb/
      sh4a | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/f483eb6d835ae3a0c73fb68d58fbe6bd5d0e6577/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/53f36dce6ddc482a2f4971bf158a5a927e3b6b68/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/739dac42d55448d6c8be3a899d10fba495f0a554/
      bfin |                    mutt-1.5.21 | NOK | http://autobuild.buildroot.net/results/8ceec55fa8358d8821f2deaf3440f5b06270db6a/
      i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/4a4aa342c96525405c9c9d3e98e4bca6b315be24/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/a0abf270da3b720bcff892ae70f6a9c50cc73689/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/b34d31f0b58e5b45492c82e9b0bd1b015056a6d3/
      sh4a |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/09f34bc3e1c5505787c08594564fa93b350d5427/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/a9095cd34be9c73bf302bb47ebe6a15a70bab4bf/
      i586 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/047a63346ac0a7d195a5fed39218e9b6907cfd3f/
   powerpc |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/9779215c4dfb68dc105f27097246a97851b1f6c2/
   powerpc |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/92454f94ce5a4b8705d4a7b44447f081745538f7/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/4162456bcbbb095a0d220e85b3b8680896fe9e14/
   aarch64 |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/59020601c4276b8e27ed8e6b1eae298ca5a4a8b0/
      i686 |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/5c68ba28fba621649bb7669eab2642288651abc4/
   powerpc |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/694c5dbe29f097cb6aeb3de0cf3a4cabba687bf9/
       arm |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/8ad589d9f6b258f7c9c0daffa45c5993722edfae/
  mips64el |              tvheadend-5513b44 | NOK | http://autobuild.buildroot.net/results/bdf2b5c27b2d00ed5f5401809e406c567cb6c55c/
       arc |              tvheadend-5513b44 | NOK | http://autobuild.buildroot.net/results/9df337d9c114fb978eeaa3d89852969ead6a2705/
   powerpc |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/c4215e8d596082b0c5839dcf5d1650441d6c152d/
    xtensa |                wireshark-1.8.8 | NOK | http://autobuild.buildroot.net/results/3bbaef15083e2fa442d867eca84c7039e1a3a43e/
    x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/0aeae44fad6a09d1583e7bdcf162446c756f6252/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/d4717023c86008db7df8e7d62d0fa6d8b652e65c/


-- 
http://autobuild.buildroot.net
