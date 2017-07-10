From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 08:31:33 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-09
Message-ID: <20170710063133.409E621DBF@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-09
================================

      successes : 154
       failures : 95 
       timeouts : 6  
          TOTAL : 255

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 36
                  lshw-B.02.18 | 8 
             host-aespipe-2.4d | 6 
    azure-iot-sdk-c-2017-06-30 | 5 
                 libssh2-1.8.0 | 5 
                  cppcms-1.0.5 | 4 
                busybox-1.26.2 | 3 
       python-smbus-cffi-0.5.1 | 3 
dvb-apps-3d43b280298c39a67d... | 2 
                     gpsd-3.16 | 2 
             lttng-tools-2.9.5 | 2 
make[1]: *** wait: No child... | 2 
                   pcre2-10.23 | 2 
               qt5webkit-5.8.0 | 2 
                collectd-5.7.1 | 1 
                dbus-cpp-0.9.0 | 1 
              dieharder-3.31.1 | 1 
                  dnsmasq-2.76 | 1 
                     efivar-30 | 1 
                    ficl-4.1.0 | 1 
                    git-2.13.0 | 1 
         host-libsodium-1.0.12 | 1 
                 libpqxx-4.0.1 | 1 
                libshout-2.4.1 | 1 
make: *** wait: No child pr... | 1 
                 mesa3d-17.1.4 | 1 
                 mplayer-1.3.0 | 1 
                openocd-0.10.0 | 1 
                 pixman-0.34.0 | 1 
           python-pynacl-1.0.1 | 1 
                 sngrep-v1.4.3 | 1 
                   strace-4.17 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
===================

         arm |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/4a73bb381444e0e0be64a9c5be726d5b924a0b06 |     
     powerpc |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/af85f8a25dafae931c1a69e13b3a80f22a638d77 |     
     aarch64 |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/ac3954d48e947d72ca26e5df78ded69fc804c316 |     
         sh4 |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/176c3b5d2621c2e839731f48b04e5eddbaadd52d |     
     aarch64 |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/c1c2ad698b4cd82853749ba7b90934edaed17978 |     
       sparc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/e153842f5ba594801640e1dd8a0241291c45c98a | ORPH
       sparc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/71b2372c68047fce5e53f3139ffdd15d5591b2be | ORPH
       sparc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/ef8757b18989f505a0990ccb77abb7262af45ed3 | ORPH
         arm |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/6cd537feb24a3466c3a8d4e10d5aa738589bdcff |     
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/a97282ed553aeeb4f096a9945268bea9a60ba138 | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/845272813b3ec11139fe423e4aefee7f4d354c1d | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/53804d2e5062ec79029a234efdeab14a453f3a41 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/520952bb435120a92431259d86a8ec94049bc245 | ORPH
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/e67280824c7bce48caa88b695bd31fbe48683517 |     
         arm |               dieharder-3.31.1 | NOK | http://autobuild.buildroot.net/results/5b76d62ad03d0cbe483792b32ea14ce7d7432983 |     
        m68k |                   dnsmasq-2.76 | NOK | http://autobuild.buildroot.net/results/04fd0d77f14a39de8f25faddf30c8a2d46571f53 | ORPH
     sparc64 | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/ef0ca88db01c44825e23d86ac2543c0f958b68d8 |     
         arm | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/f9112d5d90283a5d62c1fd98b4f18c5af12cfc15 |     
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/e7d80e823e13edc6698148244553bd90367bcd03 |     
         arm |                     ficl-4.1.0 | NOK | http://autobuild.buildroot.net/results/6fffdd193dab0fec451044d60a6436ddab28418b |     
      x86_64 |                     git-2.13.0 | NOK | http://autobuild.buildroot.net/results/3226209c3494c26aef275c6e830e4e235a079ae3 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/6e1aa0888d1b4363c6c5c483977542a24f0cf2c4 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/cada53d85c88588cfd8d150d06f29261335935cd |     
        m68k |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/206480221cb354b5fc64aa4cf73b32c2477ef9b3 | ORPH
         arm |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/005b6a0f9c68651f772ad72a528fd87278acf194 | ORPH
         arc |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/58dd538c3ffec52bf1dcd97ec0d962bb3ba800b4 | ORPH
      x86_64 |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/b22d72668409a39faba62aa8a6828cdac033e003 | ORPH
       nios2 |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/e3d457caffffa57eedd17a266cbd47f64130891e | ORPH
        i686 |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/7de41284dec115ff34792e6a927319d931d3e624 | ORPH
         arm |          host-libsodium-1.0.12 | NOK | http://autobuild.buildroot.net/results/d69b83197c6cdd075c1bcf5ddfdafc1ecc0cb683 |     
      xtensa |                  libpqxx-4.0.1 | NOK | http://autobuild.buildroot.net/results/ef5f9301481afc14a2f015a81170ca57ba9b3cd2 |     
      x86_64 |                 libshout-2.4.1 | NOK | http://autobuild.buildroot.net/results/d0c38f9937b0ed5dafca34f3f84864baa5dc6b3b |     
         arm |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/05521e8490dd86eedca8d4d403709709cd2a8cc2 | ORPH
    mips64el |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/ac3a3f5871a6c20f5407a468809682ce491b9cb3 | ORPH
     aarch64 |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/5df7224fc3d21ae9af3a5155725ab40b793e26c4 | ORPH
     sparc64 |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/ba31fa11b2ce2875649414dd9093e039dfc129e8 | ORPH
      x86_64 |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/b07bbbf7fe164ba6dc435de6d8b41fadff7a3b08 | ORPH
     aarch64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/bcd259994f17d53b9c5a1a25bcafd6ff3fd6b01d |     
 powerpc64le |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/aa64b9ab7f3963838662aada9bb23f4670c2344e |     
    mips64el |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/09dd8299e9a38576f24237c38bd9857995a4750e |     
       nios2 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/00a1eeab44f77ec09f4d88ecb3ff661557e3773a |     
       nios2 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/ce0f1fc9df46bafb9bac2a208c5958d721a18bac |     
   powerpc64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/050ef8f8a784d30afd965962a3d176d11567fe75 |     
      x86_64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/3db5f7cdb02af80b61061dba21f96e28f6e19967 |     
     sparc64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/4dbf44fceb603a64c3781faeb83036dad4c8eeac |     
        i586 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/5d7026b39bcf0c00a33d9a20d98b1aefef801490 |     
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/4f7c95cdff867bc2dd43788fe38031958abf407e |     
      xtensa | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/dfeb7ac63c4e620071b60b179b62b67a5710b2a0 |     
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/932b0003d83b21056a62f326e15859c2706a6dd1 |     
      mipsel | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/67b6c4a8c7d80e46ebaedfe8c5ef37391fd17e48 |     
     powerpc |                  mesa3d-17.1.4 | NOK | http://autobuild.buildroot.net/results/e6a3f2b23695ec80aa64eb6f6ddcba132902fdea |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/c1f82f8536125f28de9c5dbb6bb2a7935c840389 |     
         arm |                 openocd-0.10.0 | NOK | http://autobuild.buildroot.net/results/5a323ca80b5fc7141ec715dfe338d3a6af3e66a8 | ORPH
         arm |                    pcre2-10.23 | NOK | http://autobuild.buildroot.net/results/2cb8e091340afed66f7f1dcfe54fa32297dce4e6 |     
        m68k |                    pcre2-10.23 | NOK | http://autobuild.buildroot.net/results/2c2665844748a3bdb010315200eea70aa3504b95 |     
         arm |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/38b0e3b5f00be4acd8f5be78adc5941a71e4fcb6 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/49a4b19bf9b632cfef63c094f7e98b6821c737bc |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1518b8b8c830fb3e0dd5c76f672303806c616201 |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e7638379f178210a2a2ac3768c4e8247c4d6ef08 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/9f14f48a4ca38ebcda761e7e70a72207e36fd07c |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c01f3605c181b53626578b2ab4a138d5c46bfdc3 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/43f9addf7be7d7a78ae4f2abfee2f8d3af5c41f0 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b3ba24e018549b86d7dd12ccbd0cf9f43cbaa614 |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/aae7576f4f3ef444c306cc208c3c1ddccf85be4e |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c1e4d497ccb0a5e6f8cb656c821ada6d22b0d7fe |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4f17ce896cc2238112e063356884e7a67f7e7f81 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e058c82c7b7e447071bf663f305476f2f5a88671 |     
        m68k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/55d1b9000a546ca2acc6273aad78c16453f23349 |     
        i586 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/9aa33bfd163536ba0f289009fcdb7c08a2027f8f |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f2d39138d5747b73b40df396288307a8638db39c |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0bb67ae9b9f844dd0e36425ee02b18490467f5b5 |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f1c6c70b638190fc5670613b18849d7392d7ee10 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/04919f95c28dbdcd93f69ececb2b351d9efc4c92 |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e4122de90385f3c683e14765bc4ca86d1e15cd31 |     
