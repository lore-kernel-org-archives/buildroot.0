From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Dec 2019 07:16:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-17
Message-ID: <20191218071649.2A53985D30@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-17
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 12  |  1  |  0  | 13  |
  2019.11.x  | 23  |  6  |  0  | 29  |
    master   | 138 | 122 |  0  | 260 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 21
                pipewire-0.2.7 | 18
                   dante-1.4.1 | 7 
       alsamixergui-0.9.0rc2-1 | 6 
                  apitrace-9.0 | 6 
                apr-util-1.6.1 | 5 
              host-grpc-1.25.0 | 5 
                   libnss-3.48 | 5 
                       unknown | 5 
               protobuf-3.10.1 | 3 
                 xvisor-0.2.11 | 3 
       gst1-plugins-bad-1.16.2 | 2 
            host-mfgtools-0.02 | 2 
                libgdiplus-5.6 | 2 
               libupnpp-0.17.2 | 2 
           libwebsockets-3.2.0 | 2 
lua-msgpack-native-41a91b99... | 2 
                moarvm-2019.11 | 2 
toolchain-external-codesour... | 2 
                tpm2-tss-2.3.2 | 2 
domoticz-0f411f781ae4fb4a82... | 1 
                  flashrom-1.1 | 1 
                  gmpc-11.8.16 | 1 
                     gzip-1.10 | 1 
                haproxy-2.0.10 | 1 
               host-llvm-9.0.0 | 1 
              jpeg-turbo-2.0.3 | 1 
                librsync-2.2.1 | 1 
               libsigsegv-2.12 | 1 
               log4cplus-2.0.4 | 1 
make: *** wait: No child pr... | 1 
                   ogre-1.12.0 | 1 
                  polkit-0.116 | 1 
        python-alsaaudio-0.8.4 | 1 
           python-bcrypt-3.1.7 | 1 
                qt5base-5.12.5 | 1 
            qt5location-5.12.5 | 1 
                    strace-5.3 | 1 
                   systemd-244 | 1 
           uboot-tools-2019.10 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/4cdebc6c623f572bc802abc62f24e4e1322b7717 | ORPH
    arm      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/c027715c041ecd99fcf5463e6686c756764b68aa | ORPH
    i686     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/627945b03c13ec88d565c1c8dbe0a0298995aa1d | ORPH
    m68k     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/b7c61cb17758c2b805112aeddf99a7edbe4b3f71 | ORPH
    i686     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/213a9cdfad385292fd956e08f4675f9057c9d23d | ORPH
  aarch64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/35c8ce00a5baf78e418deb3d88fafb0fd1b0e97b | ORPH
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/b2595208b4fd81e0bf10f31c082046dd2a4fcead |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/e1a8023ec5709b10225da869ea3938fb5ee1a576 |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/d458b3c664465630cbd2632797f52d4b92a87d7b |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/afc16535dabf11196a93cb93eb62fc404d6a6eac |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/1165ed62d9ae3dbdc13590c39bb55edd9a444567 |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/03c4939fdfb7366c1835df946c4e869cd2b87b9f |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/4dec62e3a9fe72f1ca0b64b97052c4cbe446c95e |     
   mipsel    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/bd0906ab73a9d668cb9a2a25538398b2b51a3267 |     
    sh4      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/92d709b0cd96615608bd87d806c12b033d1a0878 |     
   sparc     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/2caff3220a0e69152b032cc9f6850662fde87bd6 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/06c15d3ab42b74b8de5138d712f3137a572f659f |     
   x86_64    |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/f6901ec71be53c3b2659cf1504f80757efbbd1a5 |     
   xtensa    |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/1f5b0489cf87426e5aef31aa339892d67aeb33fe |     
    arm      |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/45ac79d1b12dca9dbe36fb248c033536c6dd2bd8 |     
   x86_64    |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/21963b82db099d5dcd76c411a805fe0f24487732 |     
   xtensa    |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/7ec1dbaf2f007b779fe67be502d223d0e042e716 |     
    arm      |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/1d7dcc01487da10ff84a63502c1e3189497325c3 |     
  powerpc    |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/cc2059a77224e73a75346cc12f75406f9ddcf57a |     
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/a6175348628993a94ebc5524da5478f4edb10171 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/b2884a2c1f355f202686918fd4ceaa45b2984009 |     
    mips     |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/dae16e5de28806bcfbfd66d8eb833000e1d2e29f | ORPH
   nios2     |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/40632917c4164dcfd2a00100466e80279428a866 |     
    arm      |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/822641317ed5aaf14c016862079149efd3be4a4d |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/601cb6a6fb23db9e298cc37229e60c3b2d0eaeed | ORPH
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/e0a21ba13ed614fd518dbb84a60af945344cc514 |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d6e81cddb25b21180e00d89356406f79f206c5a7 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4894f03d3df284a8441889ec76756f60d8f25cc5 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/45adcf573946f32c79db9876a7d30c6cbe3d4bb6 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/21ef05c63347cda7fcab8d239017b1e864b96fdf |     
    or1k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4bd8af179e3cd846bc70c9fcdd55643c890da5ee |     
    or1k     |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/24eb37bac22d6aa054f756a6a3d7bb1a92d927d5 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/aadb9dbe7cd56b6e7333039bea96fefcdb51b885 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/43ee1d38f3dea581be19fa0a8e72e7901ab6b0ee |     
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/bc7ec3995eee98d38474ac339e6be8b5eecd8da6 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/bd34cde1cc394f1cc74e0089ef3c84c1c8ad6245 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/ad38bced2aff9982567f2e26a90c7abd3b85a29f |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/d1c369962a02994052a54c1e336f8fcf1d518be3 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/51ce82b6de6fcc1a5e5654c0a940bc4a066aca8b |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/6a948859ccfb5dac25fd1e9c977129010aafbfac |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/80446f1d44bd5af6e961ef3d6e559931f8775b58 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/9c60997739913cc2c806befd106ea07beb6062a3 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/dfeab74fc647f8b82b237e3844c61d6efadb9f47 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/09ce0e995a3732554b3dbed19d124f74bc84d2dc |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/85b0cccea22fd411d35797ec94e9d6542500885b |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/be9e47ab9c4d19852e5beeb8e4515a6e9aea031a |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/5ac3d3410ef27cd9afd068a51c3e59f3f73be8f2 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/cdf9e27f76e18db387d69062e52bd94e594764d1 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/5aee0ef509a829d30e28b4b8434efbeb948f277b |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/8545312f8ea73a11082d62cfa0395424f402b905 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/8b5de4698b7a79b2d76b11031fb6fd60b6a3dc3e |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/19c4140207426bdf8f7bf7842283e2fe36005388 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/daf4bd4db393a9c4a21e56a4128a107971085f1f |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/617499ae257d54752e402b0750de6d973476ac56 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/c6cda5d8adb950d2a86982ab4b772b565105ca04 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/c1be3b7723b2b04af1414a108fc4d54c25fe7dfd |     
    sh4      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/63b12b73d259578f49177c05c10b69cfe1ce9e30 |     
   mipsel    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/4e00007247f47bd26ce4d981474e3962141a9bcf |     
    or1k     |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/3eeb7c947dc055ce2829212bbbd66adc1edf82d9 |     
  powerpc    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/7cf1b86264cc462c7eadc2db7d956e61b6f05c82 |     
   x86_64    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/f505bafdaf93935dd8f58bf622e022d4eb5b27ee |     
