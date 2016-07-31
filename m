From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jul 2016 08:30:34 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-30
Message-ID: <20160731063034.7EF00101B16@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-30
===============================

        success : 149
       failures : 218
       timeouts : 0  
          TOTAL : 367

Classification of failures by reason
====================================

 host-python-setuptools-18.7.1 | 46
               target-finalize | 12
dtv-scan-tables-0c92e5e5d35... | 11
                  autofs-5.1.2 | 10
               libcap-ng-0.7.7 | 7 
openblas-f04af36ad0e85b64f1... | 7 
tvheadend-8e637f9f903f6d820... | 5 
             bluez_utils-4.101 | 5 
                  connman-1.33 | 5 
    xserver_xorg-server-1.18.4 | 4 
             transmission-2.92 | 4 
kmsxx-a706f157b86e906968080... | 4 
                 libunwind-1.1 | 3 
                blktrace-1.1.0 | 3 
libubox-e88d816d6e462180f03... | 3 
                cifs-utils-6.5 | 3 
triggerhappy-7e5abc69f21567... | 3 
                 jack2-v1.9.10 | 3 
             host-mysql-5.1.73 | 3 
                  babeld-1.7.1 | 3 
             host-mono-4.4.1.0 | 2 
                    mosh-1.2.5 | 2 
           argp-standalone-1.3 | 2 
mmc-utils-d0b46442b50794217... | 2 
                openmpi-1.10.2 | 2 
                acpitool-0.5.1 | 2 
           igd2-for-linux-v1.1 | 2 
      kismet-Kismet-2014-02-R1 | 2 
                     php-7.0.9 | 2 
                    owfs-3.1p1 | 2 
               linux-pam-1.2.1 | 1 
                  libvpx-1.4.0 | 1 
               libdvdnav-5.0.3 | 1 
               logrotate-3.9.2 | 1 
                 clapack-3.2.1 | 1 
libuci-e339407372ffc70b1451... | 1 
net-tools-3f170bff115303e92... | 1 
                  cairo-1.14.6 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
           libfreeimage-3.17.0 | 1 
stm32flash-4ac0566f188f39ea... | 1 
                    ola-0.10.0 | 1 
                alsa-lib-1.1.1 | 1 
                   systemd-231 | 1 
                  libffi-3.2.1 | 1 
                    dash-0.5.8 | 1 
                libaio-0.3.110 | 1 
                  libsepol-2.5 | 1 
               trousers-0.3.13 | 1 
                openssl-1.0.2h | 1 
                    ruby-2.3.1 | 1 
                wavemon-v0.8.0 | 1 
            supertuxkart-0.9.2 | 1 
rtmpdump-a107cef9b392616dff... | 1 
               qt5base-5.6.1-1 | 1 
               openipmi-2.0.21 | 1 
                      qt-4.8.7 | 1 
               tinycbor-v0.3.1 | 1 
                  gnupg-1.4.20 | 1 
                wayland-1.11.0 | 1 
                       unknown | 1 
              lirc-tools-0.9.4 | 1 
                  mono-4.4.1.0 | 1 
                    lftp-4.7.3 | 1 
                ipmiutil-2.9.9 | 1 
              libarchive-3.2.1 | 1 
            lttng-libust-2.7.1 | 1 
psplash-14c8f7b705de944beb4... | 1 
                  iozone-3_446 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                 ibrdtnd-1.0.1 | 1 
                   dante-1.4.1 | 1 
                  fbterm-1.7.0 | 1 
           linux-zigbee-v0.3.1 | 1 
               linknx-0.0.1.32 | 1 
          janus-gateway-v0.1.0 | 1 
                 php-zmq-1.1.3 | 1 
                   ncurses-5.9 | 1 
             ntfs-3g-2016.2.22 | 1 
                 lvm2-2.02.161 | 1 
                    nano-2.6.2 | 1 
               host-gdb-7.10.1 | 1 