microblazeel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/5317217ec27a065c3003ddd841581d83ace8361b |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e2da2bd7ba4e8efe77795d11fb215805803ce342 |     
        or1k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0cc47dfa3956eedad4ed42f5071655a925a97a9b |     
        mips |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f78d34896fb3126ea10b7988c7e87b99977e0479 |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b4f76dcdb7f4bbbaa8ce832c48c54bbb3245af2a |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/cfd1fa3f58c82e52f6c6cd9dad559d9c48157d37 |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/8946c3a589a6c54f4bcf0d1b0eab3d18b16d7d3e |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4502dc16c07f4e87f093ca916071dd550caca4d3 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/9ad1566a9c7bb67bd10f7b045036f97045be0a9a |     
       sparc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/5da23ed396f4e66b334d2c9c6004f5250bbd5c9b |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/7706d7afd9160a12ed8ab3aa54463b05d7f3fd41 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/90e811c4933a39aa5b8c272507eb2c4fc47eb15f |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/96e9c0e3fb51f5a95165360eb988068b3d6c530b |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/34dffa6aca1db0e41955c43f3aed55e8d0a8993b |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/2d2acefa6246dc97c54abd539d538ea9eb4bfd6f |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e8af330afda5b5c356ce90716ad1def6385e4e52 |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3007704e2926e9541a27257aaff576020f420c6a |     
         sh4 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4e3c0da08881b39c80c9d5e6ff0487eb467bb44f |     
 powerpc64le |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/b420c4ae6d33df3b7e9765d8e690c254aa9a3838 |     
        or1k |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/f00e5419d95df43e87be00d6245104c380fe3f17 |     
        i686 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/caa89bbee74704137368eb5ef971ad194b4f699f |     
         arm |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/f763c0877b6b9d2c8533d1a35b76b5f079494686 |     
         arm |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/59edc25738705b9b54615b3925ea5fc58da4ed8c |     
         arm |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/7d6be6c70988b63b5438050dcd448b8553e35e39 |     
      mipsel |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/7d403af23cd2cf78cf0152780ec72bce2fe51bf1 |     
         arc |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/a693e4e171ef2202fb31d4f07281dbd07bbb863f | ORPH
       sparc |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/b6a1a57c3f74a1f78710ee5c5f6cd2167f50d900 |     

-- 
http://autobuild.buildroot.net
