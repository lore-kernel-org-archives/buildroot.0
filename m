From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Jul 2017 08:31:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-11
Message-ID: <20170712063121.9218721DF5@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-11
================================

      successes : 172
       failures : 84 
       timeouts : 5  
          TOTAL : 261

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 30
                  lshw-B.02.18 | 5 
                  cppcms-1.0.5 | 4 
                   pcre2-10.23 | 4 
                 sngrep-v1.4.3 | 4 
    azure-iot-sdk-c-2017-06-30 | 3 
             host-aespipe-2.4d | 3 
           python-pynacl-1.0.1 | 3 
dvb-apps-3d43b280298c39a67d... | 2 
                     efivar-30 | 2 
                    git-2.13.0 | 2 
                   httping-2.5 | 2 
        ltp-testsuite-20170516 | 2 
make: *** wait: No child pr... | 2 
                  nginx-1.12.0 | 2 
       python-smbus-cffi-0.5.1 | 2 
                  cc-tool-0.26 | 1 
                    efl-1.19.1 | 1 
                     gpsd-3.16 | 1 
              host-cmake-3.8.2 | 1 
          host-util-linux-2.30 | 1 
                 jack2-v1.9.10 | 1 
                  libcdio-0.94 | 1 
             lttng-tools-2.9.5 | 1 
make[1]: *** wait: No child... | 1 
                    norm-1.5r6 | 1 
                     pound-2.7 | 1 
               qt5webkit-5.8.0 | 1 
               skalibs-2.5.1.1 | 1 
                   strace-4.17 | 1 
                   trinity-1.7 | 1 
                  whois-5.2.14 | 1 
               wireshark-2.2.7 | 1 


Detail of failures
===================

      xtensa |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/f5cefd635962dffd96798e5ca8a3c983c170e269 |     
         arm |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/54b3f067670bf1638b5dca3d6dd66581ab298504 |     
      x86_64 |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/9f166a57a2e3a4832803b989c02e5a2c98a223aa |     
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/b74d71d2a38352699a983491ae5544941f67f10b |     
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/5691e50b13290b97d0c1931e4944d28445f4d728 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/316b34e20111358a4a3e57a01846f5e691386557 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/16f642a915d71424345c91012acc1ed2e98bc8e3 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/62f3f9dab69f88f54e00e09bc04a5f92c382eee1 | ORPH
      x86_64 | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/64b5a849fe5b60eaa86c354cd07d8ea4a03b7ec8 |     
        m68k | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/81e155c3cc7df8df135329087bdcd6c7b63f962d |     
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/d8463d10aaacbbb9c9576115e49b4249001f2648 |     
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/e2158452d9c2e5ee195f7836cec4b33a848fa62a |     
         arm |                     efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/69a32fa1191c0721ff605f64a98bf33b414a1728 |     
      xtensa |                     git-2.13.0 | NOK | http://autobuild.buildroot.net/results/fc6212ffbebf0463bd85e1e0f4893b7b93fede39 |     
         arm |                     git-2.13.0 | NOK | http://autobuild.buildroot.net/results/153b17959847ec2079883c087cee27afbdf9571e |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/8ea0fe8ee09c42ac87c4df4abc09bfdd8d42f473 |     
      x86_64 |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/1575030fe7fec2bd4888eede4aa1c7071c3723bc | ORPH
         arm |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/622bbaeb445577062ba595aed891c3aab0f79540 | ORPH
         arm |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/05693cf1ef769dc8cfde28cbb6d04321cc4a5dc3 | ORPH
      xtensa |               host-cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/12549057b2fcaad137df5abc3873bb19afa5ce0a |     
    mips64el |           host-util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/5209fdd716da8bc52a2895ee438e700f44c8473b |     
         arm |                    httping-2.5 | NOK | http://autobuild.buildroot.net/results/8a69659afa21f467ca5de7915363cebf0fc7aff2 |     
        bfin |                    httping-2.5 | NOK | http://autobuild.buildroot.net/results/6e5379d40fab1ab8142a6992e5d8c92bae535585 |     
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/1eec57bd12c45332944d2ee5f7dac57184449013 |     
microblazeel |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/4ab672c5363c4c17c9c63b89be44b5df67d0e2c9 |     
    mips64el |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/1d7af211f2d69792657cdfd000b4e7e441aa3ef3 |     
   powerpc64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/694cdcc5f2564cc2a03be3e5066d83b799690fac |     
     aarch64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/94f0767e0025086b2ca5f72fec40174be12c4cc5 |     
   powerpc64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/a85d8754933d32379744fbf74c1220961ee8d793 |     
      mipsel |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/07e8ee48b912ba8e7347af68f7cc128904f7299d |     
         arc |         ltp-testsuite-20170516 | NOK | http://autobuild.buildroot.net/results/02fb4ffb240c32183714497338c5954001f11aa5 |     
         arc |         ltp-testsuite-20170516 | NOK | http://autobuild.buildroot.net/results/68669d2a7ce50657d8d0b83bd209317b8a7e1430 |     
        i586 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/22b661cb05229cf4d77d204212f1e1d5016f5b65 |     
    mips64el | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/334cfc8b05321cc09cac7f41ae46b7ad3aa41ae1 |     
       nios2 | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/0038273980dbc3e32e0b52c8e3724e6355c4fe1f |     
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/0400d69f159e1c73c160f29bdb3ef743a848bd4d |     
    mips64el |                   nginx-1.12.0 | NOK | http://autobuild.buildroot.net/results/cea64e30e98543e10c8819f6337babfec6d7ac0f |     
      x86_64 |                   nginx-1.12.0 | NOK | http://autobuild.buildroot.net/results/d3966f0731ae0aae694295f3065d7f3907a4f389 |     
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/d90d1d1eec36991f0419ba3851d78181d08d0a5e |     
        m68k |                    pcre2-10.23 | NOK | http://autobuild.buildroot.net/results/84d64333820c237b84d0d8e50a0792f7cfac2e0b |     
        bfin |                    pcre2-10.23 | NOK | http://autobuild.buildroot.net/results/fccbcdc259bc01a69987e56db8faa465421a4ddd |     
        bfin |                    pcre2-10.23 | NOK | http://autobuild.buildroot.net/results/7273eb766d95d084127816202f7cabb1238e4f43 |     
         arm |                    pcre2-10.23 | NOK | http://autobuild.buildroot.net/results/656898283b4003dadc09ffb55a996f04ad5da2a1 |     