libsilk-4268a02240c35c6055b... | 1 
                 gadgetfs-test | 1 

Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/d7a8a0eeea0a760d1dcb39e6bc978efe3bf0c8ad/
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/df420f4a32fef73c0bc51f264a7e242b4e4b6a0a/
        bfin |                 alsa-lib-1.1.1 | NOK | http://autobuild.buildroot.net/results/7db0a694f54cbc524438ed1cb50a5f8064258352/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/5c2ab91ca10b619658d7ba7931afce48fc15fa59/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/5568ed27eadbb201e8645c02343e7085f9a82e25/
      x86_64 |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/1e225d97a5afc9486ccffe6fe128bbba0f4a1fdc/
        sh4a |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/e2e356832a353b9d6847b651dbd9ebf81fd6da4e/
        mips |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/2bef0239e033189cad67708adf0b170d742ab5c7/
         arc |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/c86dcf3554f1e3eb9511adc567e827ce871a1ac3/
        mips |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/597d4b08af40738dbea0d9c771fdf88799a38e77/
        i686 |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/40bbe3232c90655ca19ca95a4a049cd9ac482003/
         arm |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/6eeab394e06df46f49d706dcb88b0c77a17cfb25/
    mips64el |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/c811eb36d5d8c95712200ac188de2eea28807d64/
      x86_64 |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/08353ff7bdd7dc1e40a879e3cb8808d265d2fb3b/
    mips64el |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/9d0bc5c6f53b93d5c9103bb902ed5b566d59295c/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/3c29d217a45c06a7a2c03eeaffd5fd70a29e5124/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/e258ba19ca5ae46463d43320ea7b9c81923334de/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/f0122dfada0c9cca607cfc45c76fdb1c29e40063/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/3fa7af5f27eda381243608280ec42db2dc3a39fa/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/fcc0cfcc6d38321f663414e7331f91c71622b735/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/bd161bb622aa05f576324cf4a208deeebdad6b27/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/cb02f44d4e153f705f3a0410d28382aad1d9b43d/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/6e84e52fc46927c13363639e37eb8ca4498591ae/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/cfab8e94904b2efd43ff6b5498633934d1a0ca9c/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/19d06695591bd7e62656d5f47b40e006cc3a1d3f/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/2853bfe247f06443dc9d1abf4b6f739a51164fc2/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/1abbdae426f1dd07b5a993c10f36296a21e259e9/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/14723447efae658c86cb4fb02b9fbfa8d22f8fd5/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/3cde41558f787d485708875878b5e35bcac6ead1/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/9a829d7e8f19941538cfb1714c107c808bbd7487/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/20258073cba84d0c9c4b55d6b012d57132435f05/
         arm |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/1821213d104c92f2feb768c1f2dbed6170c8e41f/
        i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/462c4e2ce0452020b4036fdcb02491ee093ebc50/
      x86_64 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/dc035d083e6e8d3506c0edce4d99646ef8bc6d43/
        i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/82489b18cad2dc785846d645dcc88df8f500a0d3/
      x86_64 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/70b12cf2a5a9e1e3d08e5dcbb25341cef0277dc3/
        i686 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/966c57356cf4c1c1d6f0ba104b70bc90c628c167/
      x86_64 |                     dash-0.5.8 | NOK | http://autobuild.buildroot.net/results/2f81182eb5733c9f4e23b380df5093978ea465ac/
         arm | dtv-scan-tables-0c92e5e5d35... | NOK | http://autobuild.buildroot.net/results/668692d3890de79e3f6e0c751ead31e0a12f9703/
      x86_64 | dtv-scan-tables-0c92e5e5d35... | NOK | http://autobuild.buildroot.net/results/d0ce80e7d76571946a88b64bafa99966148d6efa/
       nios2 | dtv-scan-tables-0c92e5e5d35... | NOK | http://autobuild.buildroot.net/results/2840ec3833a460047ea323f3214113ed08d8f9eb/
         arm | dtv-scan-tables-0c92e5e5d35... | NOK | http://autobuild.buildroot.net/results/e8f531bd4888879f276723b2615629232a29971f/
      mipsel | dtv-scan-tables-0c92e5e5d35... | NOK | http://autobuild.buildroot.net/results/d58d7bf248dd8c8d25b6a7b7c5c6b463eae7bbf4/
         arm | dtv-scan-tables-0c92e5e5d35... | NOK | http://autobuild.buildroot.net/results/b616f230024faab1f2e010a24d5bd86d90cd964f/
         arm | dtv-scan-tables-0c92e5e5d35... | NOK | http://autobuild.buildroot.net/results/ce248fa694c6391d5d7da5e76b58b7f084f7bdfc/
      mipsel | dtv-scan-tables-0c92e5e5d35... | NOK | http://autobuild.buildroot.net/results/316681ff8c35deb0bff0870d5121cfcf70fda28b/
        sh4a | dtv-scan-tables-0c92e5e5d35... | NOK | http://autobuild.buildroot.net/results/abe762475ce12cd06970aeccdb4f0b2bbb464b64/
        i686 | dtv-scan-tables-0c92e5e5d35... | NOK | http://autobuild.buildroot.net/results/a8894dd58b5a0564e6a24c34b6267cc238e04c6d/
      x86_64 | dtv-scan-tables-0c92e5e5d35... | NOK | http://autobuild.buildroot.net/results/c8601ffff0297ebb86dac3a4ad695b810d66e577/
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/0356a60ee779c59943525c8ad5ec34c6cd7a6ddf/
     powerpc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/98c1497cd3b491fd20328a82828a14e76e8e3725/
        m68k |                   gnupg-1.4.20 | NOK | http://autobuild.buildroot.net/results/d25425cff055a14b9285cefb0775bc138eb2f914/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/4bae116692188c8c3a9d0d3deebbd1ca40d83ca1/
    mips64el |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/3e84e132fcc5836af31ac0d8ee8a1a590c11cc4e/
         arm |              host-mono-4.4.1.0 | NOK | http://autobuild.buildroot.net/results/a5f7b4da11eb969738558e430954d4e2eaa61b0c/
        i686 |              host-mono-4.4.1.0 | NOK | http://autobuild.buildroot.net/results/f701d643dc6dbdf195afbe72949ba9f4867d8a34/
    mips64el |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/dfac8d9baed33467dfc21c8160e1d9e0ba2ff513/
     sparc64 |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/0ad3c388248d0a667a0ba2ce6f1c78d0295ccf64/
      xtensa |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/01d47b72c4f22d91ac9cdcb363a362dd656ab0b3/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/9c173b8b0a615d782c2bd4785cdecff7f464151a/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/daf2d7ec003d2ca295b611db29d3f41f688d55ac/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/d3a3224c75d9c6fca04793858e51f60594c52a6c/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/8f89b3774d6795edc4a618175c5ad67cca655433/
        m68k |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/a2ede5fa4e2e29aa0e6c4c7158ea6e82fefbb08b/
         sh4 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/ea3c79c25e38b157c4cd1556a9f39f278645bbe2/
        i686 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/c24b917f124396f32b90a0dcb5d9745909e5962a/
       sparc |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/071c4506e802b11a659326c1f44878cd913ba616/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/5296d8ce78bcdb2c450e1cb0f6573eba82a7e224/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/02cf7c70dec6d26878f78a22d1aa1ba2e19fa015/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/896685155e8a5b75daa66a266e4cb81b0bd48506/
      xtensa |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/6a6f16ee7b84b0bc891a3c94a731770081afd948/
       nios2 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/87f241a60e2286dd7e68c7aaa98efb3bc5efc582/
      xtensa |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/325c5e8a3792c669e078a2bd78c248e1a9ad3ade/
         arc |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/d09d6b9bddabb2dc9b774c450176e27362bd2082/
      x86_64 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/0ebfe57c0c9c9a5f80a71ff2b5c14c51aa566112/
        bfin |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/3307b84618729b9791e673c0c26ccd5e038cb6fc/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/3a818d49264e2817c25485df3fdd67a688b1afcb/
      x86_64 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/9f017b9972a8bf2c0247bed406781a7a06166e22/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/583a99ee18cca4a3ed2a9a24ccc21a64ae920125/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/28bc8f274259d19dbade0032d4d16daf1566bdc1/
     powerpc |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/da537a348596ec59c2d21b3790e04f403bc013cb/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/fcfd50a3d0eefd745d85b9da376928fd5d19f8bb/
        bfin |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/73c2dc68703e839ecbb2c1cff243f02a3f8554fb/
     powerpc |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/4890cc904e34fa911559ee4343c451647f955cc3/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/0983de344f1ef72273a928d55700f05509a81b7a/
     aarch64 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/2f0c91acc136f8ce68c9ac471638449cd6af5894/
     powerpc |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/2fe97df38ee759b17ec5dc3e293fb1afd276204e/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/5ec1d747aff720570920cfc64b2615b1d88015be/
       nios2 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/3c55b5c1904e6f31e6e1df0b4cb84299f732bda0/
      xtensa |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/6d3f8cb89cb74b168773bb179ee2f4e91d4c261a/
      xtensa |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/b6a0d7345d66fc170967691f2b270b6fdca2e1f1/
        m68k |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/0be06b7447225090b3ff3b88e77cfcfa3af51337/
      x86_64 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/0a6c7d51a1bde317035164f9583883c5dc87a963/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/f04675febe71ab24a986820f5e5a0b8ab53f5004/
       nios2 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/c857a71d900a1529a9e3c861b354bd447c8ce539/
     powerpc |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/e8743cf25178900af3d03922ab43a17b1604c9e1/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/0779d1d68e5731240cd4782fbdd2e8bc31b70af7/
     powerpc |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/7bb5c40d40d41a8be10cf126e842ce5987b0b84a/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/480f136667674fa4221f78af9684672562d69993/
     powerpc |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/7118b5f37f15641c681a97fe8f7bad0fabe7d2c3/
         arc |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/8102362f9c2d4725f66351437482c1248a517efc/
        i686 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/d63b1935c7ed6a4823c9f772d3436a851046c224/
         sh4 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/67b6600de5a472752535b06e95ecb4c7bb62c8fd/
        i686 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/679dc7f4039ab5fa4ceeb1ecc16a8be123c15844/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/ebe59cc09ee78d25bfe6704d1cf2eaf1fc023486/
        m68k |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/00b89f414c934fc8b523049eb752021ad2806e52/
       sparc |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/0448a2461405e3dd77f3c2f1ac8db07dda93f770/
      xtensa |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/6dcb930d00770f3730db0f40ad4676296d4ee4af/
        m68k |                   iozone-3_446 | NOK | http://autobuild.buildroot.net/results/603b2753bcf96a6989c83adc3ef169196db61b7d/
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/5035362caf78256bdf6925e50c083360e04f5c2c/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/2779ae6357cb4726fadfa74569de4826057414aa/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d3c2d4329827219ac3d68d037df1738bc5827ee1/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/7f1d00661fb30e094bdfcb21913228c545d275ad/
       sparc |           janus-gateway-v0.1.0 | NOK | http://autobuild.buildroot.net/results/bd7efb6efc9d4657bee6759c5a234d84de9890e1/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/853b18c7980a840419e8446522dd429921cdb961/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/d0bc205f5abd0ec026084a8d6ceef4e2d8084ee2/
         arm | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/f2c2462345aab332f7769a7502bb7bdacfad418e/
         arm | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/e1001d3d1cc5d0e19a08b59c0a87c56a80712f21/
         arm | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/b842f42d70f7be6c3cffb15b712cb6145b558040/
         arm | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/d5af307cd56cb541a7fab060e62be55816eb4bba/
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/cbf4f4c702559a50b3f1224b0d18d81d5993b991/
      x86_64 |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/c1261545ec34da41fa9152c5bec839621c63084f/
         arm |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/7c58c7457e89fde0fdecebe304e24a2f0fd3f19e/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/6492671eb7f00e0bef598bfe28c5233b9c05d19f/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/cbd1087e09d7f03e74dcc9069dd3cc9f0befc82c/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/6a1809ce003579c96255e05010ae96dc002d8e3c/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/0867ece3885eed0e1909ae7d628a508b0012c4ef/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/8a92a20c9eb44ab37f6dc786255bd972f525c1ea/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/7b43de18e18e8d5640ff81e29fc6ff4077e1a386/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/ca51354840a120b699ca44c4d51bb9cc24474e50/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/057fccd61dc9a130e5aeb6e7ce2cc7181d60262c/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/ebdca7527499955d6e1ebdca83134329871f6442/
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/1b39e2ec50953c5f4f855219301d41ba5827c38c/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/3c63d8486c362f20d449638b578e3f09a7f7a474/
         sh4 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/c46bb207c79b2ba356d7a6b8febcffebe55aea1f/
        m68k | libsilk-4268a02240c35c6055b... | NOK | http://autobuild.buildroot.net/results/cc257a182f81d34f9d74b927188ee92572aaabe0/
        bfin | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/deee4c7058f210b756c2d4291c498f4e370ca5c8/
        bfin | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/8969d41cbd1b402955bd8cda8e404d3ea545f175/
         arm | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/5c37b38be28d4004f13e56bc4d5dd50999dc47c4/
        bfin | libuci-e339407372ffc70b1451... | NOK | http://autobuild.buildroot.net/results/7505b57f3bb587e280e0f00327d1a01738eb1c47/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/adc3a396a05c0e355b705a49b88ea28b473968f4/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/0ff1225d7341bdd1df7e494eb4a5502184a08470/
         sh4 |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/6ea3f3721fc275b92e5d4d1d83903f1b57b65edf/
         arm |                   libvpx-1.4.0 | NOK | http://autobuild.buildroot.net/results/ae7ba1d5979ebe39aace628fa8ff2c8f08a70a98/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/d97bb1f013927712b04d03fa46a0d03a98d8421e/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/15b40ba8966ab665f3e3246f7408c2b2e39f9ab3/
     powerpc |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/018971ea9227b386fe25d3c264c7e80b843a9f68/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/eaff408b71c17edc9362900191760d50a5bfef36/
         arm |                logrotate-3.9.2 | NOK | http://autobuild.buildroot.net/results/cef16b5706ca96cf907cd55d38dcfde74cf0e16e/
        i586 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/4c38a17b05153c95344ab76e88b51d051b04994b/
         arm |                  lvm2-2.02.161 | NOK | http://autobuild.buildroot.net/results/4012120a85ceec9b15a86716300aa823be0f8bc1/
        i686 | mmc-utils-d0b46442b50794217... | NOK | http://autobuild.buildroot.net/results/7442959f4ec4805ca9549abbce3c1fdf8d7be063/
       sparc | mmc-utils-d0b46442b50794217... | NOK | http://autobuild.buildroot.net/results/9c5c870aaad85a56e1d8ac9215bcca57686dae30/
      x86_64 |                   mono-4.4.1.0 | NOK | http://autobuild.buildroot.net/results/0ad299dabd5fc4a76f0085abd787024aa1810068/
         arc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/fddcfec7739ca5257ea7eedf5764e697d6f332db/
         arc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/9dc396fb7dcf1997284daa5aea1a68550b884afd/
        i686 |                     nano-2.6.2 | NOK | http://autobuild.buildroot.net/results/ce6c36ed4546c3ae04389b00aed473c0cc4fad0b/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/02eca09cf880bbed16018509b2585dd325649335/
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/12a60f2a2a621fe0d1605922b950aec4022fec7a/
      x86_64 |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/0db8d99be2bdeda57efba6eb19202773fc416423/
         arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/f13127362a3921aa5265c4d121f923e2422d1965/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/8f5f61d34cb34627c330ffcc2eb333fa23c72af2/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/e20dda86bf8b5df4811220ad43beba729ca13259/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/6e84acbf40ab7885a29619ba00e6e87e92d2216a/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/56443e9f5f8058d8e75316f9fa51d86e391c17a1/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/731b0b0fbe33a9e46934b7f61a52299fdd8bcc49/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/d8223abb85ac26dfc4c7aebbdaf150b5a529d377/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/fc2d8ee68baa6dcea5bf6e15a23d944fde031c3d/
        m68k |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/8e9ada57128d8d82bbf9ee62190ca45513adc774/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/24f10ba28c2ed7bc2ca800812c125568cd52cb5b/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/3ca06900447571eed53d708e96efec95dbb05d4d/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/7544c8355fae6df689dd873bf054bdd9cf8d0d94/
        bfin |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/22a8f7a635851bf743bd99f908a1f3fff6d79651/
      x86_64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/70a1bcb149263633ae358ae270793d2d011e417e/
         arm |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/bb474a1ab8dbcd58108ccfa0839d38b340184cf7/
        bfin |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/3b589397ac235eeca58de79ceb6e3f438faa9e4c/
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/32c00d043b9579354ca1e8cf286c7465ab21a61a/
        i686 | psplash-14c8f7b705de944beb4... | NOK | http://autobuild.buildroot.net/results/c71052a524dbdaac1c7c5f671ca1f92357e8feb1/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6ff72648234f28e9cfb6104810ee5cabd31220be/
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/6e80c5678777857fadc7eb19519ef0ba8071e48e/
      x86_64 | rtmpdump-a107cef9b392616dff... | NOK | http://autobuild.buildroot.net/results/cd4a0c9374c6b856e56fc739a572b47cc2b76827/
        i586 |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/45ee2255df0a121f5218a43a68c159180b2ace15/
         arm | stm32flash-4ac0566f188f39ea... | NOK | http://autobuild.buildroot.net/results/e2f0b1c432a6af0b3cb2093042c756b0a489e92c/
    mips64el |             supertuxkart-0.9.2 | NOK | http://autobuild.buildroot.net/results/3b8716c3733bc7c5be056fe79f23e945ca310c63/
         arm |                    systemd-231 | NOK | http://autobuild.buildroot.net/results/6bbdc54c70756dc2ef101706dcc155b0f7329c19/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/5a4d13737b24e00233a4d157e40080b98253f5cc/
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/60b43ee137c136a7349ea465976622875b9caa67/
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/c181ca22f8cfc1a675d038ebe7936da5987a5955/
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/f146ce0ebd88e0f41fe25096351e2c30b702dee1/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/3a0e07c9f86466e6e82dc425696a6aa4c29bbf56/
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/b1305500555cbb5b959e5be11dee5cf75907f0ce/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/3c1e0e4672d0369b9e00c1cac066f7bd69a82070/
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/01651f54a8c36b1dbc8aa42b7cb26aec3ad20217/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/e3a47eb9797a30e3e33079d96902cbe7592a5fd3/
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/b9676da80b7ff972db7d4f82e6fff40a357f7264/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/7605c301f460398c2435f6b73d6d07c7d1022e8c/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/e99dc93062c4d46f9024133ba579c150f2090e2f/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/fae3ed08ce866bc9ea9f4c325c94eb49b8ad708e/
        i686 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/ce2c8743616eec57ae559ac44d8540635a65cfc3/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/758c5ddf9c499864f609032ac111d608d5a5fc01/
     powerpc |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/3895c05ffdbf91adcfbb8cee24354bfa0daaefe3/
     aarch64 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/63a3caac7e1e7b5ab268d9be3cd77617df619659/
