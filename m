From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jan 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-09
Message-ID: <20140110073009.29F54100CB5@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-09
===============================

        success : 72 
       failures : 78 
       timeouts : 1  
          TOTAL : 151

Classification of failures by reason
====================================

              libnfc-llcp-1103 | 23
                    sdl-1.2.15 | 11
                python-nfc-212 | 9 
                 pixman-0.30.0 | 3 
zmqpp-30d72d95f2cfdf9c5cedf... | 3 
              cryptsetup-1.6.3 | 3 
                aiccu-20070115 | 2 
             util-linux-2.23.2 | 2 
                   hostapd-2.0 | 1 
                     gdb-7.5.1 | 1 
               harfbuzz-0.9.22 | 1 
                 mplayer-1.1.1 | 1 
             ipsec-tools-0.8.0 | 1 
         host-elf2flt-20130904 | 1 
                 cairo-1.12.10 | 1 
                       unknown | 1 
                oprofile-0.9.8 | 1 
gpsd-b4c32aa40cff1b4e1041d5... | 1 
tvheadend-c7d0335eb10d02b78... | 1 
                  ltrace-0.7.3 | 1 
ne10-88c18f02199947b2c8b577... | 1 
                 ffmpeg-0.8.15 | 1 
                    systemd-44 | 1 
                 rt-tests-0.83 | 1 
                    ola-0.8.32 | 1 
        ltp-testsuite-20130904 | 1 
                    fltk-1.3.2 | 1 
                  thrift-0.9.1 | 1 
                 sysprof-1.1.8 | 1 
                  zeromq-3.2.4 | 1 
                  samba-3.6.22 | 1 

Detail of failures
===================

   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/ab906771de61e2141b32604fedebcd47c8927e86/
     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/b970f7c90f4f3bdbbf68cce2ab837b5cbad7c0be/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/d1f895fd445ddf77bafdcc634b67802612cdc4f4/
  mips64el |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/b008bc43c292c768bbfc1bae95d21f320adbec00/
    x86_64 |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/afc6f48154f227c5a88dfe44723d4c051b6dc5e1/
       arm |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/17f496d10cbc23c647acfaf9cd68a2757c5b03cf/
       arc |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/60fc7652bb0132ac1fa557cc4bbd59941ecba704/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/9a0d1ca7fc7a90ce228b4d69458267b147b3e479/
microblaze |                      gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/e6b08928a42d426d7f4cc1c21e16aaa5828f33ac/
microblaze | gpsd-b4c32aa40cff1b4e1041d5... | NOK | http://autobuild.buildroot.net/results/e9c03695a3c4ba6302e9462bf219c4035274f137/
      bfin |                harfbuzz-0.9.22 | NOK | http://autobuild.buildroot.net/results/8027898162a7aada705a32aedcf50d2cba7eb264/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/c8df69c0dbd99b33491c2944fc46727b7914adf9/
      i686 |                    hostapd-2.0 | NOK | http://autobuild.buildroot.net/results/ff0a63d27f3926899f33baf109e5232d259e85fb/
      bfin |              ipsec-tools-0.8.0 | NOK | http://autobuild.buildroot.net/results/db30104e3b3947ce660f860c164df4fe7ca79e30/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/b1f0b0c6a75aaeedd55e24761c7b1ee7f36db554/
    x86_64 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/bb9963c06db99ded5b58740cd9611e3d03ecc306/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/122e09c7e4d3b2885e0d6b1d7970a81c95d4d973/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/90c6d154ef5c93d0b3cea1055466751e8b5062e4/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/df2a69b0210c0f19bdbe7b0fb6136eb96bd9d6e0/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/e9d7ef9002e431a4a0de0a9c504d2c14e9567b9e/
       arm |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/d8e212d7e32f604ba46800fc52083dddad494657/
       arm |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/9dd2f0fe0d707255bd8be072d64b4c3d2bd6c4a7/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/2629d098065bfb83beb0a9bb9066d82d98c22e4f/
    mipsel |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/ba027cc02b89acb3db8f8d2db1ca49d40d726f2e/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/33be65f034cdae29e638ff764c67fc01a43d9b4e/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/7ff25b5f92c92027b11c97eb7e919f6e1f94d9f0/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/a1ee1fdf0d1dbfe20fa03e42c2a26e6690c77c98/
    x86_64 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/19390f8d2fe30bb4a71d0f9deb9ca41da183eabf/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/fa1693f92c1470cbe8f3ce3c98af0108f6300d44/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/1198daad52d403881c8a82ef8739f9639cc30b0a/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/644e282d7ce739a3415489c9562e731f560d401f/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/bb0e0c4fe74bbd89ee49714149b2a75a18133a65/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/5e6bd28a273e663776d50c86181ea43f330de98f/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/d6a7378236a3b538ed1b9c31e0fd0fcb98fce1d4/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/ba72fbfc597f3a7e1005db25dee1196ab77c97e3/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/b6c5e36267de73c2bd8d1b06c08b979267fed90f/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/366dacf73be08903b811338bc7a9b1b5bf43d2ba/
       arm |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/e7bc910a673fb319c0182a227f64df89b90133b5/
     nios2 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/cd24e7b6f863ab413d76ca7a81bd357ddf1dc4f7/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/ec2f385e23cebb1b2e6b61fc1efe34b41125875d/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/934be5a3a9b7238879bc50335e12e666f23b0539/
    x86_64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/5f0b3360f2e05f0e9592781a298b211e0142558f/
       arc |                 oprofile-0.9.8 | NOK | http://autobuild.buildroot.net/results/a6028eb5e61fb5cb371edc9008a548e28a10df04/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/d79b7311190a71ce1ca7e295b3019910a61c8b2a/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/79417106dcfeedbea2baa086de466cc0649e56e3/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/52d6fc55e15e9eed5b6cece568c37f480d3dab70/
      i686 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/6d3b752206fad12dbaf67eeb63f574c00af9beea/
    x86_64 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/0e38d38e2f8c96fa7ed4ad3529d83a1afac6c41d/
  mips64el |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/ede6cd269729050e24ab04ace4b6ea574c708bc6/
    x86_64 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/8a390b10458beebea2c9e81da64d919480c0f04d/
       arm |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/b12eeb764f244dfa20e28db74dadefa563660a06/
      i686 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/cc725ac3e6d2695ed81d08b7790781574d53a794/
      mips |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/33af8a21c371b6376acbc3b960d63eaf1907c698/