microblazeel |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/b6be3e4d7b130dd1499f9c24a0355bfe8477623d |     
    or1k     |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/4af6c8d015f32ffb7d40b42f97ce5ee33b8b9121 |     
microblazeel |         librsync-2.2.1         | NOK | http://autobuild.buildroot.net/results/d0109d296af2cb1345775106584c6cb2854421b4 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/6d8cec29999a4c3818261a10b066126cf07aa0e7 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/e97593832fda1be1fa0fb64dd5279cd8fa21c508 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/07345d831927324cf5485faf074bba14c2f36cd2 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/dd3bcde15e925e51d43cea093e767bdc4027ac01 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/c9a87ff8244f9e6897d55aeccfc06156822e4a9a |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/0ee413b456f01da76af9c34c81c380ad29f66c57 |     
    arm      | lua-msgpack-native-41a91b99... | NOK | http://autobuild.buildroot.net/results/2279ca1259c14daf03e995fec46ca90d9fa4c0f3 |     
  aarch64    | lua-msgpack-native-41a91b99... | NOK | http://autobuild.buildroot.net/results/d775c91ec324ff8e2f215cced096618c8411f00b |     
    arm      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/cbb08df678702e974626ba15c6c203484e937bcd |     
    arm      |         moarvm-2019.11         | NOK | http://autobuild.buildroot.net/results/3ac903fbc1076e498deb580f3c3b562b341b55b0 |     
  powerpc    |         moarvm-2019.11         | NOK | http://autobuild.buildroot.net/results/2e9d2b970c5b78a642dd48cdd008c453be9f0b2a |     
   xtensa    |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/3a09e2d1d26b19243244eb7f9235c85488a788d2 |     
