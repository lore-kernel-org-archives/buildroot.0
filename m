From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  9 Apr 2018 08:00:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-08
Message-ID: <20180409060015.7DC8B20722@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-08
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  28 |   1 |   0 |  29 |
      master | 186 |  76 |   2 | 264 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

             qt5location-5.9.4 | 1 


Detail of failures
------------------

     powerpc |              qt5location-5.9.4 | NOK | http://autobuild.buildroot.net/results/42715e0c8e7b139dd3e0feb10555583015e5cb6f |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  zeromq-4.2.5 | 18
                     lxc-3.0.0 | 12
                    liblo-0.29 | 6 
    azure-iot-sdk-c-2018-03-16 | 5 
               libglib2-2.56.0 | 5 
                   flann-1.9.1 | 4 
   python-yieldfrom-legal-info | 4 
             amd-catalyst-15.9 | 2 
             expect-2014-05-02 | 2 
gst1-interpipe-10dba89eecc2... | 2 
                  host-go-1.10 | 2 
                host-libsodium | 2 
               libupnpp-0.16.1 | 2 
                  udftools-2.0 | 2 
                  cc-tool-0.26 | 1 
                    efl-1.20.7 | 1 
                 mesa3d-18.0.0 | 1 
                     php-7.2.4 | 1 
                 qt5base-5.6.3 | 1 
                    tekui-1.12 | 1 
          usb_modeswitch-2.5.2 | 1 
                   woff2-1.0.2 | 1 
                      x265-2.7 | 1 
                    xen-4.10.0 | 1 


