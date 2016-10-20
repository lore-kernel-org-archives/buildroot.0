From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 08:30:32 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-19
Message-ID: <20161020063032.D4FED1026BC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-19
================================

      successes : 111
       failures : 65 
       timeouts : 3  
          TOTAL : 179

Classification of failures by reason
====================================

                    pppd-2.4.7 | 10
             util-linux-2.28.2 | 6 
czmq-5205ec201e97c3a652c17e... | 3 
                  guile-2.0.13 | 3 
          libmicrohttpd-0.9.50 | 3 
             rabbitmq-c-v0.8.0 | 3 
kvm-unit-tests-0b04ed061003... | 2 
               libbluray-0.9.3 | 2 
                 libnss-3.27.1 | 2 
                    mosh-1.2.6 | 2 
net-tools-3f170bff115303e92... | 2 
                privoxy-3.0.26 | 2 
              python-pyqt5-5.7 | 2 
                     vlc-2.2.4 | 2 
zyre-1d949e4bf79b694ea883c3... | 2 
             berkeleydb-5.3.28 | 1 
                  bustle-0.4.3 | 1 
                ipmiutil-2.9.9 | 1 
                 jack2-v1.9.10 | 1 
                  kexec-2.0.13 | 1 
      kismet-Kismet-2014-02-R1 | 1 
                    lftp-4.7.3 | 1 
               libbdplus-0.1.2 | 1 
libcec-2c675dac48387c48c7f4... | 1 
                  libffi-3.2.1 | 1 
                libmad-0.15.1b | 1 
