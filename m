From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Mar 2018 08:00:06 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-21
Message-ID: <20180322070006.59BB2208C3@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-21
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   2 |   0 |  29 |
      master | 205 | 100 |   0 | 305 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

             bluez5_utils-5.48 | 1 
                 mplayer-1.3.0 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/ef7bfbbcfcab9c8a656b863a206663bdf9e96880 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ac338a07adf9e3e7697661f74c28fb5aa34dac13 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                tpm2-tss-1.4.0 | 32
              tpm2-tools-3.0.3 | 13
               xfsprogs-4.15.1 | 10
              tpm2-abrmd-1.3.0 | 7 
                    liblo-0.29 | 5 
                  flashrom-1.0 | 4 
                  host-go-1.10 | 4 
                  udftools-2.0 | 3 
            ecryptfs-utils-111 | 2 
           libfreeimage-3.17.0 | 2 
               libglib2-2.54.2 | 2 
                     php-7.2.3 | 2 
            safeclib-v03032018 | 2 
                       unknown | 2 
             bluez5_utils-5.49 | 1 
                  cc-tool-0.26 | 1 
              keepalived-1.4.1 | 1 
                 leveldb-v1.20 | 1 
                 mplayer-1.3.0 | 1 
                  multicat-2.1 | 1 
open-plc-utils-1be781d1ea81... | 1 
                pinentry-1.0.0 | 1 
           python-numpy-1.13.3 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/0fff0961cfac08c72ec86b678e4d013e71a1ee7f |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/dd5a95faf512ba720dec4f799de14c50c0bf9f70 |     
         arm |             ecryptfs-utils-111 | NOK | http://autobuild.buildroot.net/results/241aa3fff1cc041cb38e688a7f97d031938f3b97 |     
         arm |             ecryptfs-utils-111 | NOK | http://autobuild.buildroot.net/results/9f235f1892064ac08b9f7a3b81ffd89e9d46c5b2 |     
        i686 |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/46dbaa0ea23a20d06976192800d704f72314de56 |     
        i586 |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/0e196570207e459c3440d50cecf0032eee6edfc2 |     
        i686 |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/fb8509bf9cf03933e45355fd9a6c3fa53d33c44f |     
        i686 |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/ee66e5ead70e73f1d2dae1c5ba31ccf054fe15a7 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/67cdc9fe32d1f779e03c8c01178d4e665ee4f2d8 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/c97706514c9e39967990863025cc2b35a88144dc | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/cb936efdfb5c4d7e698a596be7464c7f250c9a57 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/7281abcd3775da59569b51dcac727c20c4c3d262 | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/2246ddcbe12bffbd3a30d3933d58ffe9968194d5 |     
      x86_64 |                  leveldb-v1.20 | NOK | http://autobuild.buildroot.net/results/0d0b8025cba71a29d074c51a1048744910f82bce |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/f5dc68d2eaf14b92735e33e56f38d58ec07ece4b |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/ec1229d510afbcffd51aeb1757385180a4c1eff2 |     
     powerpc |                libglib2-2.54.2 | NOK | http://autobuild.buildroot.net/results/786859fccc477de1519d85d8a180626bb8ebe062 | ORPH
     powerpc |                libglib2-2.54.2 | NOK | http://autobuild.buildroot.net/results/df6518f331c16b477c6e934914d0e56dc102c228 | ORPH
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/3ca838f7888fb9b31d1a17249a3e95ba7280cd6a | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/f937824d34bca1a00f095f1c6bfc28d559ddd6ea | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/b65e0997f37077a30cf4d84fea974ae226002a1e | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/e51c039ae4b846e0028773e2c7816c8cb9db631c | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/cf8f45ce29786b6e93578b666bde06d82f33657c | ORPH
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/0a015c9552590471c6beb6f87912adf35e811eb4 |     
         arm |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/397d1841e285cc3c58eec376944163f7d86617ed | ORPH
         arm | open-plc-utils-1be781d1ea81... | NOK | http://autobuild.buildroot.net/results/d37aeffc90df7e47e71b67be0505cfbea1ddae82 |     
    mips64el |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/5e7e3d345d748a67b24dbc2814ccb7e5dc0049c2 | ORPH
      xtensa |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/e7ce98a91910d566f7e5363ebd796514fff456e7 | ORPH
       sparc |                 pinentry-1.0.0 | NOK | http://autobuild.buildroot.net/results/f89faa7ade78a42fd50505459031fe2aa4e6464d |     
         arm |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/ce140d58efdd480a45da83e8be1a5a879dd8945a |     
microblazeel |             safeclib-v03032018 | NOK | http://autobuild.buildroot.net/results/21254dc0614588ba426ada7bf152b1190b45f1a1 |     
microblazeel |             safeclib-v03032018 | NOK | http://autobuild.buildroot.net/results/0807ef1392bc4c8823dc50482328211f4ae624b8 |     
      xtensa |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/83ad1f33f523321f841e70d2d8cf5ce861dee217 |     
      xtensa |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/cef047751534fef23d1022e9a276424bc84bf461 |     
      xtensa |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/6048355337804f7841dffa1655f44b9f6db56314 |     
      xtensa |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/d934a2ea90e7bf1c7b93dbb367998abab536daf4 |     
         arm |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/c0daaf37b8d1515d62d2441ba6aa57125437e191 |     