Detail of failures
------------------

      x86_64 |              amd-catalyst-15.9 | NOK | http://autobuild.buildroot.net/results/49c5fb281b7e6bd3b9289af1aacda604cad58ceb | ORPH
      x86_64 |              amd-catalyst-15.9 | NOK | http://autobuild.buildroot.net/results/ae9c86040f6e19674b61745d4ab265c1d3ff7c72 | ORPH
         arc |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/84dd8480012627b9cbbff0a9890175a8261c99be |     
         arm |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/331dada2abcadfead7ff13c798fbde9e723c98e0 |     
        i686 |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/a20717db3cc18cd388d2184ca56256ded86c6dcd |     
      xtensa |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/8edb26baa33d4683c6566f69243d66fafb48aa7c |     
         arm |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/845909391dbb4e98b638c758efd98c93fd528b20 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/dd426cb48c61cc94609c269fa63b277c6af6bc9e |     
      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/42ba71cd57f1b42b16276aecde29d186534d0c9b |     
      xtensa |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/1d42a03b36212957832808a881075ebd813efc97 | ORPH
      x86_64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/3c2ae721eb249a62021aad0187b30981c0ca0537 | ORPH
      xtensa |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/93d11a08e122ad5f5d48a8c96c3103e90fc08b0d |     
    mips64el |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/1f5442f9ac8eb77ebc1dd11cd52059096acdae32 |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/8e826f5f96e7d5587085bac970a5cd1fc0eac24a |     
     aarch64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/d100a9c10862b6b9b19e04745bee38bafaf09162 |     
         arc | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/c2931559ca1988791399f00a474cc13509cdfc94 |     
     powerpc | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/56c7b2c8aea552c6609a1196e309f385a6b6fdbe |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/88f65ea76569407d13f9ef52257fa40cd22ce2b4 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/917a588b0e8928dbbeee475367a65194c0eba3eb | ORPH
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/a8ee5ac278bd0317a7b04c7e8cea1a3140808f1f |     
         arc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/27c9f5c6201a3dc0f65fde50d92baa3c0530e89a |     
        or1k |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/f475968403deb00e158041fce7b4cef58a92df51 | ORPH
        or1k |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/8fd0ec5a52e045cd2205a818d75674f32db1d5a4 | ORPH
        or1k |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/310b8ddf77a01cc18e821e8b63b3bb0873f03d79 | ORPH
        or1k |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/4dc19f498bdbaf3a0584ee4f0526ccdcdd18221a | ORPH
        or1k |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/5694094a8f71141f20261ec13eabe50ce3d0a0fd | ORPH
      x86_64 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/bd1553d38b3bdbe01f58df7e9bf82c7ef6953ddb | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/9bbebc04903377fa5cf7e05da4e45779acafac9d | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/cf92966e1d0ebe12b07baf93060eeece2cf1944b | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/16dc17092520b9a0fd10c491d1bd5ca415a6afda | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/5583084b3f5524e44a7c733f272cc959f4796a2f | ORPH
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/0a1e3805f522bea8d6487ca53f6e8cc4b2394e8c | ORPH
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/2a7fd939791519960af8aad74522db9ebef0d913 |     
        m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/46c2b918d0efb50fe68150e3fe115b0b79cd64fb |     
         sh4 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/bd4c1dd468cf0cbcbfe378ebe7010aa754926766 |     
     aarch64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/8824009f22ad5066266d2005e58831d6da5262c7 |     
     powerpc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/bed038f3458b7eaf5fc7ba42479a668038c48b2a |     
         sh4 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/a931a8627793c34697f5cf8e500ec0308eaf214a |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/6217d1b347d2e0a3dc063994d74197be421a76c1 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/252f11404b093a0e15794740959834a75845c8c8 |     
        i586 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/f55d591403c3ca78424bcf371e30ee79637a3bc6 |     
 powerpc64le |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/21ccd35ddfcc5340cdab6724f0a37a1d6a7b2332 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/141c7f96e8fa48f225670c1ecb603c6b6cba7083 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/3125d2f758acde9f32d2aca9e8627b97a8ec31fd |     
         sh4 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/29ef6a4910a98e1e5140ae523d8b383791f0385c |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/e94d1b838981a023eed52dc9dbbea52edec3500f |     
     powerpc |                  mesa3d-18.0.0 | NOK | http://autobuild.buildroot.net/results/d17cb0264adb1e1acaa4df90e69178b8cf36abe7 |     
    mips64el |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/ec5166216df2bfb79654b2ab7efd17d6ae841537 | ORPH
      xtensa |    python-yieldfrom-legal-info | NOK | http://autobuild.buildroot.net/results/e109ebb0c26034d72f2a26b7412c93994c5c3095 |     
    mips64el |    python-yieldfrom-legal-info | NOK | http://autobuild.buildroot.net/results/91da2b693bef83e8aa19766bd465683170ac7689 |     
     sparc64 |    python-yieldfrom-legal-info | NOK | http://autobuild.buildroot.net/results/b2d372b40c5203b01857a09b3d6860110600253c |     
         arm |    python-yieldfrom-legal-info | NOK | http://autobuild.buildroot.net/results/cb836fcb42ffcb09334ffcb2896e6c89ffa6a474 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/ea10888507315e9efc6fcd7c815f436e38934d2b |     
     powerpc |                     tekui-1.12 | NOK | http://autobuild.buildroot.net/results/9d8601ea9851c71b5a0d6b7f685d4b1c1e1b15f1 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/4dd36d089b3369b2542d145e919d0dcda513dcc2 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/9106963bad1bb5f30e4eb4e2bf3fed75162e4d9f |     
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/949de08b864c037c8045f26926c4ba7b7f594d7d | ORPH
        m68k |                    woff2-1.0.2 | NOK | http://autobuild.buildroot.net/results/7cd1ca33f469c48be9bb5229edce8ba5f8a8444e |     
     aarch64 |                       x265-2.7 | NOK | http://autobuild.buildroot.net/results/2d4cfc4b1c4442204404a514029d985bb477b467 |     
         arm |                     xen-4.10.0 | NOK | http://autobuild.buildroot.net/results/79a31ef6b2af6b2c3666bde5073bd20d716c4632 |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/cdae3a99d3009672d105afc64f4a9ecc8d8810da | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/6e16f2f40ff4174db8df820f6a164e44ec68eae8 | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/07bee95c82c1fc2cff2703143f4251435552c4d6 | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/c21dc4516ddc2fae8480f4d94d6743eaf347ba23 | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/e965317781a67bb0a7e843ed992f67edf466273a | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/1e65ad4583d13f7425e4fce940611c930d3ba537 | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/82b58221f10dbf4185a22012d85ceb47e10dc9e3 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/397e26335ee7df56ccce195277e68fbf08b8a06a | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/8cf5e662877f75be4c02b0d1151e5bc698f3dd07 | ORPH
        bfin |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/8462911fc5f4ef2085861aaad4a4dca4b0a941f3 | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/055495335894a54bfff6bded383f722eb785ab50 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/dd80e51260206c73165a6991724f20cef0c6cdd8 | ORPH
      xtensa |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/70c8001cfe6ba07161b7e5b2de912f38eae6b503 | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/ff3da0921df079b578def48df5691dc0d610d98a | ORPH
        or1k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/c172858b56d484df4003c56df7ffea00d285a391 | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/c847e366553b61b36d0eebccd9c2062c7101bc58 | ORPH
        bfin |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/c3e4c7cab3e6834ae9bc4a40d221633c17a6b688 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/517dfb40214d9ae4751f1babf64cdf542a7d5ec1 | ORPH


-- 
http://autobuild.buildroot.net
