From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 06:17:30 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-16
Message-ID: <20190917061735.DEF1D84B39@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-16
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 16  |  2  |  0  | 18  |
  2019.05.x  | 12  |  2  |  0  | 14  |
  2019.08.x  | 10  |  3  |  0  | 13  |
    master   | 119 | 46  |  0  | 165 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

            wpa_supplicant-2.9 | 9 
                       unknown | 5 
                 libdrm-2.4.99 | 4 
                 host-icu-64-2 | 3 
                      icu-64-2 | 3 
                snort-2.9.14.1 | 3 
                classpath-0.99 | 2 
                    flac-1.3.3 | 2 
             openjdk-12.0.2+10 | 2 
                suricata-4.1.3 | 2 
                     apr-1.7.0 | 1 
                   fio-fio-3.9 | 1 
                   grpc-1.18.0 | 1 
                 haproxy-2.0.5 | 1 
                libgdiplus-5.6 | 1 
              micropython-1.11 | 1 
            python-sip-4.19.13 | 1 
          qt5multimedia-5.12.4 | 1 
                    strace-5.2 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/caa4459daca752db014586f9d10886b3455df83c |     
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/1715ed7891ef5020ad15f4b61990539c1aff72b9 | ORPH
  powerpc    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/ea38bf523a7407e8e488bdbf3b02201bbc3457d1 | ORPH
    arm      |          fio-fio-3.9           | NOK | http://autobuild.buildroot.net/results/ec93c8e7f046b081aaa9e0a76708d61ba1ab921c |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/c094de569e54a7b17c995aaac621c50fe58a940e |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/5182e342446b36922525497e5bbb6a59c582e383 |     
    arm      |          grpc-1.18.0           | NOK | http://autobuild.buildroot.net/results/42eb63a89228d340cab05c7ab65fab9b02814689 |     
microblazeel |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/512904ace780508de5e3a56b0094bbe6287d751e |     
   sparc     |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/ea50ffc133b730f28fe13cb5727db311f826c79c | ORPH
    m68k     |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/b0f54189d311f21b82e050421c72ae3bf12df7d9 | ORPH
  mips64el   |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/24bec25635cfc9b06f0deee25b18337013f65841 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/0fd157a12b2a2c6abc3ddf2064c4037af5502922 | ORPH
 powerpc64   |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/e68779c94449c426e358d484973c746dc929dc5b | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/7146b1c5c070243a6af121f7838d9571db4c290c | ORPH
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/bae458b9964ec23a08dd77f8ab27a350f4481a9e |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/334d25cf9ea71af697049c9bbd18f4bf498f7faa |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/32a45f87bf1eec5525e276f1d093102c5320d3ee |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/c4fd659c94f168eaaa596b7bf3308ba2690cce0b |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/9029b9ae6b2c41735a32587468a4221f8aaa270e |     
   xtensa    |        micropython-1.11        | NOK | http://autobuild.buildroot.net/results/12c0ba526a41681c3de1d78b425d3f170b4a336e |     
  sparc64    |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/67d35966f4e74dbdc79ea57c8066712ef1a38fd3 |     
  sparc64    |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/c47f3cfe19c56eb826cba3675999362c43e4f935 |     
    arm      |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/8beafeb334b2c252bebb49f5d75ef6b26431b57f |     
    mips     |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/691be514a5cc419cb8b330283381d444b7b6553c |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/ff59d5a81811e31d51d7c45e31f36da24ae40112 |     
    m68k     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/ea03fefbedee7d3962b0aa3d1e981b2dba1abdd6 |     
   mipsel    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/82b686bfd70a263a8ddb5208e266374acc8eaa29 |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/d4a758db7685bbd75b888317d715207bef09ba0a |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/52d08baa927652e21225af6733f66ca4c3921e27 |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/bea5f38899283331828e9230012429f3cb56f19f |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/9217bb4fd808904a458fab4bf6b837adb8d3a4c9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/44300dc34e359a14897ede578a405ca70882e02c |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/3b1f4766f42af38fe95a5f472bd49df4f9ec9b1a |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d8a92965852a95019806441e013fa87485ec3d01 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/102c62e9049c317b8c2775c1da41cf20a5307171 |     
  mips64el   |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/c7d875e892198e9cbdd9e6b3d01ba0426cfcc173 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/5e9e49392ac23396c97f24529aa8c67fb8b60e28 |     
  aarch64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/3255a1ba524ef821a8d2574416b6ddfbf4fd3dca |     
  mips64el   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/c6ba55fa8e6779e36ebe7e6ee8959dfba0bf2d54 |     
   x86_64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/4da2340557bf3bf79bf54ca51d5983add6e00d07 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/e9ae087a4312ddb7468c64a85dd01211f795ba0d |     
   nios2     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/f0156a2382c8cbbeca834ff9628be457d9ef2b5d |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/52d5f6155d335772a394ac6f143f90ecbf2620e1 |     
  aarch64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/1c17cbd083a421edc402137c9b14f5eebe9b3420 |     
   sparc     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/33ba0e22a7e27d3fb9813f640f0d470b8f60a2af |     
   mipsel    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/545378271eb26eaa167f39ca0c78d4dac9b9843e |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 
               wireshark-2.6.7 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/5f35c5bff82981d995cade4b9c5fbc575cd503b5 |     
    arm      |        wireshark-2.6.7         | NOK | http://autobuild.buildroot.net/results/26dd76cd12e87572f9e81138da5282ac6c5d3e2e | ORPH


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.35 | 2 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/6c7e6bb7b893606c0e35415fb5cc1ab45f473632 | ORPH
    mips     |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/2c937d9af6cf0beb71c217fe4054b51409289c92 | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/76e0a39d153e11403269a6c87c05e1280c16c3d5 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/6203dd9bed678e3cafe552ba16e2ae5bc8632531 |     
  nds32le    |            unknown             | NOK | http://autobuild.buildroot.net/results/11a9f19bfe9453132ed300d6ca6725c74a071612 |     



-- 
http://autobuild.buildroot.net
