From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 07:18:08 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-09
Message-ID: <20191210071814.D362187B3D@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-09
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 22  |  3  |  0  | 25  |
  2019.08.x  | 16  |  2  |  0  | 18  |
    master   | 121 | 126 |  1  | 248 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 15
             lirc-tools-0.10.1 | 14
                  apitrace-9.0 | 13
       alsamixergui-0.9.0rc2-1 | 8 
                 uclibc-1.0.32 | 7 
                       unknown | 7 
                apr-util-1.6.1 | 3 
              host-grpc-1.25.0 | 3 
                   libnss-3.48 | 3 
               protobuf-3.10.1 | 3 
toolchain-external-codesour... | 3 
                  boost-1.71.0 | 2 
                  gmpc-11.8.16 | 2 
            host-mfgtools-0.02 | 2 
         host-ti-cgt-pru-2.2.1 | 2 
               libsigsegv-2.12 | 2 
lua-msgpack-native-41a91b99... | 2 
        matchbox-desktop-0.9.1 | 2 
                qt5base-5.12.5 | 2 
                 samba4-4.11.2 | 2 
                snort-2.9.14.1 | 2 
                    wampcc-1.6 | 2 
              alsa-utils-1.2.1 | 1 
                  bind-9.11.13 | 1 
                         clang | 1 
                   dante-1.4.1 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                  flashrom-1.1 | 1 
host-gettext-tiny-73fc3e7ef... | 1 
            host-libp11-0.4.10 | 1 
                libgdiplus-5.6 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                ljsyscall-0.12 | 1 
                 mesa3d-19.2.7 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
          modem-manager-1.12.0 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
                 opencv3-3.4.6 | 1 
                oprofile-1.3.0 | 1 
           oracle-mysql-5.1.73 | 1 
                  polkit-0.116 | 1 
     python-subprocess32-3.5.4 | 1 
                 ripgrep-0.8.1 | 1 
                suricata-4.1.5 | 1 
           uboot-tools-2019.10 | 1 
                    xen-4.12.1 | 1 
zxing-cpp-0db7f855135222bec... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/89331491f40a4fbe80ce72a3df0dd93c5828124c |     
  aarch64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/5a44d3fd2857778e05bbd75618c2f85e612463ab | ORPH
   nios2     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/640f886ce647831a9d22a1cac64e921ca196731c | ORPH
  riscv32    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/48e4f40c72dc53aafca8a83b6d15e2b921e5ed8b | ORPH
   mipsel    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/99dcc2ab770b8edeb8c7d7f9d0eaa3ac16da4427 | ORPH
   xtensa    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/e8b7e74872a812893774f7d1e098b25736821ac6 | ORPH
    mips     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/146932d5be8a52770547d638e3e27b4e9545f1d3 | ORPH
 aarch64_be  |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/ec22b844fa8202360d351caca33c8afd0e5c6700 | ORPH
    m68k     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/6ce09688b035f1e9cf04a80ce4c740405886a4c4 | ORPH
   nios2     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/6b8bbd033ccc5dd764ca83c440293129e900bc3e |     
  powerpc    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/5daa13023afbf329e315f22d951ac8c3a123c545 |     
    arc      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/9206e7a698b0a79adbe2753cf8f7750af510a85c |     
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/4a12759eaa98335f1b2d1804c56d1cbd80210fd0 |     
 aarch64_be  |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/14644ced8274ba8f54379ba050827acd8cbca490 |     
 powerpc64   |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/49ff4470f61e480744f8b7c2497ab655343b48d0 |     
  aarch64    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/6a9b264654f35d9ed010b3c15abe626fec627f26 |     
    arc      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/8922bbfd3b915f7c7e85725d9e3fb068ae363c75 |     
powerpc64le  |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/70d0e3718a39be5b02a7fbdbd41c6364b6af130d |     
   x86_64    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/a6dbf7d31b4ad2350c68d9b6a6c457eebb98f2d2 |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/956b63a408c43bcfae87f3192480338d78970248 |     
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/f8f7703e055f010b4ed6e56bc2d0a2494f84da65 |     
  aarch64    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/509f5a57f74dfd2cfcd083e8886700a5993da669 |     
    arc      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/5478fd976c5b0f597e485e031ab490d368e77957 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/eb779dc4ad39f983abd3606cdabf2d2cae3b9d64 |     
  aarch64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/d6837d86d5ae895fa00f7bdbec2724d7cb43f684 |     
 aarch64_be  |          bind-9.11.13          | NOK | http://autobuild.buildroot.net/results/56330f86872f67a2ce328e09b4c7b12aa835a432 | ORPH
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/2b0d54f00db20c934a9f37d360705bdf94e34bc5 |     
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/cac8e19487d05c8376d0fec6bcaeb0e8007a3992 |     
    arm      |             clang              | TIM | http://autobuild.buildroot.net/results/7c2d37983e0dbeb580d31503b2067e345e64d5d6 |     
  aarch64    |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/8a92d5257ba3e6fd0ad56ddb0afad8b6edd40ae3 |     
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/8ebed3aa838c81f8233f7c0d1371784cf401e6b7 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/40de43dc7e9072be8a8c1ea0008944ceeac45d1c |     
  mips64el   |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/baf32520079509187ddf2942957b62c7410e0171 | ORPH
    arc      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/1c45ff7d1ba6a6a4b67a2eae332f448f7272e19d | ORPH
    arm      | host-gettext-tiny-73fc3e7ef... | NOK | http://autobuild.buildroot.net/results/5c98576c4f8396f43a90ed22d59bc25ade8a0a95 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/eb3865ed6068f5d6159d4867b29bf923026f9d02 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d50805379d4ea9fe3f554a5eb09b95d836c4033c |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/66818a46a927eba828307746636cfb7f83a65160 |     
