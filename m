From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Aug 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-25
Message-ID: <20150826063016.335E3101EE6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-25
===============================

        success : 267
       failures : 53 
       timeouts : 0  
          TOTAL : 320

Classification of failures by reason
====================================

tinyalsa-f2a7b6d3d81bd337a5... | 5 
    xserver_xorg-server-1.17.2 | 4 
                directfb-1.6.3 | 2 
                 qt5base-5.5.0 | 2 
              strongswan-5.3.2 | 2 
                mongrel2-1.9.2 | 2 
                   bdwgc-7.4.2 | 2 
                 mesa3d-10.6.3 | 2 
             webkitgtk24-2.4.9 | 2 
                      qt-4.8.7 | 2 
                 mplayer-1.1.1 | 1 
                flashrom-0.9.8 | 1 
                busybox-1.23.2 | 1 
xdriver_xf86-video-siliconm... | 1 
                coreutils-8.24 | 1 
                  ltris-1.0.19 | 1 
         conntrack-tools-1.4.2 | 1 
              wireshark-1.12.7 | 1 
             bluez_utils-4.101 | 1 
               libupnpp-0.11.0 | 1 
canfestival-7740ac6fdedc23e... | 1 
                 tn5250-0.17.4 | 1 
                dbus-cpp-0.9.0 | 1 
                  mono-4.0.2.5 | 1 
                  c-icap-0.3.5 | 1 
                     nut-2.7.2 | 1 
freerdp-770c67d340d5f0a7b48... | 1 
                    ofono-1.16 | 1 
                     aumix-2.8 | 1 
                libedje-1.7.10 | 1 
                    webp-0.4.3 | 1 
net-tools-3eb367aedf1280f35... | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
                  dhcpdump-1.8 | 1 
                oprofile-1.0.0 | 1 
               linux-pam-1.1.8 | 1 
tvheadend-d9cf931f9f7242f07... | 1 
               libplayer-2.0.1 | 1 

Detail of failures
===================

         arm |                      aumix-2.8 | NOK | http://autobuild.buildroot.net/results/f227798ce866af9c911c0b346c03c6dc41a626d4/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/379699bc2d5cfb7d47bfcf93d182e4065fb10ad2/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/729cc3be16338ce142c83e151f10f3784d2b57aa/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/39260cd328c85ad98d8bd2c99f9d2dab4d16b3b8/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/7446a0c11c5d7aebeed6effa6feb5d46b67ff018/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/fd55a0be40a1db6fda65f3f0a27158e8a27d4767/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/e643c1e2e1c57fbe4d0ca1383de53c2bf15f4660/
      x86_64 |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/4b5df451195b9ad43298820ae9b02f40ff37c9a8/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/0ed52c3ba052b82217ae7ab4dc8d692241008d96/
      x86_64 |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/cd2a8d1d78c044506224e6f206155f7b75d807ed/
      x86_64 |                   dhcpdump-1.8 | NOK | http://autobuild.buildroot.net/results/dc2902b758faa7bcfed44cca5fa73aeffdf284ae/
       sparc |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/1403582a1084ebe930e73a9122ed76da8306b96e/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/ba5f0a56aa2c18424d6a64bc6397afcc6e91d29d/
      x86_64 | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/ddc0aaad51ba204711a19e2cf3a15098c5e845c2/
        i686 |                 flashrom-0.9.8 | NOK | http://autobuild.buildroot.net/results/9640f16046f0fb110eb4a44f56fbe4b69ddaa640/
       sparc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/072ec64c534a36f493189cd6fd838c3d18bb8b1c/
         arc |                 libedje-1.7.10 | NOK | http://autobuild.buildroot.net/results/6ecc789b7406144db4a6927eab80d22e033edc62/
      xtensa |                libplayer-2.0.1 | NOK | http://autobuild.buildroot.net/results/eaf7aafee83b18139c2b42d72831062107d8addb/
         arm |                libupnpp-0.11.0 | NOK | http://autobuild.buildroot.net/results/454283f071b377f247831aa4c129c26d0546f3de/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/e466533a79676aa21c6366dda327ef0748efd866/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/058c9999a1b9c809ead236a743e832788a26a154/
      xtensa |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/f68109eab6a29cd1e2fbc9320929fa7c0db0eb9f/
        i686 |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/d6de1de1f092f24c68913e94bbe697840c3fc44e/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/2822fc7488022f92302912035e1a09eb4b206475/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/9dc3993ddfcce3d2e4dfdf48572a488391225b6d/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/7833cc26d15925a3f2656d2a32823cfecc83f304/
         sh4 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/a666f570aafb3ed244e61f51964cd5221f7f23ea/
         arc | net-tools-3eb367aedf1280f35... | NOK | http://autobuild.buildroot.net/results/c4cd8f44003070f99680195dff05392467ea22f9/
     powerpc |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/d128b262c5cb821a83a8d53b41fe5e1d4f27c085/
       sparc |                     ofono-1.16 | NOK | http://autobuild.buildroot.net/results/534e12ce32b6925cae00819e22f1506ed5b69151/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/500dfac8b3ba5def04c34d6e1c3b85f6d975998b/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/364b600e653d198f44b66e463260e6cc6bb6b276/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d67ad386826396494c2aa5f5737659d6a3a7a2fc/
        mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/ffe83d43fb3c38b721b9982cbb0e980e01d0ebfd/
         arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/538e0325adba9fabbe4ec8e550fbb6a7219f5e7a/
microblazeel |               strongswan-5.3.2 | NOK | http://autobuild.buildroot.net/results/32fc2f37683472429e48f27eeecdb6d3eaa02c83/
microblazeel |               strongswan-5.3.2 | NOK | http://autobuild.buildroot.net/results/dc35d6d5b4d3b84d188f52270716703fa4a4a745/
         arm | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/253e70793333822086da315ddf1a7d0f2dacb057/
         arm | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/d19d1779da473d7adee2a18fea990fa19c7a7697/
         arm | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/6517d572365f7cd89a02fad67719bd89c857b730/
         arm | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/9d0459dc8f7538ca838e19c6c050a7a4664b9d28/
         arm | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/8edd6dc40c7782c9f2c6ebcce6c5b5b9816c559b/
      mipsel |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/95f6df0d01e4944ecd84e830e2bbd8389e1d3e3d/
         arm | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/f1c40ac9dda5ceeb5665d021333058eb29828d62/
    mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/7c0a8ec5cc17024806a541a604fa81ba71fd6336/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/b3493bae3aff6428e2c9a3bb1689eda036e248ed/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/7b4776a5a7465d677d7ea0b5717538bb614be0d9/
         arm |               wireshark-1.12.7 | NOK | http://autobuild.buildroot.net/results/1647b21fe771e31a789ca501ba18c2a4ee3f5277/
      xtensa | xdriver_xf86-video-siliconm... | NOK | http://autobuild.buildroot.net/results/f7fff20484545ab6eb06aba6b048603e8e17ec0f/
      xtensa |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/41df0fcc37b5a807be4c4b1958823fbf36a0167b/
         arm |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/2e9dac3c56738203fa155e24c6336ab938371f72/
      mipsel |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/6d2dbe59233d555bd0bfe484ed36377a829baa52/
         arc |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/7741d2c1d618ad958b7fd5b0fedd0fffe18c2700/


-- 
http://autobuild.buildroot.net
