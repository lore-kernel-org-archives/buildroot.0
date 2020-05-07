From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 07 May 2020 06:27:15 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-06
Message-ID: <20200507062722.77E128878B@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-06
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 25  |  8  |  0  | 33  |
    master   | 159 | 110 |  0  | 269 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

     python-argon2-cffi-19.2.0 | 10
              exfatprogs-1.0.2 | 9 
          host-checkpolicy-3.0 | 7 
                       unknown | 6 
                    atk-2.33.3 | 5 
             paho-mqtt-c-1.3.2 | 5 
                qt5base-5.14.2 | 5 
         host-exfatprogs-1.0.2 | 4 
             host-gnupg-1.4.23 | 4 
                    brltty-6.1 | 3 
                 granite-0.4.1 | 3 
               host-efl-1.22.3 | 3 
              host-grpc-1.25.0 | 3 
             host-squashfs-4.4 | 3 
                 mesa3d-20.0.6 | 3 
                  zeromq-4.3.2 | 3 
               apcupsd-3.14.14 | 2 
              bitcoin-0.19.0.1 | 2 
                   cvs-1.12.13 | 2 
                      fio-3.19 | 2 
                   libnss-3.52 | 2 
                    mpv-0.29.1 | 2 
                suricata-4.1.8 | 2 
               asterisk-16.6.2 | 1 
                  c-icap-0.5.6 | 1 
                 gnutls-3.6.13 | 1 
                   gssdp-1.2.2 | 1 
             gstreamer1-1.16.2 | 1 
             host-ninja-1.10.0 | 1 
           host-nodejs-12.16.1 | 1 
            host-python-2.7.18 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
              ibm-sw-tpm2-1563 | 1 
             kismet-2016-07-R1 | 1 
                   mimic-1.1.0 | 1 
                mongodb-r4.2.4 | 1 
                  monkey-1.6.9 | 1 
                 openal-1.19.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 rocksdb-6.6.4 | 1 
                  rygel-0.38.3 | 1 
               target-finalize | 1 
               wireshark-3.2.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/964b95f60bfc93f6e14393d8f582b07092852b7f |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d188cee9b0e54d169d17d74def92200710eb6ce2 |     
   x86_64    |        asterisk-16.6.2         | NOK | http://autobuild.buildroot.net/results/c4eda63b844d6b76d7e7a30e4ea0eacfaf47286d |     
   nios2     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/e34a4d9f4b45fbf50edf260e966ae510016a2c17 | ORPH
  riscv64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/88bf0c885a4c41f757953aa49ce7b3777b08cb69 | ORPH
   nios2     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/a95ee1aedd1d0147c4a376233d45357938f4123a | ORPH
  riscv64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/5ad4c03c67f785415a3e352b8fcf55dc11bd3950 | ORPH
   nios2     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/1ef7230fe9d48c4de2e15ab3846c87c6ba2135ed | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/d5ff85958b2c67d3848d64e4df3bc9723427c5a2 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/6f7ce3a956143d0a19d644a0b95688feb0d9171d |     
  aarch64    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/9af56275b5a9d9c3e9e4fc9be4fdba3ba1e98d3a |     
  powerpc    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/4733cbf6c569ab544d9b6e23930632d3cd73f2ab |     
   xtensa    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/2bea179713e4ac2b9040a9fb745101bd092203db |     
   x86_64    |          c-icap-0.5.6          | NOK | http://autobuild.buildroot.net/results/de87fe449a6ea54266c2bf3c0f73ac9efe81d9e1 |     
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/7df470af0ac6cf803c2ac540b1e0a44acedac9b8 | ORPH
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/a79fd5ab198786e5036c4b5a2d12cbf0b765e9b1 | ORPH
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/ee6af288d13f532ab42bb7f9c50b4f49cac91086 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/ec476854752b3868b100fdfabfe57701a4e8899f |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/3bf258c00d3e3ec66150a0f160ea5a08bda877b4 |     
  sparc64    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/67d79c1b9fc52fa2f448cc9280b541a4ede323dd |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/2d7af7d16a0a611f8037d3516c9b7a276057703c |     