microblazeel |                      pound-2.7 | NOK | http://autobuild.buildroot.net/results/96e465a8d78426ad89cd04843f678b6e8ee5b5a7 |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/89a56518e5c2bf29a69326913c1f6d32091d4eda |     
         sh4 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/954edf3188bc1b215e2a64c53e3a6902eefee7c1 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/952659435e846e242e5848abc00ba91f43f66fe0 |     
       sparc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/be373441f9c151cea9af057b0462652f407b4e65 |     
microblazeel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ae3af86b8afe5685f4faa4b0752dbe276f65091c |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/2a2aa0adee05173e606f6c14fad40c9b8f3a5c66 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/232aa6bd435c19b98244250ea5d83a9d04223939 |     
microblazeel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/cde98b2c474deeaf1c3d4907fdfb09bcc9e76f2c |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ab44b59219b9c754c8e1c97ef9c274bdaf213dee |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a48799f095a01a84d357893c99752da0c9e6f98c |     
 powerpc64le |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/73250f5f25a0749db951bba1b364a9a6868221b9 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/18eecc20e19fc6cdab3de700a15251a933beac52 |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/37e251017a5ce097d26b56945142fd50ccdd7f71 |     
 powerpc64le |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f117cc2bbc190e8c54cdbcecafa24d7a66c78270 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f1ee6b9562fb9ebdc5ba7bfc9bb90476a0bacf9a |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/7fde7e3de642fbfe33d2528876c8d9c8564a8f9d |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/07030990a51b58d51422f113b0bcc0a85ae173c3 |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/fc146860e9eac0c847747e626bc8cb3d4c2d4ff1 |     
 powerpc64le |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4fa86da499f72172521dc5183f26fb10270a4cde |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/55f3b826f988ffba03375619f08aa43f36d0b8fc |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1b79de4146dd76a8c5696d9942aaa05f8fb32f4f |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/210a4804914e976b3306d83153caad824bb4cba9 |     
        or1k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3d5d364b4f6cc6fb7d15129d50198067e3d03ff5 |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/2566b1bd97a1d7dc8fc2a68fd2d5215c26577bae |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ff2d0fdc313c0c504da52d9edc55b386038258f8 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/5b050383c0a5f39a1445fade528f2015aa349756 |     
        or1k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/70ba6194ac77d4ea1278e5059ca2678e21ef5981 |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3cccc8f29a87f4478b638e2f93b64a5490ec89d7 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/2aa047c4af8ad12415dc14010c2d9dbec32bc3f8 |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a1d3034a5f418bdf8cdda925d59568af4080e3d6 |     
    mips64el |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/a7f9b8ae9ff07693ebfe20cd4e6aaf3bc9417d38 |     
      x86_64 |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/0307bf3c9dfa3c39134533ea5d46a12630ad4635 |     
       nios2 |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/13d1f01aa2a63e963c074f29b8500f6f9c55ba09 |     
      xtensa |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/b8d36b68ee2905ee4195522fed346f618b686959 |     
        i686 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/9e8f63f4d74c4f990a1fae702c6840c9f9140e94 |     
         arm |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/15aeb113c349e0eef3d7e00403967334bdaf798a |     
      x86_64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/ad7f20f55645b71cb44aa816200e8c31329bb351 |     
        bfin |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/61c09a8e39ade4b2a5b8b76d19317a2c5303f295 |     
        or1k |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/d29ed339c72901b31b6737fe4ce8bae2e161aa47 |     
        or1k |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/9caa33d97fba319184cef3dd03b06f20f458b3e1 |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/2f20426d782043d46779af8a92d8ec55c22ad98c |     
         arc |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/0d334ad4efaf4130eef566bdcf479407df2d0d6a | ORPH
      mipsel |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/a27fe4d8e0260bf4c265cc0276cf808c5d1a93da |     
        m68k |                   whois-5.2.14 | NOK | http://autobuild.buildroot.net/results/543e36ca798576f73360fb1c858b540a9b5fc4d7 |     
     aarch64 |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/2a5c6cd30a93435be16ca7e6d2f923900fef85e0 |     

-- 
http://autobuild.buildroot.net
