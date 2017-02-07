From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  7 Feb 2017 08:29:45 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-06
Message-ID: <20170207072945.6948620CD6@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-06
================================

      successes : 141
       failures : 66 
       timeouts : 0  
          TOTAL : 207

Classification of failures by reason
====================================

                  libcec-4.0.2 | 15
                    ruby-2.4.0 | 12
         libevent-2.1.8-stable | 4 
               bctoolbox-0.4.0 | 3 
           imagemagick-7.0.4-6 | 3 
               openswan-2.6.46 | 3 
               target-finalize | 3 
                    mpd-0.20.4 | 2 
                 openssh-7.4p1 | 2 
               tcpreplay-4.1.2 | 2 
                 wavpack-5.1.0 | 2 
         docker-engine-v1.12.6 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                    lftp-4.7.4 | 1 
                    libiio-0.7 | 1 
                 libraw-0.17.1 | 1 
             libsidplay2-2.1.1 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.23.0 | 1 
                  nodejs-6.9.4 | 1 
               pulseview-0.3.0 | 1 
                  samba4-4.5.5 | 1 
                 sngrep-v1.4.2 | 1 
                     wget-1.19 | 1 
               wireshark-2.2.4 | 1 
                     xen-4.7.1 | 1 


Detail of failures
===================

         arm |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/06b81a678cf8d40cac16d10835185d19ed237840
         arm |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/78d77ae39a5af486de76fac750be86bdb24a7fa7
        i586 |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/3179761666d6d47e5063ea8af9bc2ca2b5c4b7b4
         arm |          docker-engine-v1.12.6 | NOK | http://autobuild.buildroot.net/results/a800d52848a2b7e790e0f69a5a0fcd38baba7bd0
        i686 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/366dc2b7358556e9ccb637ea043fca4922293453
      x86_64 |            imagemagick-7.0.4-6 | NOK | http://autobuild.buildroot.net/results/d20eecec8e7b947759185f77a6c8e610dd7393f3
      x86_64 |            imagemagick-7.0.4-6 | NOK | http://autobuild.buildroot.net/results/d2c753ca6e606c06caedf90d229217b4075c97ec
    mips64el |            imagemagick-7.0.4-6 | NOK | http://autobuild.buildroot.net/results/ee15efa8ae3f95244980810155ff7ba9f885a59d
         arm |                     lftp-4.7.4 | NOK | http://autobuild.buildroot.net/results/02570aadbf84809e194e4bcc8f5bdfa26b77d849
    mips64el |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/dc80a94fbd7147927691a20398703f479109ceed
         arm |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/140c5c4cb70f833292ec1060cceedbfcc0df44b3
      x86_64 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/0d4d7fefc86269e825c6cc842077daccf9b4f7ee
        mips |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/7a3590eb20b4416cff0ee0e7ec56eb714194fec4
microblazeel |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/37faed04d49b936fbdcd52a68a24634e0afb0c3e
      mipsel |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/7003798bbb8dbed72d651863149490221583057b
         arm |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/052b29efb3e5b208003ea40aa6499297bbbb7ad4
      mipsel |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/cc819175796107fb7061010f966e30302fbe2589
         sh4 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/b5d7984a3b3e088be2f683079f1fc37080bf428c
     powerpc |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/0955138c023946f83fe2d54475d7c7e18f3d4bd2
         arm |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/c83a6637c26e9d4500a2b5760b681b7d4fc6bedd
       sparc |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/d0d7d10fde48f784f7728c94b72212ec3e1af006
 powerpc64le |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/172e280d66ed5295c57b83d36ff6aea2868e621a
        bfin |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/d8d7a0bf17fc9af77df73858bacdbea037630e7b
        m68k |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/e00cbdfca0e0cda3dafcdd65a09048475eaeb004
       sparc |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/14e0c5216112f6fe3ac5fdeee87bf990782e6959
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/d4306509976fac962174c2cc3203946df1d3ba22
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/322058bb4cf5feecf1d59ddde39f38b2d72ce128
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/4ce87d5184504aecd8ff0984acfe956ae81daf1c
         arc |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/28f462e9cfeb9ff1da7348c518555ef3ca5b990e
        i686 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/c42685d32831d7e38b34590949bcd74bb5c4704f
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/05700a253bbae4767f293531da3b83bf5c9ce6fa
         arc |                     mpd-0.20.4 | NOK | http://autobuild.buildroot.net/results/046140e022e2513baf9c7ee222b6f942bffa8f1e
         arc |                     mpd-0.20.4 | NOK | http://autobuild.buildroot.net/results/f6e88f3491f7a2f905031c0f0039f4e7a29885fe
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/f60873aa44cf0d591511816d14738e5237357a0d
   powerpc64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/efb3d88900fb982d3e1777aa27c275559545f491
         arm |                   nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/14d5c027dd47b73d7cd92129bb8fa7b60c8b5306
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/ed608aecca57bf367fc672d2f34643eeed5113f3
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/c7ceda809ded2ba5d0444c00b95ef0eb5161a737
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/511d078594b331fbb4baecc5333c3c62cb03d57c
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/a33d653fc208374d8561172c6b71362b1ea65671
     powerpc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/2f8113925faf3917a40059162a336db9c98de67c
        i686 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/50cba097e4583b5c8ca3e6c93ac14f1b4f48f499
         arm |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/64b67da00a1d0c87e199f84c67a486917fb92cb5
    mips64el |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/fdf293afbeb5f87382eb645842805fa2884ca84c
      mipsel |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/03348499efec3d3654d30a97521c457b8dd99b0c
       sparc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/ca3b9e0f75ce626bbdb7981e5cf7db56fbf7d325
        i686 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/e856ff6ef733ceca4507a03ebc015a2aa2fd2f99
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/cb8c904a88bbdc7136d5c9021e87a85fddff4ea0
     powerpc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/6a2487cbdea009f0aaf411f0ed912b65fcc85e05
       sparc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/4c2240b11431ff872862da9a1f1acc217fcd7faf
      x86_64 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/f79cb03809c6104c29b1342e4e6c93aa2d5f92c2
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/c894472a01f14dc5c84857a7579895940228cd65
    mips64el |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/f34dc20749c6f6d12c51eddf3ee6c2ef41d7c13d
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/f02ffad591ea6900e50ac5cfacf6256229a0ee14
         arc |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/79a299acbb55fdeef913379a2b69b19ebb44407d
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/34fee51a552060cfb3d04e9136aa70d63e5ab053
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/be69f8415bd2a44bf6504e8b9013ded1f4537847
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/b2d43dd3c52cc9f586009a10a40f97b07548322d
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/44719735614b14d6cff4fd1a6d87d553ebb3294b
      x86_64 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/fcc524689758d71b008b8e8e253c67ea14028f8f
        i586 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/720ab66b9c35ad79ec9dcece5df291ee39e0a732
         arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/90550abcac31fa6c22d307d27f0ed7e4b79c12e3
     powerpc |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/9bf7efae6869aa5cc83fb2839ecc194ecbbe3313
      x86_64 |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/1eb0b994d9778006ee4b3c68bed47beaeca4514b
         arm |                wireshark-2.2.4 | NOK | http://autobuild.buildroot.net/results/5745e72ec20c8dbe9799dc691fe41d838639705d
         arm |                      xen-4.7.1 | NOK | http://autobuild.buildroot.net/results/90263be605124e68517e2c4fc02e63bdbf7c7641

-- 
http://autobuild.buildroot.net