make[1]: *** [libavfilter/a... | 1 
make[1]: *** [libavfilter/s... | 1 
                    mpfr-3.1.5 | 1 
                    mpv-0.20.0 | 1 
                p11-kit-0.23.2 | 1 
                  psmisc-22.21 | 1 
                    quota-4.01 | 1 
          sane-backends-1.0.25 | 1 
               wireshark-2.2.1 | 1 
                     xen-4.7.0 | 1 
zbar-854a5d97059e395807091a... | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1a03301e0dfb220dd04fb2ebd8ba6fe1bc9238f2
         arm |                   bustle-0.4.3 | NOK | http://autobuild.buildroot.net/results/29a0fbb09a16fded0638c05e4beb8e359a39eeb3
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/fcc48b9c279d65f2d5f14218614d12c09d0487ef
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/b2ffb7ae94bd27435016faaf2a6ae78883204861
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/593b1499ffcaa206e8174ebe45c9b9f034022eb3
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/d4e9a1199aa472d016e9d331ede062b47a4bb47c
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/6bb3128aa05e379548c8c1cf4ce9f550e325bd25
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/c2a2a580e7a7dd711d2aacbbb50cb6b17bfd90c4
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/1c127e3f573badcb11dc023407b1463f1d3062d5
microblazeel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/f71b7877f4124fe57e372338738e6385f22ee067
         arm |                   kexec-2.0.13 | NOK | http://autobuild.buildroot.net/results/01985a6b880a6eda26788ea83652fb2da4a7fa3c
    mips64el |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/254d5e88b26f3f5407f36050af917024435a20ce
         arm | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/ee562ee69fabc7829fae42f74ff14b3733a8f1b9
      x86_64 | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/45d15e7d1face28022e4b8139a5c3c11b0c9aa9d
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/ae510aeff0a3f1c982097877e0d4bbbe90c1055b
        m68k |                libbdplus-0.1.2 | NOK | http://autobuild.buildroot.net/results/609b99236b6d3e2bce95fa9d1cbc9343c47d4f15
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/b1e67cf14b5de5f6d56b3f80898e9206602d1a0d
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/be8aab7781a96d40a8d80f676fd7cbbeb51e850e
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/4d1758f2705152c52961da8b42da07501dd25a34
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/d5828cc67d2b4064b27224a65f35e1ad09c324ce
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/2df96179982065da99812000e5c0bba802cf6fc6
         arm |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/e823ad02cc67337175a325ce824baf7bcc8373fc
         arm |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/c019904ab7e9750d8119012a1c8ebda477a04241
         arm |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/16153473d41ee736a481c7aedb81f2ecf5367b8f
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/fefc8670e9527d867c3cfcff6a21db2c088eb73f
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/e5da8fa0c334f9564b06697724f61e0cbe4c5a96
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/2382a92c2a7c0c00a347a056ef2ab424d3eaf8d5
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/e17f508db74cd0c07a7517b9a1311201b96f6510
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/7107b715a47c8baa3fc29015a6d32ff881865564
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/1fe025ae29751a0922c16945a52368a4dc1ebc19
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/d15352a938a0b64c70ad86ffbc87aea66da3e621
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/aa39e2d8e2610d0e3ada0cb7f3a17f9a0b7afcd0
         sh4 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/f3570aa6837572285ee1d1d277c042f38f176de3
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/ef99eab08902a52fad4a93902185f50f75ae6d10
microblazeel |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/24a0f1dacc6c552efba068ede16bca6e4a08599e
      xtensa |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/e13c13378f460635b5ba535997af4facb50caa61
    mips64el |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/587af599174c796d74dc6a83bca178f3445880ac
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/8b5c93cf02aab1460f64469f00a484049db72006
      mipsel |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/a6e33179ec09d9339a095c4d407bb1299c27edf0
     powerpc |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/f2b053df283bb4d90d82cd4ac7d99ab6737e1a61
      mipsel |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/b16306c1b542e65194be46c48646bace25d33700
      mipsel |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/022750c36abf81dc55053fbbdbd8e2d18b255a4a
       nios2 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/1b317e06bf7fb7f82084535b711b4899364b18b0
      mipsel |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/9d24bcf9194ac83690c54fa51c877ce5af1c4554
       nios2 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/b03f0de644036482c438a558d85401a837335323
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/00031b1dd1983d2a142c5e4d6fce1fc8ad27ea73
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/2a855c4941b6a37c55dcb886105b373fa876640f
    mips64el |                   psmisc-22.21 | TIM | http://autobuild.buildroot.net/results/d9a6fa7f77ad39b99c2121631461d696a0b12c31
        i686 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/1b740473d5c641e3afeb0e4a6458954643430449
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/94660bfc70c8e2f5535805160bd6742c0f761d1c
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/3f4f95ce1b99ca1075c3a0b11f1eb6c7ef9ce323
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/52cb3de3ef5090e7f9d95bbc2a0fdae9efaf4d0c
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/a8903600b2a66e0c20c32c1bfdeb8299a408b925
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/2a623b7db9f45f8fefe78bb6c670de9805814a2c
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/7c86db148422a204506ae293d4503d7ec435b5f2
        m68k |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/d30e7b3f2da3f1aaf2c9055facfccf0a1d735fde
      mipsel |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/50ead7c512af7cd9a3ff730d4d95942b42e63216
         arm |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/fb6ea86f18bbd0d20ffb25e9b3017cdc806c1f5e
       sparc |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/b6fa4a9f67a931c8bc31ff60de571a75b0381835
     powerpc |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/d04e5642433827c5439c3b484e793b843c6b1b0d
    mips64el |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/74f80c11a4d3c9e9fa58d404a81f20b0fa634d9a
     powerpc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/d850ad2d44706ed9802dce347fd3fbbc6a7b7f14
     powerpc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/b37087c817b45b8d53a7e72c9f1d5b8991081492
     powerpc |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/d3518a03929a41404cb9f4ef127092a3d532f018
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/664a3d8dacab1482d9905e958f22a9ce69e0f42a
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/913662f10330b79f7769d05493438676939d9c7e
    mips64el | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/72ee5489b88a7c6ec7752a58649169c5b19286d3
        sh4a | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/408c2fc4bc25b4a5b3d49efe18ae23f193e95102

-- 
http://autobuild.buildroot.net