powerpc64le  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/3b581efcd90aa8a03b913f74a51a06f1acd41e39 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/15ab765f2d8b9bf791e07267797b0ce7bbb36615 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/9ad8267f0650cae7940712a6330390fc362d1a1e |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/7c539c5ea8352668f0a841212ef2d958e4050647 |     
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/fb8f3ab79e7b4bbfb3bf2547b0ebbcec6a531f25 |     
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/ca6dc1d9cb63f9e2d3b9e4f61a727fbe2a6cde0e |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/35c52638cbb166f90b94c637df30bb8bdd96c8de |     
   x86_64    |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/74ccf135dce15bb938744deeef6f24723fceafd7 | ORPH
 powerpc64   |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/4ed5057653d136f97f31ae35838dd4ce4bf0815c | ORPH
   xtensa    |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/3276d85123ed1e7de98c2b8437a4bf47797fe10a | ORPH
   mipsel    |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/fa57443502f0a43333b0ffd48711c3c790e2643d |     
  riscv32    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/46e47df029e59bba67df6734f2bd907add72c053 |     
   x86_64    |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/2bcdd26c397d0645fbcb95a953647173b80adbd2 |     
  aarch64    |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/249fbc4c10483dd1b18667034dd2fe2f152a637b |     
    arm      |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/1999824770e618e77a65c02a0399518727ee785c |     
    arc      |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/2fb9a37cd3c502e4d200f06dc54f501adda15515 |     
    arm      |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/3ad6803d8cf8b0fb4a622ad1a559f13705d522fa |     
   sparc     |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/7784b894ee616cef5a338384b290d38a03852e33 |     
    sh4      |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/51ad52e09abe916306cc7350735ca3bdddd2e345 |     
    arm      |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/37eb3e079583910a9ef42c7b7e8cd5ab3d7e8124 |     
    arm      |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/720123d3e43db469985a95405504975826c5de62 |     
    arm      |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/7f06a0608db9a435bf13f43223c9e0db62a6274a |     
  mips64el   |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/ca11dc8821653ed35b62721137bec755d92f7af5 |     
   nios2     |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/e9e7a298a75a26bcef54a4cbcc95e7e9d0e688a4 |     
   x86_64    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/1576e0745d4c299e03c64dd1786cbf15c382c67f |     
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/47503d50c6a24aa252ce3e8f484f178443e6cb29 |     
    m68k     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/9f3cd8ce7ba46f07f1e16660c9630d1c6aba7883 | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/2d87c79de62c00de2998e88ccc733bfcd5643a73 | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/bcbf26754e31c69c80402aa2095f38e795f488c8 | ORPH
microblazeel |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/4a1fc179c35bd8c107949129a972f51b362a4720 | ORPH
   sparc     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1653b6dd45a8aef077bd4467133b9eefff7f9c3f |     
    sh4      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/eb145bb0a20982cf4973734c0bb4d06a33a75e6d |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/62262c30885c6ccb6650ee1799957660a57d65d1 |     
   nios2     |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/92f70f46acd6beb058032e72a8b1a3c82258a7a3 |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/069cabb75754694dfdee494b2dc61651693097f4 |     
  aarch64    |       host-python-2.7.18       | NOK | http://autobuild.buildroot.net/results/8238ce8fb7267e54a0bfad06d58aed0cc33d508c |     
    arm      |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/183189984720a7941cec1c98bf3d22c270a22d76 |     
    arm      |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/abab9579ea0830c49c886d8ff1bab59c587ec317 |     
    arm      |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/5db2abcc728d11f95746ce69dd24ff8b096ee5cd |     
    arc      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/6510fc6e831f35da0489f5304f66babb0a006a18 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/1af35a27564308776aed89763e952f584b0f0f9c |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/e1fd45efae70c1d9cd56742067e37858398e3f03 | ORPH
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/59e39d70e4366356a87e98c6d2850c694d5054fa |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/0b707cf9416857f8be1d2f3033dfaf6f3275bee0 |     
   mipsel    |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/5d8eba6d70e7d093d03fd5369573bc077c6fae7d |     
    arm      |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/f415dff72884125778c56543b52f94f4c27b3a47 |     
  powerpc    |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/0bd97f1bee8a009519d80e0b531537b6fe97ee3a |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/fbc5c941f82bacf02cf68b0acc8a9cb56bfc5c75 |     
    arm      |         mongodb-r4.2.4         | NOK | http://autobuild.buildroot.net/results/2604f8baf51b6416e491641191aabd5001d9084c |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/ded7f9ee908b0d09428a90180f83112e624cce01 | ORPH
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/77a51dfb13aa989881f46560362a568d9d338bc3 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/0cc524235dffd8864e20cf9e5ee37c09696b4cac |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/2568a11a736a298fdaa42189ce7f9a3e155bbd3a |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/c2ea0456967c737b3982837eff66b5dfb618566e |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/e044f03ddc6418a132a10b23e37ed7cf1e3cc13a |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/f5f09671cbe608c4f497b89bd8b1fb0728f52f63 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/15ab0001ff3159be5565b8b7331fe3062634dc34 |     
  riscv64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/32acfb364e7824321c79a9dc44dd61b5e19cff02 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/b7483c064111ce62a8f88da64971450a259aca4c |     
  mips64el   |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/630287ec52cf791842827a8aab985edad7f241aa |     