microblazeel | triggerhappy-7e5abc69f21567... | NOK | http://autobuild.buildroot.net/results/76bb000d041bd0828d15aa04138e222a4773ce94/
microblazeel | triggerhappy-7e5abc69f21567... | NOK | http://autobuild.buildroot.net/results/b03500e7d85786c6eee8f0adc38801340129aa14/
     powerpc | triggerhappy-7e5abc69f21567... | NOK | http://autobuild.buildroot.net/results/dd05caf0db318a9287d239cc6fa5470ccdc2ce7c/
         arm |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/2ab057c6d0494b4ddd59b565e2c96f98439baf8a/
     powerpc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/3655c41321d6fa85715a120cefe50d3c7d287269/
     sparc64 | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/5c94444afd1e412c86f99d8c6e8b28bd8d53cd2c/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/0f580a5482a729b46b40801c0164ebc2bfc72280/
         arm | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/08eb7b7e1d810b600b853f0757cf72c52215633f/
    mips64el | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/13f8c10a5a3e752be8c104fdbc44c044f6f383f8/
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/c1ad8a258ad9abd9b46b780c9a7672e8474746fe/
        bfin |                 wavemon-v0.8.0 | NOK | http://autobuild.buildroot.net/results/9c78d32b5fa260ae27b388da1a224b85f436a752/
        i586 |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/abb5184a683e2020cf47fa37aa9e5a290df36b6b/
      xtensa |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/71acd50747608451cd177f4062d68771deda1c9a/
        i686 |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/ba68489050426d63353f16d673a7d72d586e7459/
     sparc64 |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/239a682c1bcff653b82d983883604aa773347d22/
         arm |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/ea2fbbc28c899057b1d9234bf671cc9778d8abf4/


-- 
http://autobuild.buildroot.net