microblaze |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/c854b47489d4779556f0365538c2582eafa514dd/
      i686 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/2d81eea017892322d06d7df6c51272e77926c8d3/
      bfin |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/46504a75d026fae1d2e4a4472aad66b6fd1819a6/
     avr32 |                   samba-3.6.22 | NOK | http://autobuild.buildroot.net/results/0adf5ea64075323eba1183f93c16d2954673f3e1/
       arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/7326631048bc9e15ffadc6f541f2235592b5259b/
  mips64el |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/f494fc541ede59f060374dd719cbc18021a54051/
       arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/93b02e8b0af35f30ad11a3624dc96b3efd318e5e/
       arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/2f7c02e0ed89a290fd34d556115ac5e72e7b271f/
    x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/74d4dbf933b6eedb96189d688dfba4c98ba78833/
    x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/4bcbb494f101a74c77c0ae9b0c483c89ff0b8a48/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/b932f7c34b3459236e38ce22f83575b95d64236e/
       arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/e8d20c65af6b3c7962c6f12a829d8ba5f8b74a56/
   aarch64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/73442528132cc457101c8400ea50944c3e4c9db5/
       sh4 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/7e1fc88f446b841bab666c2baacb5419ec7f5715/
    x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/b635078200da118b9565ac5d0ee95ab3d07101a8/
    x86_64 |                  sysprof-1.1.8 | NOK | http://autobuild.buildroot.net/results/529061549e95b34e18ec21be5bd741aecb7e5168/
    x86_64 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/215b7348a3031958e3424b21a2970b913c6b91c3/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/1de74420259682952b89a309a2a8a8be5dfc6cff/
       arm | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/004e1181f3741c312ef001c314b836bbc8496384/
      sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/140f2e4d8e65fc0bc09c33e17c080ce57d123d5c/
       arc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/355a9022f59127f056d603b62032a6360867fd05/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/7c7c01eb03e19a9c405d3bb1d8905664ebe165ff/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/1d5ac3e982d4d2c48155937878b9579d3ab99416/
      i686 | zmqpp-30d72d95f2cfdf9c5cedf... | NOK | http://autobuild.buildroot.net/results/23dff2635304db209f3760ced9793ef309844b4c/
   powerpc | zmqpp-30d72d95f2cfdf9c5cedf... | NOK | http://autobuild.buildroot.net/results/acf9e0a17e7c9114b17cecb814522f1133611f36/
       arm | zmqpp-30d72d95f2cfdf9c5cedf... | NOK | http://autobuild.buildroot.net/results/20b8a172805210ce29bada73bf9aef08fb5282eb/


-- 
http://autobuild.buildroot.net
