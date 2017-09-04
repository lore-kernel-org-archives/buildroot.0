From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Sep 2017 08:31:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-03
Message-ID: <20170904063122.8F178208D8@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-03
================================

      successes : 165
       failures : 91 
       timeouts : 0  
          TOTAL : 256

Classification of failures by reason
====================================

                openjpeg-2.2.0 | 12
                    gawk-4.1.4 | 11
                 log4cpp-1.1.3 | 10
             util-linux-2.30.1 | 10
                 vim-v8.0.0329 | 10
               ifupdown-0.8.16 | 9 
                 mesa3d-17.1.8 | 7 
                    libcgi-1.1 | 3 
     linux-firmware-legal-info | 3 
                       unknown | 3 
                    efl-1.20.2 | 2 
              libtomcrypt-1.17 | 2 
                libepoxy-1.4.3 | 1 
                moarvm-2017.05 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.25.0 | 1 
                      qt-4.8.7 | 1 
                  stella-5.0.1 | 1 
                  stella-5.0.2 | 1 
               wireshark-2.2.7 | 1 
                      x265-2.5 | 1 


Detail of failures
===================

     powerpc |                     efl-1.20.2 | NOK | http://autobuild.buildroot.net/results/e28b7d8e1afb92fc72331eb460944f9596704eaa |     
     powerpc |                     efl-1.20.2 | NOK | http://autobuild.buildroot.net/results/35706ecb557687ff801bbb686844b4fb72dbf1f5 |     
         arm |                     gawk-4.1.4 | NOK | http://autobuild.buildroot.net/results/1db65973e782bfa61abcbccd3501bfd235f77288 | ORPH
        or1k |                     gawk-4.1.4 | NOK | http://autobuild.buildroot.net/results/7c577616af989d64ace9495adfdc04159ae124e8 | ORPH
     aarch64 |                     gawk-4.1.4 | NOK | http://autobuild.buildroot.net/results/8f6386ddd6e2fbd92e903374ff11f85686648d72 | ORPH
        mips |                     gawk-4.1.4 | NOK | http://autobuild.buildroot.net/results/20fba22551f937b129b4c107a751ad63eee5a1e3 | ORPH
        i686 |                     gawk-4.1.4 | NOK | http://autobuild.buildroot.net/results/2054a99320c7a9bdd9310f36ae55b0ccc2a17160 | ORPH
         arm |                     gawk-4.1.4 | NOK | http://autobuild.buildroot.net/results/61c0114a231d2b30347e58740d3e6f4e2f67dcac | ORPH
    mips64el |                     gawk-4.1.4 | NOK | http://autobuild.buildroot.net/results/e90a134ba1162174476f8f40f6c72fb9de534541 | ORPH
    mips64el |                     gawk-4.1.4 | NOK | http://autobuild.buildroot.net/results/45f94dd0aa3d446fbfced7691fa3950f1dd12f3d | ORPH
    mips64el |                     gawk-4.1.4 | NOK | http://autobuild.buildroot.net/results/4dfea9a1ca7444b06ce36d2ca18b4a32e3d8cd78 | ORPH
    mips64el |                     gawk-4.1.4 | NOK | http://autobuild.buildroot.net/results/5b3425aa3cb5f8939d2ca83f13ade55bc900f11d | ORPH
        i586 |                     gawk-4.1.4 | NOK | http://autobuild.buildroot.net/results/2d3310868c1152ee63771b93ca9bcbd9f2d732db | ORPH
     sparc64 |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/8228b94df56f186b1afc6adf67213d175b00ba2b |     
   powerpc64 |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/fdc6277f272166885b30eda6d4bfac7a5614b4b9 |     
 powerpc64le |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/cbd88c3237f955673ffb61f39f80a513c4383acd |     
      xtensa |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/618d788369eea06c1d22ae462d7445645991b71f |     
      xtensa |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/800eddcd31167bd8e2570bd842d87c4f386ee54b |     
         arc |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/f83766c8ac07cf29ac4fe2b9142850127bcaae9f |     
    mips64el |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/30d92c46ad75484c6d8046a7d2fd15e00f31219c |     
    mips64el |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/50429c0f63a8befff9e20899327b9a8d754d99be |     
      xtensa |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/49fb5f48e35ecc0411433c4dd9342bef1d4ee8f8 |     
        m68k |                     libcgi-1.1 | NOK | http://autobuild.buildroot.net/results/33aa7f62c101413d6baaa5debdbd0523b5669fa2 | ORPH
         arm |                     libcgi-1.1 | NOK | http://autobuild.buildroot.net/results/c166aa1eda9d86083a1aeefd8631ed45dbcb05e7 | ORPH
         arm |                     libcgi-1.1 | NOK | http://autobuild.buildroot.net/results/4382cc080b8d45943a557681fe52ff17ff835447 | ORPH
     sparc64 |                 libepoxy-1.4.3 | NOK | http://autobuild.buildroot.net/results/fec9670527dbe97a6a70d3a767bac24cc5a87004 |     
     powerpc |               libtomcrypt-1.17 | NOK | http://autobuild.buildroot.net/results/deae6e9b42ec2ef5ab99556195b1f1a77f06fdc4 |     
         arm |               libtomcrypt-1.17 | NOK | http://autobuild.buildroot.net/results/6442592b624351423f35703ab24d0a35ad795a2f |     