microblazeel |       host-libp11-0.4.10       | NOK | http://autobuild.buildroot.net/results/10305ee3a71def464a90a748ce4a55e57860e32d |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/d08377fc886b8a76f027e60a869ace71f68a54d4 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/9023b4b3c9982dfccee927ee728eb53c1c3f300b |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/59a5474be5eefe3457b0e63adac454219f15d73f |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/bd1d9b9477b7a51f588d828161b40970723efc0e |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a8fd7e0e164073834b9142cb4cb498e5f7817d17 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/f47c5d19fa567a18427dfdd1c7b8a7a8c4e50992 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/baf55f1fad41ccc5179683bdba1fe91d73dc72b8 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/8f786de7de559f48d48b42c3f2cc3d55e7ee72dd |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/7cfeb4d2acebd97223224c2ac383da9687592d40 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/498908ecc944a02a6b200dde4a64bc68607ede45 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a4176be856808d7bff63ee48cf0cb48edd2dcb69 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/84e9ab24be5fc769b20a0dfc528ec8b329be3141 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/47149c863d1fa9fa94f2e940528b14faf8b90dba |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/d6d52ebbbb04825ac7f8102094f456b852c8e4e1 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/3871c6700bf2a8409e529ae8d0441ff4f0cbb5c4 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/22db45cf8058a4ac13a1ee5ed8df30a999fd080f |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/ce3ad0548abe44e5600b7ccb8140377b09deaa9d |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/d191aa7142ab52ec8f98ffe50f774a03b9f3dc54 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/b3ede61cf6b681385a6e92315290425424c16bee |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/0d2a38a41485f1a2bca2cbdb71a02aa3c40244b5 |     
  powerpc    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/8bf95bd8a0aec8c53889308ab1e00d0a94f53d57 |     
  riscv32    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/16449ffc1a5036f020ba5bfea06a52b581b71473 |     
   mipsel    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/1dce01a636823e56557654513bab8d4878159b2f |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/d095357b6637bed0c51dc391071ae5d0de3e6b48 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/25d2020b2ce3b3e0409bff252dda8f9df45ed318 |     
    m68k     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/4a85d76039e653b7e488978d37164f85ee1b7597 | ORPH
    arm      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/3aa36e5874547a8a94bb98c09e17cc9c4286adb0 |     
    i686     |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/42523b82d4cbb1b33ca1766af89927a0bea5b724 |     
    arm      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/1c78520220f13b0566dc82938d93c8e80bcfa50c |     
  mips64el   |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/f4efc3a07979b7a6002ed863ff7eada6168f8533 |     
    arm      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/c124df75394afa795556c52c83478362d028b8e0 |     
   mipsel    |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/3c1e3b28590e03f23c95fde57301afaa5998ab7e |     
  mips64el   |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/de08eeb2b487482ca25292f917bf325f2c0a03d3 |     
    arm      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/58bb80eda7e43bb5df705c898853452109d3bf80 |     
    arm      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/0a24343bb2915ce339bccd08854bb03d52606d02 |     
    arc      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/73e275a2b0f7d5d0889c03eb403c3ff29e1c66b2 |     
    arc      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/5a244fd89ae0e6ba6844123882e4e87b68df7075 |     
    sh4      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/bd31ebbdf878237e1d026f984257731d286da448 |     
  aarch64    |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/95e1ccab94c7c5345a8554c5a9848ddaf2558806 |     
    arc      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/9d68cba1f0afa137409f86cb15cb52ee57a0aadc |     
  aarch64    |         ljsyscall-0.12         | NOK | http://autobuild.buildroot.net/results/e2ebcb7defb0586246adaa1d689f86c9d3440695 |     
    arm      | lua-msgpack-native-41a91b99... | NOK | http://autobuild.buildroot.net/results/d4f37fd7d599c1ff2a54215d31182c39e6716553 |     
    arm      | lua-msgpack-native-41a91b99... | NOK | http://autobuild.buildroot.net/results/98c3317939da86506e5c643f729196ad520df1cd |     
    arc      |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/d7057f601a8e9252da5e9c4ac05a1ac94b522896 |     
  mips64el   |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/8238655f160e7f6b945f88775ad30d23271e638d |     
    arm      |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/dac3c861d80e069cfd65294f7cea2b2b77b6aaec |     
    arc      | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/0362a4e5d450e2011ec11e3fee67ecc7b006a1d8 |     
    arm      |      modem-manager-1.12.0      | NOK | http://autobuild.buildroot.net/results/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/e2cceb5f3a2a09a8aab089101e671b42e7d2ae35 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/26ac98edc52f5b56be1541eaa6fb7a47ee418c9f | ORPH
    arc      |         opencv3-3.4.6          | NOK | http://autobuild.buildroot.net/results/dddd7d68da9d055de38a0bc0716c50641368097f |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/e8c2800fdcd2fb3e9a0e33d9c9d2ad5518e201eb |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/2498af2bd75c5f405468e2acd3dfc2cca1e1faf9 | ORPH
  mips64el   |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/be11db410a7118ea53a6dc85e2ffd9cb676ecd09 |     
    or1k     |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/7e0a24fcc1e98a401877986bde8b38ae8c20c859 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/cf54d80a713a310fa6945104b882b0b69155a689 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/1235e1fc8d120493676f5db41d6b2b24a5e6f7f0 |     
    mips     |   python-subprocess32-3.5.4    | NOK | http://autobuild.buildroot.net/results/4a43598510cb548004ebf62ead23706627e93050 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/b95a64ecbab028ee0f48cd46e683000eb0f1b121 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/1d2136b6c9d5ab2f042ecaea687fe4cb9e12fb89 |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/28b688c87b50b19cf0f0d8a398ed861b0b04f2c8 |     
   mipsel    |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/c587bf301de1561812210ed0d57fef630764a8b0 |     
  mips64el   |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/ae28ea75ea5a7067127e92f3efbba38314fbb815 |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/c5ab6c2c40d627bb4bf065f35d747b8ef0fd02ec |     
   x86_64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/a69df3959b45620f811c18744aa661caa479aef4 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/770c335704d9262bae1daa40c7ccc2f9cf73f7fe |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/2feff5aaaecf6a610a1c2cff88483a72f490197c | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/f5dfc134c3919b5dc345c044f40501ab364f7b85 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/f6b571bcb4d0817e9ff4d5f05a5d03e65d2d445f | ORPH
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/7c719870395a605494f9ce3267c52bba146cbf99 |     
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/935fdb8368bbe715c22a27de748136038cad0dbb |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/2d4b5a3fcb98406441aa8260b09e20508f68f9a3 |     
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/f5ff5d26dd51e757b46c963166532fba45454c00 |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/48794007ba6b5f3cd169399683ffec173cf83239 |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/7c97fa6adad6de71951fd0c385e75d3a7af328aa |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/51d5a44f859b572d9fa46a2c4027f6babcc1e811 |     
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/556f74a78f4ca8c3f3b0e7f85f0867bd85026291 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/40b52f48dbd8785d4be60fa349f7cdbf1b41fe6a |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/97d12cae23dd436948746f43948b88d067b7d91b |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/011647595df146c618c626218a7d4e87a342a436 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/b9c52acff9d38cdbc1d86fd5daee6fea9a85bf73 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4f3fcf4e2a520b193ee31831bc1ad17843e00c48 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/8ecd322797351ee7f041d976899987e4dd699de8 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/13554c28b688ec533e6b7803fc702ec4aa6e09df |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/76ec9c5cd6f6e18c2af4c4075a3737e30ca7fed1 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/f050a9282cc3b3654c659f718aeb99f0e3856d3a |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/2b9ebb1c38a3a1773c6060b4fd0673839c3da4a6 |     
    or1k     | zxing-cpp-0db7f855135222bec... | NOK | http://autobuild.buildroot.net/results/1effc8e3413aad3675318876e3b0a02a61d532ae |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

            safeclib-v03032018 | 1 
                 uclibc-1.0.31 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/241651b89520a8a8ee1f92187d34c6e6ef6f5bdb |     
    arc      |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/5dd5b35bc076ad59512ebf05c037b9c658157881 |     
    arm      |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/3714e46d5fb3977091df376ce583375eace20b76 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.18.0 | 1 
             qt5wayland-5.12.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        host-grpc-1.18.0        | NOK | http://autobuild.buildroot.net/results/d105c2d38c980d90f37b9649108a03ccddbec022 |     
    arm      |       qt5wayland-5.12.4        | NOK | http://autobuild.buildroot.net/results/14d20a17771007218a47a882547d1f9d1f77a845 |     



-- 
http://autobuild.buildroot.net