microblazeel |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/9482ea5554938865e0061dcbdcf3c2c918b96954 |     
         arm |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/282a8b6769f19f0a40089207bc54e7302663751f |     
         arm |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/84e27392844b49f6975de42069f73c6649c6039a |     
    mips64el |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/6f6873aa4a1f64d51c3cbbd515edf45cab42a3c3 |     
         arm |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/4a8118cd150e0088ca8ba1bf9788de1205ebc0c6 |     
    mips64el |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/289d493dfdbea47d12d8b4aa606443648766085b |     
    mips64el |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/e5091cd635a564b2d2735b4c6061e2727cf07730 |     
    mips64el |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/08897aec99a76757f99bebd3d61dbc59539f81db |     
         arm |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/f4b1baa30ddd67139e15fe2f3adb090579f26dd1 |     
         arm |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/ab6d3ad450e38abfa54b56e2b2243eb4cf5933a3 |     
     powerpc |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/9f0b49251515e4c4c4ce0ff07ee1d6670b81192a |     
     powerpc |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/fc274074c3cee5796f9c8f70b10cb0c567721ac3 |     
    mips64el |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/0357e74a73df34c0ffb5da68635252fda9ebcab9 |     
        mips |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/9c5edf28f31ec01c2007835b8b13ca47fd15acc1 |     
    mips64el |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/2c83e774acacb7980d1dbf6cd7de075849eee8ce |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/fe0e7ee299b96c620bce0ef58a15100a50985715 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/f98749311c5a4338f5fbd6d29c9ca29ac6c24abd |     
    mips64el |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/4112a001038eb5e04c67c7b5c79280813d196911 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/451fcf7e36ea8774967b84279abb89ffb0fd6923 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/09e8b3b85d7113d60e8967a2d41a6aea8f8197c0 |     
        or1k |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/8e1181836249105be28f04a59cf6d31afcea91d7 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/49151df111ad3d03c70551e4516c3d3b36e12d70 |     
      x86_64 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/2e4c70f2f1239eb19235ae04a936a6492daf316d |     
        bfin |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/42d625c579a8a16fb0c0a3df441ea186c3d52b9a |     
      mipsel |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/b0af881e080c4fcc6094489c037ee853fdf42869 |     
     powerpc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/0909d94af3f9589dd6b8897e2501c05b421262c4 |     
    mips64el |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/2fd0ee29c0b28cb1fee1b43433ab8373f49ca397 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/3fa19441fd2594b064c8ff759df8849705100a65 |     
        or1k |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/8675d2aa8f1e8e568a42bc0dbfae8f3721e86796 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/786de50b53fa9a325c92a5d48f3928082eff0045 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/a575b340f7cc562c1b87eb31d4304131b52698a7 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/0b1d50d9e266d889d7e848275ebfbce45ccb419d |     
      mipsel |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/d632b0e1efbb5e133dfb6595554badea9e31c492 |     
        or1k |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/0c95459bfa82048d7e99661cf5f2d6d393179090 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/17f30a29bdad2dae5983d3d951a94f6f21a4d833 |     
       sparc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/bd494dc69fb0da46065f10a3cd8a4cab0bcbcc9b |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/bbd68f52781da735e983b1260de5b804787374b1 |     
        m68k |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/b397e44cd17b3d576cc55f02d5463e9c14743907 |     
    mips64el |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/40ed7a3b519c18102df515b5c4b993ed9a488236 |     
        i686 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/e5fc04c2ded86e03eb174a89845a50f52e407d48 |     
       sparc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/95a7c14da225d9e42545ee7a155f461303c62aa6 |     
microblazeel |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/865bdab9681f97a1fdd7abaa84b4630785dc7572 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/25ebda7a13afa4790ad28018f42c46a795f3c284 |     
       sparc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/1bc081b78c625f13327c733fc734e36fe28ecc2a |     
    mips64el |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/273108e2798155464109b9fb4d16884e7d0f9ab3 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/f677d340cd42ea7242d4102fbb5fa6091a05e8ef |     
    mips64el |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/ae15b625260801b494bbfa541ef86edcdbaedfe0 |     
     sparc64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/c1832c94f7092f17866dae570489e283da7d9214 |     
microblazeel |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/4db5d5a0c18e669bcd6cc785335cdc4a5d5ea1a5 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/c9d5563c54f49e08c87a408c7c572d90d7a52ceb |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/8b91328ae62e35e64c3f668df51cce66eea12be9 |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/2535b33b3bc292780253f7a764d953b078642867 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/69c8859fed816eda628d9f37939a20d110a52d48 |     
      x86_64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/91c8145c92fa416347d4a8d08b15c745bb6b9964 | ORPH
microblazeel |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/769b89cf04f9403524fb73ce6b6fb03f7d89f44d | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/d8fcc05a015f5a6cb4ae109f70436c11fff3da18 | ORPH
      xtensa |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/0bbba71231e352ea35e14f04683f7b3bdca1b6e8 | ORPH
     powerpc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/46768402ee8f3ddd7f8ea42bcdeb5cf481f2bfa8 | ORPH
      x86_64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/94eb5af15df27341ee4959a2d62c0adb7d54d1ca | ORPH
      mipsel |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/15a2c1171aace374443fcd259dae72f198951575 | ORPH
      x86_64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/4eac1be3aaaa7b533d3a994d856f9a236ba2e15b | ORPH
      xtensa |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/2bb8777a612f5c93d4167618a6e394b6ab0a114e | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/7573a8aac4407a84d6cb5b40dba46fff6401bfaf | ORPH


-- 
http://autobuild.buildroot.net