microblazeel |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/58a4112eb5ee1a3242ad17dd156f8abc977fb96c |     
      x86_64 |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/07c0b749de503707a8ab6a43809da8a9bb888414 |     
      mipsel |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/9f2829aba39415c601d15399758c9482b033c609 |     
        i586 |                  log4cpp-1.1.3 | NOK | http://autobuild.buildroot.net/results/0851887bd32ab932f5961a909cd9504b82329197 |     
      x86_64 |                  log4cpp-1.1.3 | NOK | http://autobuild.buildroot.net/results/93e6f5d95cdc6398d8cb5949d2adc6d877a71b3f |     
 powerpc64le |                  log4cpp-1.1.3 | NOK | http://autobuild.buildroot.net/results/0436a8001afcaf98c0a498a4061e099320fe17fb |     
   powerpc64 |                  log4cpp-1.1.3 | NOK | http://autobuild.buildroot.net/results/98a64edcca8d9608c81676c64445906daa67e67c |     
        m68k |                  log4cpp-1.1.3 | NOK | http://autobuild.buildroot.net/results/4870a0a13997743964c4f8908ce5901d3341c13f |     
      x86_64 |                  log4cpp-1.1.3 | NOK | http://autobuild.buildroot.net/results/9be23d91098d2f3724bb9535333fed8d27ef992a |     
      x86_64 |                  log4cpp-1.1.3 | NOK | http://autobuild.buildroot.net/results/95daabe52c017318a03b0c81f9575924166b48a2 |     
         arm |                  log4cpp-1.1.3 | NOK | http://autobuild.buildroot.net/results/a73344811c3a3851084eb033118d1b3eb7e4e39b |     
         arm |                  log4cpp-1.1.3 | NOK | http://autobuild.buildroot.net/results/addb25544b160887c3bddf64b679b643550cb5a0 |     
         arm |                  log4cpp-1.1.3 | NOK | http://autobuild.buildroot.net/results/b00d9d0962c6a9021e6569af76ab5e02517164ab |     
     powerpc |                  mesa3d-17.1.8 | NOK | http://autobuild.buildroot.net/results/16aed25121fce5940d6007bbf0e6c6e178073cc2 |     
     powerpc |                  mesa3d-17.1.8 | NOK | http://autobuild.buildroot.net/results/f56e84599e98eba37889b987104370674c291207 |     
 powerpc64le |                  mesa3d-17.1.8 | NOK | http://autobuild.buildroot.net/results/6b86d1c13670f40743d5e94148bc495a099fc7bc |     
      xtensa |                  mesa3d-17.1.8 | NOK | http://autobuild.buildroot.net/results/82cac19923fb748658b249413d7eb47787ad3c1e |     
         arm |                  mesa3d-17.1.8 | NOK | http://autobuild.buildroot.net/results/c705ed5328804580e81085bdcaa7dc8134ff305f |     
     aarch64 |                  mesa3d-17.1.8 | NOK | http://autobuild.buildroot.net/results/411bcc40576e97ff52583ce282a070cddc44de2c |     
         arm |                  mesa3d-17.1.8 | NOK | http://autobuild.buildroot.net/results/1a5536d218dacd605131329c01abcce08ebe229f |     
     powerpc |                 moarvm-2017.05 | NOK | http://autobuild.buildroot.net/results/37372373ce3116ca8fa0ddd15814a7469bbb7bbe |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/848d6d6e924e70c10d479821a03100c2175a03fe |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/c699f8f6eb643efb186af0c9db2273b348aa94a6 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/5c3ded1a1553d8e326f0ef1fb313ac60d5c50a03 |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/b465b0f255598e469929605a331d18443c5fa797 |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/704d2215bef80a3c9f8e51b6682dc332c7a5a42e |     
         sh4 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/8bd16d2f1b76bf42e4b00bb905dcfe870f58f368 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/d485ad02a037dc773de78bed39bfc3675e0a83e7 |     
