From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 02 May 2020 06:28:26 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-01
Message-ID: <20200502062833.CE3152049B@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-01
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 28  | 16  |  0  | 44  |
    master   | 209 | 139 |  0  | 348 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              exfatprogs-1.0.2 | 11
     python-argon2-cffi-19.2.0 | 11
             host-libsepol-3.0 | 9 
              ibm-sw-tpm2-1563 | 7 
         host-exfatprogs-1.0.2 | 6 
             paho-mqtt-c-1.3.2 | 6 
                       unknown | 6 
                    brltty-6.1 | 5 
         uvw-2.5.0_libuv-v1.37 | 5 
             host-gnupg-1.4.23 | 4 
                qt5base-5.14.2 | 4 
                  zeromq-4.3.2 | 4 
                 gnutls-3.6.13 | 3 
              host-erlang-22.2 | 3 
           host-nodejs-12.16.1 | 3 
                  apitrace-9.0 | 2 
              gr-osmosdr-0.2.0 | 2 
          gstreamer1-mm-1.10.0 | 2 
               host-efl-1.22.3 | 2 
              host-grpc-1.25.0 | 2 
             host-pango-1.44.6 | 2 
             host-squashfs-4.4 | 2 
                      icu-65-1 | 2 
                  kexec-2.0.20 | 2 
                 samba4-4.11.8 | 2 
               apcupsd-3.14.14 | 1 
               apparmor-2.13.4 | 1 
                    atk-2.33.3 | 1 
             berkeleydb-5.3.28 | 1 
              bitcoin-0.19.0.1 | 1 
               collectd-5.11.0 | 1 
                   expat-2.2.9 | 1 
                      fio-3.19 | 1 
                    gcr-3.34.0 | 1 
              gnuradio-3.8.1.0 | 1 
                grantlee-5.1.0 | 1 
             gstreamer1-1.16.2 | 1 
           host-openocd-0.10.0 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
             kismet-2016-07-R1 | 1 
               libtheora-1.1.1 | 1 
    libtorrent-rasterbar-1.2.6 | 1 
               libupnpp-0.17.2 | 1 
           libusb-compat-0.1.7 | 1 
               log4cplus-2.0.5 | 1 
                 mesa3d-20.0.5 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
                 openal-1.19.1 | 1 
                 opencv3-3.4.9 | 1 
                   pcre2-10.34 | 1 
              pcsc-lite-1.8.26 | 1 
         python-gobject-3.36.0 | 1 
                suricata-4.1.8 | 1 
                      tio-1.32 | 1 
                   uacme-1.2.4 | 1 
                   vlc-3.0.9.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/17648df66aafd0d0e0b56e2695124feff72bd779 |     
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/3febc64225a5c71718386aa34b6050c1947b5cc2 |     
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/61f778ec726a8b01140ed85d5eba22442557960f |     
    m68k     |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/6eb13116246e30fd96f3405f808757a3974d4eca |     
    arm      |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/f0e9875e07bd66126ad5969d4596402c7168e63c | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/faf8512dbd1e8398d3ff7ca9f1cf6ef0116f6218 | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/243e3971d3c981f0b68eec94cb0bff28ff732c41 |     
  mips64el   |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/82f0537510500ab272adbac51a5916672adca230 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/175e2c25ea9a1f9f4205c2932a5469a12c16b6e8 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/c2a6917ab851db50adbc7fe65bf770dde4cc846c |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/0895acc61ba3c159be21a87a2b24d797769cc71c |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/9305fb7e762e915126cf21b907eb8b46b47898b6 |     
    arm      |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/60fe70f3dc3cebd16c23e176e8b992e72773fe04 |     
    mips     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/cc6231ad14b67ccbfeabaea3196f793cd397c8ba |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/d70368595716a57879e52458c5670641ee03119c |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/45f46cbc7edc95f9d7724413c481b93edcf39a16 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/7f66f961e5d8f70b211e92314f4545ea5c833921 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/1a09f8561cf3fba10b717810e6f6edb6f7cb34d2 |     
 aarch64_be  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/83bf399efe1a3688a39a13798c5cd22f31e817c3 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/958fc21439f1674d1b84bae0b85217cf8e79175a |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/5a63a232ac951d6624a474432202b6d9de75a405 |     
    mips     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/096b4b7851adeb10d40ad0641a887ed7fe0ae3c4 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/f4e4b3f2b2fbca5cb459d0174c72827b6af4fefb |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/3a77eccf1ebb70d6418a8f3eca9ad9e37095766c |     
   xtensa    |          expat-2.2.9           | NOK | http://autobuild.buildroot.net/results/243a80f667fa08598c71ec5dda33dd0c8eca8536 |     
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/6c9ca7d5be20bdeb0171005ccf1212c3f3577379 |     
  riscv32    |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/bbf6c33d2fb79fceb0ad3d66ec097b1fc65e738d | ORPH
  powerpc    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/01e4cd09b53ad868a8ea5015d80a9d1c125fa43c |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/e8f30bad54fac454f390204dae71ae63e17a70d1 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/3cf3fbb65506b8b88fcbdc0eb56f4c57486a64fa |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/2eb58199dcaaed73175d839dee6540b7f2f41c6d |     
  aarch64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/ca97de02d7970e8ff2c5c83ed0e9ccaff61f6fc8 |     