microblazeel |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/9671ad63b1ae147a6f660337cb4b3dc38209067c |     
   sparc     |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/0e80841fe9937d7a5142035c2a41158166bcf8df |     
    arm      |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/cd2cd6818586d346627f1a4543eecf2871a4e458 |     
  aarch64    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/fd2a3f3f76c5732c3ae92da950545342acb58a96 |     
    sh4      |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/441190f52f2611a2ac109761d78e84d0edf9c4d5 |     
    sh4      |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/bafc7794c7db50b602d6d0dec701020afa637edd |     
 aarch64_be  |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/c4dbe0313c7be9ae675d91c62427aaeb680066d0 |     
   x86_64    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/41aad71b5f5a96d50832e479d9dc9b1af9b82c11 |     
  sparc64    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/5aaef50e1996de9f4895fddd8c60dedbf32624d7 |     
   nios2     |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/967f17079721839232544156e60f2ddf1a397bf0 |     
  riscv64    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/190f2a1c27f8387ed67f51f338ffa7bc450c7096 |     
   xtensa    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/554f4139d75cfd71e242ca31f8b2d666a713196a |     
    or1k     |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/3cbe060eb9f32162c8fcbc74858ebbb6d6cda98a |     
   mipsel    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/cf390976ce6deeb2e0cb4660ae3542a166952dc1 |     
   xtensa    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/4d7afd53b443e344b77ac9fa5ed9385bf4e7874f |     
   xtensa    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/4ce6806fa02decabb95d503f6d2ecceb665685e2 |     
   mipsel    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/2333a34cb80f26b7475b454ebedfc51a16abf2d9 |     
  mips64el   |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/2253384866049185cadbaf71870872f334057f9b |     
    arm      |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/ca6385c5b74b07ba385ddece8b2253275f47d7b8 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/20d0516dfa14aeec27251d54ac3a7e9381870d28 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/6a8eb7bb7138771ae633e976de2deb1b164fcf94 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/8b8ab3faa0479bd0bf6c06a04894d29ea5d9b0d9 |     
    m68k     |     python-alsaaudio-0.8.4     | NOK | http://autobuild.buildroot.net/results/01ad4100c629a65883cc7891dd0c4821d2e70030 |     
    arm      |      python-bcrypt-3.1.7       | NOK | http://autobuild.buildroot.net/results/fd0fab28707f0c74b9535f6d6ae6466cd9039f7c |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/29312354ab170c12efd82ccc1e5bf003f2169279 |     
microblazeel |       qt5location-5.12.5       | NOK | http://autobuild.buildroot.net/results/f5df06df22ae0e770d09a6be8512e487cd146491 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/402df94d0055ec9aec973fdd21522f6474042318 |     
    arc      |          systemd-244           | NOK | http://autobuild.buildroot.net/results/009f7a639897a1f2894b768ed9d103adbc711423 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/098d549ab828b3252c2198865e873073468c74b5 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/21cc47be8067261a0e87ab03c1976201d2877772 | ORPH
    arm      |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/f49bafd1c672bd86b23b4c9601a80c513ea4c21c |     
  nds32le    |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/f8510700835d352d13d0908980300d1f2499fca3 |     
   x86_64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/fdd6183f60206807f26a8f0b1d0f969e722cdf30 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/bd0114354c561726f56d20f6fbe546a1a6a4ae33 |     
  nds32le    |            unknown             | NOK | http://autobuild.buildroot.net/results/2d810dae021ace24c60ed2b3df57be7da3f6423d |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4275cb540ceda54ad6bbee040fea23af7dae7180 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d6b2a9f117ce409cb3c18b0109a6d0ea90e6c596 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/8e1dfea51408fc91139511f0a77cab0df40426bb |     
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/14bee38029d3da791d9f61f85742e60060b8dbe5 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/0a9eaf677134054704700c5a3af8c6707a1e6417 |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/b2b51c49325f6bf1df548fd412f1398958c6baed |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

         host-ti-cgt-pru-2.2.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/8aa1c8e44ba76ccad4adebb8d93f631734a37b4a |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 1 
                 mesa3d-19.2.6 | 1 
                snort-2.9.14.1 | 1 
                       unknown | 1 
               wireshark-3.0.5 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/e40ac0ada195d3485efec70dced69fa79b68072d |     
    arm      |         mesa3d-19.2.6          | NOK | http://autobuild.buildroot.net/results/3f918d3d88bbe5173ff417ecbfaeb9f1c78173f9 |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/837e43b085ac30fb8545c67352403ceb7de59976 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/42f2c87d37f9e6f0021afab4ef982a92d21d2d19 |     
  powerpc    |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/5ecfdadaed58c39d7e5490c4fc16b701d69c74a8 | ORPH
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/96e66c9092bb8c16dd033271442f249399255713 |     



-- 
http://autobuild.buildroot.net