microblazeel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/a0f185d7c34dd45ed585651c27999c3d2eac3286 |     
      mipsel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/be352244924eaa9cdc9260120d724a33eac2cfaa |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/820b6932b5c169413a438ac6a662d742040e44d8 |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/acf296b751c8d977d62aba5afb86e9e8e0d2223d |     
        i686 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/3f586bfeeaa5939d21ec7e5334fb91ccae766085 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/87ab30ea6f4d9a7d6cbd555968f70de209092776 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/16af113374784d8151d88063c2deb315427e5f26 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5bd86bdd679af869f69be28cf064b4c8d94a144d | ORPH
         arm |                   stella-5.0.1 | NOK | http://autobuild.buildroot.net/results/64aff8a3e3916d7e38018ae73b222428828519ac |     
         sh4 |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/4b68a5069b5adc074f0eac14d5c243dc6ef3cc18 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/5fa2438f23792c9155760ff30be65315a397b5c9 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/173e5151b8fc626e1e20c200a787e159f57ac8d6 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/6803b6efd0b8c2b14c1df4afdb4bcbad41792330 |     
     powerpc |              util-linux-2.30.1 | NOK | http://autobuild.buildroot.net/results/eb282daace6a5a6a9a041768e7ffd3fd60a783a2 |     
    mips64el |              util-linux-2.30.1 | NOK | http://autobuild.buildroot.net/results/87794cc0aaff6e09e88a2cb92db41a0da9e8c7dc |     
    mips64el |              util-linux-2.30.1 | NOK | http://autobuild.buildroot.net/results/25ed6f0f7e65d2830c25239955cf9d206b7a6e0e |     
     sparc64 |              util-linux-2.30.1 | NOK | http://autobuild.buildroot.net/results/dc39ab7ae59654564f7082b382eeca27cfc27ab2 |     
    mips64el |              util-linux-2.30.1 | NOK | http://autobuild.buildroot.net/results/d39ac31e84634211d350e346983a65533b32710b |     
      x86_64 |              util-linux-2.30.1 | NOK | http://autobuild.buildroot.net/results/9119287a426e30998ed492c691efc88961c98afc |     
        i586 |              util-linux-2.30.1 | NOK | http://autobuild.buildroot.net/results/5181aee3b505d5a90f8e33117c1b833bd04c9a31 |     
       sparc |              util-linux-2.30.1 | NOK | http://autobuild.buildroot.net/results/3381a49d17aa0d4b9711cbb36a5d7b563a8ae08f |     
        i686 |              util-linux-2.30.1 | NOK | http://autobuild.buildroot.net/results/d38a8706bf6d31745b10a6dfe8119b80f69b7b04 |     
         arm |              util-linux-2.30.1 | NOK | http://autobuild.buildroot.net/results/c0382a3afbe8e68831978d7c3dbef33bb22efc84 |     
         arm |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/27482a3ce956a2f6475c57651069ad3a30cf363d | ORPH
         arm |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/59f8dffc762fab4b3c348019a47d3502e72a753c | ORPH
         arm |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/df862e56d6e9d81de237d5f10768b444ac96f1a5 | ORPH
       sparc |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/0b3268203f443fb5a92ca7c8de8b6ee1e8e82753 | ORPH
microblazeel |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/312b50f522fd9908979b0c5d4d446dabda2163f7 | ORPH
     aarch64 |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/02c03ec099417e5a10c8b8a44d518f6e1eada8fe | ORPH
     aarch64 |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/e6d3e4b6b98e4a78abd5fc1054d3f6edacb90acf | ORPH
     aarch64 |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/16d384a0183d477646ac7692feb65f00dde7d068 | ORPH
         arm |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/625ec59b94135a0979efeda4d2d3ec847806815d | ORPH
         arc |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/10772a710a667cb9e46a606caacafca3c326c93c | ORPH
        i686 |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/fb07b1781203d9617ef24398868e59bb22a7f1e3 |     
         arm |                       x265-2.5 | NOK | http://autobuild.buildroot.net/results/8c592ab748cf3d338e762188cbbc894f1bad68ec |     

-- 
http://autobuild.buildroot.net
