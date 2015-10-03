From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Oct 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-02
Message-ID: <20151003063018.16B40101277@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-02
===============================

        success : 218
       failures : 42 
       timeouts : 1  
          TOTAL : 261

Classification of failures by reason
====================================

               util-linux-2.27 | 2 
libbroadvoice-f65b0f50c8c76... | 2 
                pulseaudio-7.0 | 2 
      host-gdb-arc-2015.06-gdb | 2 
                busybox-1.23.2 | 2 
                oprofile-1.0.0 | 2 
                directfb-1.7.7 | 2 
 make[1]: *** [all] Terminated | 1 
                 libraw-0.13.4 | 1 
         qt5imageformats-5.5.0 | 1 
                coreutils-8.24 | 1 
             libseccomp-v2.2.0 | 1 
             webkitgtk24-2.4.9 | 1 
                    ustr-1.0.4 | 1 
canfestival-7740ac6fdedc23e... | 1 
                 mplayer-1.1.1 | 1 
                   systemd-221 | 1 
           qt5multimedia-5.5.0 | 1 
              strongswan-5.3.3 | 1 
             lttng-tools-2.6.0 | 1 
                 dropwatch-1.4 | 1 
             bluez_utils-4.101 | 1 
xdriver_xf86-video-r128-6.1... | 1 
                 mesa3d-10.6.8 | 1 
  xdriver_xf86-video-mga-1.6.4 | 1 
                libevdev-1.4.3 | 1 
               iptables-1.4.21 | 1 
                   bdwgc-7.4.2 | 1 
                 sudo-1.8.14p3 | 1 
              lirc-tools-0.9.2 | 1 
                    faifa-v0.1 | 1 
                   lite-0.8.10 | 1 
         qt5connectivity-5.5.0 | 1 
                     rpm-5.2.0 | 1 
freerdp-770c67d340d5f0a7b48... | 1 
           libfreeimage-3.17.0 | 1 

Detail of failures
===================

       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/693d04c2aa6553f543bd5aea08cb3ee17db4e3d4/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/9c9717a7c1a37e9275b19a0a6d457306ee58c403/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/7fe01b985788e8930bf411e9ab02d017b4cfe971/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/2ebaabe8f605b59f56767d47cb3b778200016e22/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/8fad8aa98fa84589fd7f6ba4fc9cd5d8f1b4c9fe/
      xtensa |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/06f04edde89a4178a4f36e5d016d6cd7c65df09f/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/c4d2e99bc77d7b471969a6fe104c8c7036c67246/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/3202f9257b5b5517405b4e82785b85adeda37c31/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/6ff6b4acf796578093ac9f4dfac31d053ec01299/
      x86_64 |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/30b9a513ad6adeba60e6fe553461da5562a80d25/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/1a076189d03335a201bfc7ad27262f96675495bb/
         arc |       host-gdb-arc-2015.06-gdb | NOK | http://autobuild.buildroot.net/results/4ed3c86f639356c908325d6085e1f61a19bd78b0/
         arc |       host-gdb-arc-2015.06-gdb | NOK | http://autobuild.buildroot.net/results/f4f71c118439867df9a4f1c9abab92d4a716c2ec/
      x86_64 |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/e232a44e1500d25dd1178894ba1615f682ea8977/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/e0e7c950aa5abebfcf6660cff5845d0865805916/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/2c9d2e87bb040c88f790cae5edd1acf1bd5b422f/
        bfin |                 libevdev-1.4.3 | NOK | http://autobuild.buildroot.net/results/a3f6fb237dfe5774666e808996da259fd94d768d/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/f0f7a29456f25f8250545188d04edc14fc20bb83/
        bfin |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/337afc37803e4de84cd39ea93c6dad5d3f4635eb/
      x86_64 |              libseccomp-v2.2.0 | NOK | http://autobuild.buildroot.net/results/d97c4f5a71dd9c236d70a3725ba30b8c840cd6ed/
      x86_64 |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/9ea65b3d7daf82897a033b417e4a79b3e865a2d9/
        i686 |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/8fd850a63f60cd39eb33ec0ee0d485912b873d4a/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/845e210c309004126901027185ebdb1e46c5a3f8/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/c9c5c52afec6c0aa965717480d2b686ea00581b2/
     powerpc |                  mesa3d-10.6.8 | NOK | http://autobuild.buildroot.net/results/2aae35fb0707ecdfaad10149906dd1dc20905924/
         sh4 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/b7d3f9ed25ebc061218e147d4a1985574d500572/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/0ac8330c4292bf35cfe9f32d4917a91554494511/
         arc |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/f380be3e4de07d477fa483b06c3dda97745a0b69/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/c3ca4c5ac312c505ec9a9ea9705c48860d4a520f/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/ed7c97054d8e3125d6724d676ec4417287111242/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/4241adafb95576395e93503eaa8dc9dbdeb83532/
     aarch64 |          qt5imageformats-5.5.0 | NOK | http://autobuild.buildroot.net/results/42863fc0abf6fde2054d3056a574e52fa59a7660/
      x86_64 |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/497ba83104c864311cb926d216908b049ff99033/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/2581e5d5d144c2d5059e597368be878d86c119e7/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/2ee34da05715a1f125c888412a259458672d7811/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/6c127ce616bf4e1c8ae34b07405bda6fa8c1c8e4/
       sparc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/f7ef05ba482f29e7d9592cbb8aef126ddc2bf038/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/964d8c43bc714b61065aa64120b875eba1973907/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/0c7c163eb2e88fd89cb5fbf72142f1314a16ea50/
     powerpc |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/f98399b5b98ec5b4b402720b09150875a524b2b0/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/a2cd5107a10f33e37243dffe09009d034660547b/
    mips64el |   xdriver_xf86-video-mga-1.6.4 | NOK | http://autobuild.buildroot.net/results/54481a0f8d690e3878f4616ae1f331705e3c34be/
      xtensa | xdriver_xf86-video-r128-6.1... | NOK | http://autobuild.buildroot.net/results/99519b84941e93c482f606f2856697043fca84b1/


-- 
http://autobuild.buildroot.net
