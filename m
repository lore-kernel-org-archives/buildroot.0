From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Jul 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-06
Message-ID: <20130707063005.1A73552C08A@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-06
===============================

        success : 81 
       failures : 66 
       timeouts : 0  
          TOTAL : 147

Classification of failures by reason
====================================

             iptables-1.4.19.1 | 11
                classpath-0.98 | 9 
                pciutils-3.2.0 | 5 
               libglib2-2.36.3 | 4 
                 libffi-3.0.13 | 3 
                 qt5base-5.0.2 | 3 
      host-gcc-final-4.4.7-arc | 2 
               ruby-1.9.3-p429 | 2 
                 libnspr-4.9.6 | 2 
make: *** [libpcap-legal-in... | 1 
                 libraw-0.13.4 | 1 
               libcap-ng-0.6.6 | 1 
make: *** [xapp_xinput-cali... | 1 
make: *** [kmod-legal-info]... | 1 
make: *** [neardal-legal-in... | 1 
      gst-plugins-good-0.10.31 | 1 
                   mplayer-1.1 | 1 
make: *** [fbgrab-legal-inf... | 1 
make: *** [bsdiff-legal-inf... | 1 
make: *** [googlefontdirect... | 1 
                       kmod-14 | 1 
              host-elf2flt-cvs | 1 
                  webkit-1.9.6 | 1 
make: *** [libcdaudio-legal... | 1 
                  iozone-3_414 | 1 
make: *** [host-genpart-leg... | 1 
media-ctl-ac40b79f002a2315f... | 1 
                      icu-51.2 | 1 
                 libiconv-1.14 | 1 
                    systemd-44 | 1 
             libgles-undefined | 1 
          host-protobuf-c-0.15 | 1 
                 cairo-1.12.10 | 1 
make: *** [linknx-legal-inf... | 1 

Detail of failures
===================

      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/d9739d8ac9c798aec9e196d2e469e4b7e4f79b8f/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/289d4bcd2ab8f5411ba9e0761475e014ed662cd0/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/69b41e808a9336fb0f896fbee5ceceb183fd5614/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/213524413f60f5046fa8f195203bdc60528e0bfe/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/5425899bb1ab2671fd81087511145d24dec1cdbf/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/b81f24c5cbe6a60f989eeb9e8177e7021b56e0e1/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/ad5f88190a4f7be81a8080895f30b70a7f6fd1c3/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/0a53780895950de335ea1dac098bf9c3d84909ac/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/7aa8075aac2349e6d17eb6f60c9b214271e349a2/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/fb6a01ba2cb579d8ad14b94c44524a75e9b878b6/
   powerpc |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/697aced450a278430a5a1b2cb0455811b81b3faa/
       arm |               host-elf2flt-cvs | NOK | http://autobuild.buildroot.net/results/f9c6f5906dedb4073b34142aa20f3b818a8a87ac/
       arc |       host-gcc-final-4.4.7-arc | NOK | http://autobuild.buildroot.net/results/fba5566a25eb0a14e1bdfac00a65b5029622c3a5/
       arc |       host-gcc-final-4.4.7-arc | NOK | http://autobuild.buildroot.net/results/b2bae8e6d4ac2bddc614fed21c57818a162236bb/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/9776bdaa7e0402f32c34d3e96fe189504833179e/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/ae011a111c85557b596bc11f686d140901f56637/
    xtensa |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/cee6773f12fe3be62771928c1de1a4bc33822204/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/8113e033b1eed949f83c05f67cffe56ab238f225/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/a748b881517a546b536fbe81da1c09d5f7d443be/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/ec61bc7436f938c6b5d4ecee8b82f8a2ed50aa93/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/490d6356295fb994411e54462d647c5fec21ffdc/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/f52003da927cb4c0c5a22c4130f09a441b1eceea/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/cc0ba8051b77635fa2e114ef49ef35f878eae69e/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/16aed96e76c593f67f666d7067fdb1413647bc70/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/cc55c7379a54ba71c2db1af828e532a4ae554724/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/4f1724ce0687b1d2309a4c3a692b5aa67f6e0cfd/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/2e7faad8de30e79f248fdc65ae21f9049e231a56/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/d3d26eb92c5f178f7f4572323f3f6f41318500b6/
      i686 |                        kmod-14 | NOK | http://autobuild.buildroot.net/results/9c068acbde60a0ebbacafc6231d8e35f61d65490/
     avr32 |                libcap-ng-0.6.6 | NOK | http://autobuild.buildroot.net/results/675b44a8cf2216b59b1beec7246637fb7498a58b/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/1fe9cec5e3809b1dad6f86573593e19f8abd9d2c/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f1bcdadd6b0a3914e2d923f8d7cf19436fbce1fe/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/134305209d4214c2ba46ada677c1424190bf083a/
       arm |              libgles-undefined | NOK | http://autobuild.buildroot.net/results/a07c6fb5926bf308dc4ebc995afad1000d94c4a7/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/f6bde41bd2cc9a994ba042c99dbec4eb89a87213/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/93d2a7b35193366e2e4602d579b8c71b73a07a40/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/1e7b54b7782abb729205fb94ab08bd0c6d464d80/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/8282262bf4c8cf48f85f6f8ffe95b44aeec35d55/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/f719ad8671dd91ddb95cabd565be6758436f2919/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/ba2c8159a1e11114800ac853814ea841ba33ef3a/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/00fb351ce90f6c17c0d7f0dbab15578d5b4fc048/
       sh4 |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/40782b5c93c9de547628b43c2e7e81e25d53502d/
       arm | make: *** [bsdiff-legal-inf... | NOK | http://autobuild.buildroot.net/results/cc20c22ae5e7a4ae4f459a05d64fb30e4c357515/
      i686 | make: *** [fbgrab-legal-inf... | NOK | http://autobuild.buildroot.net/results/86ab296940c92b48651a9eb63cd3a53c8aff4c34/
       arm | make: *** [googlefontdirect... | NOK | http://autobuild.buildroot.net/results/a0b8b400c95bcd6fdf9f8facd623518f9ffdf9ec/
       arm | make: *** [host-genpart-leg... | NOK | http://autobuild.buildroot.net/results/2a72c95496e26bc98b441f62e1bcb64e0bc6322a/
   powerpc | make: *** [kmod-legal-info]... | NOK | http://autobuild.buildroot.net/results/b6c96ed4d5d2b5e2441a9115e58c5ab344806628/
       arm | make: *** [libcdaudio-legal... | NOK | http://autobuild.buildroot.net/results/19d76e47d18a4c795b252389345b21bff695e0a1/
       arm | make: *** [libpcap-legal-in... | NOK | http://autobuild.buildroot.net/results/05636f3934ffc52d1f25f5e85942f06c2430bfad/
    x86_64 | make: *** [linknx-legal-inf... | NOK | http://autobuild.buildroot.net/results/92821ccb2a06df86bead6166cb875f3e78167ee1/
      i686 | make: *** [neardal-legal-in... | NOK | http://autobuild.buildroot.net/results/21719ad42ead9e5597e8e0ba595f49216c412896/
       arm | make: *** [xapp_xinput-cali... | NOK | http://autobuild.buildroot.net/results/0854f8fb116273f7b3922f67f4519da51b51f672/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/329ff77b31fd91f1d4a4ddfb381075a23f209a4e/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/03b74623a6ebc394ce988e2b37e1bb83a93aa236/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/ab4e0b419a3255746b11391bdc4ca52641f9f598/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/04ba77339cc2fbc88e793d983e3f00ca4a7e82ee/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/4443ed32e954da804f13d0f71d2326e2ea9ca128/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/b9467082263093da1c5b236d87c8274aa8491438/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/572ca42357cb19b35ee9130a550b6b3ae996ab2f/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/cadc502aa1d2067ba5a31b255cdca6d741f56fd5/
      sh4a |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/848ad0bdccafc080e7725227fcbc3004110aaa45/
    x86_64 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/02633c87960e09a465c398ac6d98474b5c40d5b1/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/39f254de7c6866bb45b56320ccdb5cb1c882c740/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/f2a38ad70c35365c132b4ca6876d3d39ba890903/
    x86_64 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/18c478571e6707adf0e8242e2a14d92167737a0b/
  mips64el |                   webkit-1.9.6 | NOK | http://autobuild.buildroot.net/results/f6d387233a426be530690b86bd5baf570889ee35/


-- 
http://autobuild.buildroot.net
