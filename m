From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Jun 2019 06:00:55 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-29
Message-ID: <20190630060108.4B15B86788@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-29
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  17 |   4 |   0 |  21 |
   2019.05.x |  12 |   1 |   0 |  13 |
      master | 145 |  49 |   0 | 194 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

         arm |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/c8ad7f7fde052acb11dedfe00571057e767a5153 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.4 | 14
                 hiawatha-10.9 | 6 
             xlib_libX11-1.6.8 | 6 
              iputils-20190515 | 5 
                       unknown | 5 
               libcap-ng-0.7.9 | 3 
              libsodium-1.0.17 | 2 
rtmpdump-c5f04a58fc2aeea629... | 2 
/home/peko/autobuild/instan... | 1 
             host-cargo-0.26.0 | 1 
               host-efl-1.22.2 | 1 
            host-mfgtools-0.02 | 1 
                 python3-3.7.3 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

microblazeel | /home/peko/autobuild/instan... | NOK | http://autobuild.buildroot.net/results/906407047c978210e45d711ecfa909d38d90a70d |     
     aarch64 |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/9b28114ac37df64700dc9da0cb267786bfdc240e |     
     sparc64 |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/d6efe6793e7cacbc42ce6c9eae135207a2c3b944 |     
    mips64el |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/de9e0b1a59c80e0ca41adec9f671c9a7a92d7246 |     
         arm |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/7750d292f0f59b6f76ed0cb2b36b3acd03c67e42 |     
       sparc |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/fd428bff118a68b7adb68a98e5e83591c34505a8 |     
       sparc |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/a045aac4e5ecb9ea8c34d0c485488e99df4963e9 |     
     riscv32 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/0bf12508b9fa6d28af1a6d58ea98e62570ae00ec |     
         arm |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/fd7719adda6854584b560b79295d5cf4a4741b4f |     
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/89d987cd81534d59a03f0f6445cda0748d4cc515 |     
      x86_64 |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/bfd54e3c42639200c31481139fa56a25c2cc2ae5 |     
     powerpc |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/1cd87309b3a70b81d1819d0a44b735921b3e60d3 |     
         sh4 |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/97b0f625486913e0a22399388d2b6468152f43a4 |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/d8a1ab2c55f9cde342cd930a51989149c1e61d74 |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/cd2e6fa6f82c7dd052ecce42664931bb66fb07a6 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/07df13167d1cdbef34ef4a15113fbcf0a0d2952f |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/8ef8e56231dac4304776c792c182a5f2a7c949e5 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/c1b41cd9b2c42fc37ffe3f16a6b97eb794d1fff3 |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/c636a2678e512ae911c0ab096a978d30fc75865b |     
        or1k |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/2c9087598ebb53076cf502255a8670591037011f |     
         arc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/0e5e9255f635396c8a2d601ab3d07b611e34ef2a |     
         sh4 |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/0dee7646891ea0a99fdd3c82efcc91522e823679 |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/3064addcfe6e4512957e144b724c38dacc1e1a24 |     
         arm |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/1f0248975a6e9a12c52cae982efea5fed849740b |     
         arc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/e1d34728556e060d1dc419c4ae8a8292ff67c135 |     
         arm |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/d8cc172189746e29df42670c870d34c69888cfc5 |     
        or1k |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/3ffc910821dcf3624961a666dd095cbc4e23ac16 |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/c16ee10ff8fd72b4d8de35ff847bca684e854209 |     
         arm |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/e65cecf3145549ba16cb7ce027272c76cac83d8a |     
         arm |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/d213d925693883bc2754ecafc0d5153f162fc0a6 |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/4b0a44de569b6d50b6abd5016ab4f70c7500cfe1 |     
    mips64el |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/3e4ca862a9be9b1caacdbd2fc935e77a09d67fb4 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/8b034d8d8c1c59782dbcd7b87468f2692987a373 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/9e931ac4aa070e2df08998af948fbc169ebb96f6 |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/2a3f9821a300639b98c9f444ba5f4b734b509ef7 |     
         arm | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/dd99bdd298e1d2642ec9bab0249d1e371a0b74bc |     
       nios2 | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/3b586bad96615f7fb187e98d6a3a2a53841f0544 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/0d31962715e0fb5ee995cab559f8d9e102b26bd1 |     
     sparc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/cdd931bcdecd22371462965aa8b96d902339fdbd |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/9b2445c879fc169c479935d032591fe842f13d19 |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/dd4401b00d83e350f4e56381c8845140501e1419 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/f3d4579be2b4210f59a7d12584de4aea06e24119 |     
 powerpc64le |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/a59fcfe6f1921df0fc22dd4236e34ef8aef298d7 |     
      mipsel |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/643875af92b88e803b74671e8913f8a0d72d098f |     
        i686 |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/437d7c300d0b9c57e5d32107263f95cd8a6b30b0 |     
         arm |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/e85e758725a90f8b124805347ddc724883b6886d |     
      mipsel |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/aedaa6ad227e590442542c4d921b33b4435f9019 |     
         arm |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/8be47159444437b01cd6912f7eedbcdaacf0b949 |     
 powerpc64le |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/29860dae2e395997d50894c0c211b67570889a27 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 2 
                  monkey-1.6.9 | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/fa74ce03e451ace8f84078987a3b36d7eaf496c4 | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/90cb51a5bc79773f3bd98bf96b10498ce19fadb8 | ORPH
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/8cf32e1a5b91e8b29c8933e98ee7b63bfab38c31 |     
     riscv64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/d49e2bf06296181ed2a6dcf6478b49865ea4bf06 |     


-- 
http://autobuild.buildroot.net