microblazeel |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/6caf6949e3c389036386e4161c64c05b9aaa65fc |     
  mips64el   |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/ad722aec4df29a0b8ca842ca33117ce8cc9f723e |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/51fbeea95a0c983428bb16243e3efbc1c9d48022 |     
  riscv64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/88f136d09474de00f8e27c5169674109fe4210d0 |     
  sparc64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/ce6d96a65b8653ca555dc4aa670648c5e4d3e3db |     
  powerpc    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/26b0cdae3623537e63c34cc6038516bc410e12e0 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/6cfb4e3505a04f38a9bdc057a58cf55fd26dae25 |     
  mips64el   |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/918522f64b96e9d356675145fdcfbd08838faf58 |     
   xtensa    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/b142f1f9a1adace85c1334e931a444ba2024d7bf |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/905f308d92c2d2008f09af06b78453eef56f8925 |     
  powerpc    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/2181429e95f63d11d25663e501e980e9778e285a |     
  powerpc    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/7639545c4c5c454939246b3f607d86c5ae4af62e |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/5ddab2ae36b61b5abf8a9c1992d8321a7206e1d7 |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/20a906da92ff732da458987a99b19e7e68bb47e8 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/7183a43d884555c5f4859167e2346c04d9a74ad3 |     
  powerpc    |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/7b29ae1c3c6597541fd47f5f1d6fdaa27278b7ef |     
    arm      |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/11bc7f4e1c54f074dd10a995233bee45c293e488 |     
   x86_64    |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/145dcd547ea805aa253324e35da89e4e0ffbde38 |     
    arc      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/6ff1ceceeb71e80b7a0b1d436aecb4890e7fc620 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/01fa14fb327e4166d848acf7f61327ea3360dd58 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/28054e97b2acc2cc2464850c4c1c7a590452418d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0b993c2e2b2539996c4f1e7841efebb86615ebfc |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/25bf3a2146bf50789dea126bb7553bf6679ffaaa |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/e7208296888ed6de3d5fa290003390cede33c7c2 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/8aad0e7e0f401f3f0d0764eb2daf6002f07e34e6 |     
  powerpc    |        wireshark-3.2.3         | NOK | http://autobuild.buildroot.net/results/34d630e7ee7bc1ea9b4ab25d3a9c9ac27423d867 | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/2029359e8549c0fc6b2ff18506d9fd24e46df5a1 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/c1cc4c274bc1880be8dc8c4e1bcba10f254f1311 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/f44ce8ff751e84303ea6e0e5c6e6aff8301c1e61 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-perl-5.30.1 | 2 
          gstreamer1-mm-1.10.0 | 1 
                host-dtc-1.5.1 | 1 
                host-go-1.13.8 | 1 
             host-libsepol-2.9 | 1 
                 mesa3d-19.3.4 | 1 
                qt5base-5.12.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/603e6ebbe078b094e0eb09b17bcbbc30fe49b7f6 |     
    arm      |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/b77abe58da8ffb5c099f0a5eb88f66c81f1db13c |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/e68d9ef6407f3afa74b08a22d46b9d2cc1e5eb6d |     
    arm      |       host-libsepol-2.9        | NOK | http://autobuild.buildroot.net/results/d92abdd8c923d199c8055cb3f7b1bd47939bde38 |     
   mipsel    |        host-perl-5.30.1        | NOK | http://autobuild.buildroot.net/results/7a05655eade91a7d66f63a58dd68cbd435ada221 |     
  powerpc    |        host-perl-5.30.1        | NOK | http://autobuild.buildroot.net/results/33ee8957de62499e5264e88a3c344e934c0033db |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/345bba1cf323f14b82cb7d12ba5a1ca3474caa6f |     
   xtensa    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/9527d3158520fe71d8ab9c9e725bffd0a6dba6b3 |     



-- 
http://autobuild.buildroot.net