microblazeel |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/c9f8c0553018817af8b83b25805eb918ef06686c |     
    i586     |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/e07f2d3801c91d4b41e8c0532a2470f3b97c54f1 |     
  sparc64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/17b1b3100ee86c9069a57a7ecf91b2a9afbb4f6a |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/a37765b110066c8056e8f7816c28563701ec2ebe |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/f2f0cdcad4bed4d3b5592467a82e42ce76884438 |     
  powerpc    |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/1529a2546be16d965532940a4789e336ef45da9c |     
    i686     |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/942a6aa2a516506dd3d6fb185fa9c6840c757a60 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/769d8a061d1dda29b430eda217445db0156bb4ff |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/ab02a65b40e67a571e5ea233e6ec4ff453aee34d |     
    i586     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/b606b00f301c79098df5ae26738819e6f622a479 |     
    i686     |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/524d1334edef4543fe19726d72a25f902d772a0e |     
   xtensa    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/6962b917f1358baf2337dfb57a7c8e6a60ff6758 |     
   mipsel    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/4436ab939e05827d6e063256c51bbfeaba469457 |     
  sparc64    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/e68f27c70c2afb2ebdd321ca3ca28f96b8908110 |     
  nds32le    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/8350cac690b61f3ced386bc8f9e63f426ddf174a |     
  riscv64    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/02715856838dfcedc20831c87e25b2b3e66883e4 |     
  sparc64    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/78db0f3501e207c4ec78e06469a2ac379895c865 | ORPH
   x86_64    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/fad8282e55e9ffe41092709ab250608e2c876040 | ORPH
   nios2     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/aa79a98a2486c80cbefabfdfdb9bcb41648de76a | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/b9a04b5716af4bac4e5ede9a5aace30fed87071f | ORPH
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/caedd8d4230833b4d53214dacfd45c4a0f557694 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e6cedf66af048557b0dec42c47e350a041d90707 |     
  powerpc    |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/1479974d8980eb6da4d40d4d0a73d88095fcf147 |     
 powerpc64   |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/701b8956e47296c005fbd8f6dcd6d2f1ce12fdbb |     
 powerpc64   |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/3d133ce6e83833f0c70a91270d0c49304c3413f6 |     
  powerpc    |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/aa9bd841acb2aa6fffa876473c7ee4f3d3e1b42c |     
    arm      |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/258bed06fdfc9f2c744fd45e6c3739f467a89453 |     
  aarch64    |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/0193ab3ebcb4dbabe0492431049b4335b29e0711 |     
    arc      |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/938103c084cb5aabb4f2b12b7da42877b813724a |     
    arm      |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/c95e868cb23fe9da4d39a0343e5067e7d0f68d3c |     
   x86_64    |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/0c9932972eba0b7669dec624b940fab12d0831d2 |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/966eda411ad46cb9d9c77e930350185e77fc1073 |     
   mipsel    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/463a5741af39625d22002c29ee7f3921e4a38282 |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/56bb64d3f65bd5be6a2a1afd52a4550cef0142b3 |     
    arm      |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/afe800cfaec7d8a5ac35462ee722ecb4780a2a1f | ORPH
    m68k     |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/4e3b2420c914d535b32b07af845b4f08d654ac92 | ORPH
    arm      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/71d86ad963e451f93beea13517553837863389e7 | ORPH
    arm      |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/e0e357862079ff76d4ccf32b25a4804ca938b79e |     
   sparc     |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/190cd614aad04cfdef1e339a1e6a289db4c96eb5 |     
  sparc64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f12c4dbc01f526eda076f7eb7abd030e391c32cb |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/782ee2f7117a4f02eaf4338a2e22306ff9949120 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/c25332e8822539bf686bc92a22217d895a3cac04 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/fef9062b961bfea45f2848a110e8a7bcabad5966 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/70c1994950b0188fde6ddb142f3218cc468ecc10 |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/537b83b6c502e451d571d3f2d0501687c6a63b81 |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/5b2a1745cc1fb1d8780c574382b04493727ca5f6 |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/3b67cbd5ff48e51efd2955d285064bec219d152c |     
   x86_64    |            icu-65-1            | NOK | http://autobuild.buildroot.net/results/95e19a7126ab9fb156f2d8170af501a1b98e6c28 | ORPH
   x86_64    |            icu-65-1            | NOK | http://autobuild.buildroot.net/results/f67cc339e76258ca65dca3916a45bc3339644039 | ORPH
    i586     |          kexec-2.0.20          | NOK | http://autobuild.buildroot.net/results/905178cd793dc2b9b26814f7736186b33b468741 | ORPH
    i586     |          kexec-2.0.20          | NOK | http://autobuild.buildroot.net/results/69a2d755f1af0f8026f1b48d08fcdb6217ca3586 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/ed839a32e756f22306c4a1e3077a61aa918cede0 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/85d80e5a4d885019c2830c16a61922d7efc9922f | ORPH
  riscv64    |   libtorrent-rasterbar-1.2.6   | NOK | http://autobuild.buildroot.net/results/73a2bfdeac4f7dee2e848b77125dd205f4901fb9 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/223d5c622f1097cc8b7e6a9d6d7475f4c94614a6 |     
    arm      |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/e59d90ab8cb3e7d5f06e8ff568da199e76c96d47 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/a9da4692651e4c4d9de0dbfe0214c072b0a715d3 |     
    arm      |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/a2b91526b352faa7f12b512db21bdc5bb4995cbf |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/8b69ce915b3da995c124ad1496f7b06b48580746 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/6badc0b429dd4f7b6697e2564ffab16ba339dcd8 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/514231ec5cfe2896c9e288840bbd934bf101dab7 |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/59a80fb7cc5ceb833d4f42d5ad18f0cb0fffafc9 |     
microblazeel |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/22adcfd0d4d870f686e1201a0f63ffda0cbbfa90 |     
  riscv64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/5f8276d4b75851f8a45ba852f1523e0ce8239bae |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/4e4dd152006dc8b1b2ae5e99aeae46d0427db777 |     
microblazeel |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/53ff10fbb28602dbfdc25fd4e4d2d9fec688b9cf |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/831ecc34b51ee2be82a3c25f5ec94f0dd2103655 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/c0be9341d4df389f11e8a48dc3630cb388ce44b1 |     
   xtensa    |          pcre2-10.34           | NOK | http://autobuild.buildroot.net/results/6e60884076cff40c80b81c51ea471957e5cd3b11 | ORPH
   xtensa    |        pcsc-lite-1.8.26        | NOK | http://autobuild.buildroot.net/results/9ec88a7c3e077fb9901790b6fb8cd3494c2b658e | ORPH
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/4aa7cb345bf14f49b1da59e536bece08447a95f9 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/87dd6835a60618a494b2bcd4118fc102d583c0ac |     
   mipsel    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/7409627e0e0047299363bdcdd9e1c9376eac26ac |     
    sh4      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/e561db70d8fc76f92bcdf04fe4dfc4f7dbba2946 |     
    arc      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/106cdfb9aa07fd3197221f508c6a487eb9b37783 |     
    arc      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/238c59cc22d9c34c809239ea70e56cb4f5b708c3 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/3aa04e83ecd2448d4036c099ce9b1f4227cd7808 |     
    m68k     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/2dda42ed5dd68fb65028333a3c8a32b7ec5bd9a7 |     
powerpc64le  |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/49bebea819df1a3c1235bc8d16eed26d3a5294bf |     
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/aaefa3708d0cea40362bae9db4cf09edfdd38f23 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/338cfa20c2ed07cdd0e48935f76237bdba40ac60 |     
    arm      |     python-gobject-3.36.0      | NOK | http://autobuild.buildroot.net/results/d03e8dc321c15a7a7d3275707b06affab022fb99 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/7df87dc603f65e9211c4d909c44f95c31cbaf2e6 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/940ee9f8fb5d1fff9b1af1508a06406c83ee1381 |     
  riscv32    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/b2472748a0a9937ff581a488604dbfbcf63381f8 |     
 aarch64_be  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/18c930132fd29a23b7fa26014b7adca40f6ae8cb |     
  mips64el   |         samba4-4.11.8          | NOK | http://autobuild.buildroot.net/results/b6dbb2127d252aa7e7eb8111ff1077efc9a14f2c |     
  mips64el   |         samba4-4.11.8          | NOK | http://autobuild.buildroot.net/results/a08b55bfb2848779de6ebb443ad6e2e83d05dfc0 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/36a5d62c4b8cd73150f6c41d77af5644a0d586c4 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/7b3cccd3d18018a7d666679f8e12c29e35a01035 |     
microblazeel |          uacme-1.2.4           | NOK | http://autobuild.buildroot.net/results/213e7bb9e31efba4d80cc46998b2c71f6f177958 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2b906848da499591f71a5cb069207d623784652b |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/2aae231a212a1c0c6e69a1e55db20e8c4880ce09 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0c99dadb26a9ccff92d8e007f0ff6ef3a5725e72 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/ed3cfce07b592568232b8e4ac93a6d1bbd8967d9 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5cc57386c9163f33565b7a8cb937fa24f12d3dc0 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ad4592c122089bf020f251586feaf147a4e5f660 |     
  powerpc    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/976780506240d32bdb32ed84fb4e0eabbec3cac8 |     
  powerpc    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/0df78a8af697168edd54b3c2ea95566794d4acf9 |     
 aarch64_be  |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/81dd4df60e423d71eb03fd084e71029958288118 |     
   nios2     |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/be4e14ba199972f9364a554ddbde47b248d9d144 |     
  aarch64    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/941faeeb2fef5abd9e5e9e292d9437b429e2ae5f |     
    sh4      |          vlc-3.0.9.2           | NOK | http://autobuild.buildroot.net/results/986b004645e6492f4cc770574e782046dd873ea6 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/b0d39110b697c600255a584fe8e9ef93101cf2d3 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/54096987bcbe47e53f6f68c72500367f22382aef |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/1d9535933703b962b4eac09483b6feab6348f2cd |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/c4893ad1480b8ed692b821e11b617a7de4499f33 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

             libopenssl-1.1.1f | 2 
            flatbuffers-1.11.0 | 1 
             fontconfig-2.13.1 | 1 
                 gerbera-1.3.4 | 1 
 glslsandbox-player-2019.08.23 | 1 
                 gnutls-3.6.13 | 1 
              host-erlang-22.2 | 1 
             host-squashfs-4.4 | 1 
                  ndisc6-1.0.4 | 1 
           oracle-mysql-5.1.73 | 1 
               protobuf-3.11.0 | 1 
              python-pyqt5-5.7 | 1 
                   sdl2-2.0.10 | 1 
              spandsp-20180108 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       flatbuffers-1.11.0       | NOK | http://autobuild.buildroot.net/results/c617338686da52220e5150d9590775ae552c848b |     
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/68991c05b3ca13f85cacfeb48a66983c4a831443 | ORPH
  riscv32    |         gerbera-1.3.4          | NOK | http://autobuild.buildroot.net/results/93f16c1d6952ddfb8cda8cd6e9cc0f92bc03ad0f |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/52b026b1fe402c7cb1c86d4071c5ea9125b280e9 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/d21a6d3860ad4395d6a8058fd02a89b818cd6dd8 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/fb7244161960b28027ad345134d3907f8271c26a |     
    arm      |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/770f9fe41e524194fcecbda4cf5cccc1d1f4272f |     
    m68k     |       libopenssl-1.1.1f        | NOK | http://autobuild.buildroot.net/results/e5ac348a0aa674ca6af1e449f2226ba5f2bd289d |     
    m68k     |       libopenssl-1.1.1f        | NOK | http://autobuild.buildroot.net/results/0f9aee9a5c91827d4698d3a30db17751f2104cb4 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/42d250466931463d68657e2640ce4676ec32b89f | ORPH
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/8577412f5072922f6ec3e57ab56b5e0d907a9212 | ORPH
    i686     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/389058bd520675056a9fac28f25571434771e8a4 |     
  aarch64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/7adc37988c4cbf7b28be24bddc9930ef2106f7a5 |     
  riscv64    |          sdl2-2.0.10           | NOK | http://autobuild.buildroot.net/results/989d47af2e0412913e8dfd3bbbb87d09872da4f6 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/8f31e20c33363af8b482cd15622cd40e7731b5b4 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/4d257526ddc4105457ca34150ce81e5485a5bd14 |     



-- 
http://autobuild.buildroot.net
