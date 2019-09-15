From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 06:17:02 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-14
Message-ID: <20190915061708.0373087B3C@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-14
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 14  |  3  |  0  | 17  |
  2019.05.x  | 17  |  3  |  0  | 20  |
  2019.08.x  | 15  |  1  |  0  | 16  |
    master   | 95  | 53  |  1  | 149 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 apache-2.4.41 | 9 
            wpa_supplicant-2.9 | 8 
                snort-2.9.14.1 | 5 
                log4cxx-0.10.0 | 4 
                    ffmpeg-4.2 | 3 
            python-sip-4.19.13 | 3 
                     apr-1.7.0 | 2 
                    flac-1.3.3 | 2 
                libgdiplus-5.6 | 2 
                classpath-0.99 | 1 
google-breakpad-7515ab13768... | 1 
                 host-icu-64-2 | 1 
            host-mfgtools-0.02 | 1 
           host-nodejs-10.16.3 | 1 
                   hostapd-2.9 | 1 
                      icu-64-2 | 1 
             libgphoto2-2.5.17 | 1 
               libsigsegv-2.12 | 1 
                  luv-1.30.1-0 | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                      protobuf | 1 
             subversion-1.9.12 | 1 
               wireshark-3.0.2 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/9fab296cce32cdf6bcfb39666a13900dac7f950f |     
    m68k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/58c370066dcf88606e8e14a4543754203a2c0d53 |     
  nds32le    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/77f20234d276efcde9891670f2c834ac79e40d53 |     
    mips     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/53ace01a97300ebad8c8e7391eb020e4bce3fdca |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/6d03bce53fa09fcf416f11ea6e456146444ba7ec |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/fe32a009cfcb5979426f86cf361bdbe147e3bfcd |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/d6ccf132f325232c6b8fa1d656d67be7a21b6a40 |     
microblazeel |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/c6d339262685486432251f530dfe4cfe45a4a96c |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/7710448236cda2d5fdffdea96dd792c77ed0a762 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/99f2c2e95fbe25915a27fa9fe23ea3516626877c |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/4f8d2960e2a4d97f72e3bde8f453f84675f3e91e |     
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/1dca16d7e0c474d78fec30edb18ce44b4ec24fa8 | ORPH
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/fdba94f1f4495d000514db23e13302792269e952 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/ac12923b26bc6bc547118a5672719b612e0ff155 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/ed617c9c280a29f8783e7f7d3fd1587b9b73cbb7 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/2d1c034a3c853aa3de2950e218eb99fb851508ab |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/6af1278639870832fa33ebb4dd87394940535118 |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/e11f665b4265e2ecb44ff350ed57947d1b5265a7 |     
    arm      |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/3946c65736af1fd4b90db7f71665567ad56ee474 | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/b8e0689dd547a085c00691999cb7eb3a10c73de7 |     
    arm      |      host-nodejs-10.16.3       | NOK | http://autobuild.buildroot.net/results/acb0f49f9260ad52d07fd85280c65341e6fd38f6 |     
   xtensa    |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/4af25c5a5fa78a19cf17f421fe81a1ccd96ba63f |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/25ca7025769a16fd13f5bccb277289a4d7a139f4 | ORPH
  riscv64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/9048ef4d99a32993b9a78f933a5fbf01ab98aab6 |     
    i586     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/ff2262abe5a82989547acf0a4802598e006fcf25 |     
    arc      |       libgphoto2-2.5.17        | NOK | http://autobuild.buildroot.net/results/9349dfa9dfb4b7a16f8bbab7d2c8d375072b161b | ORPH
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/cede8c444ac1b5ef3475c2b85cf5b8b17c6259e3 |     
  powerpc    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/2afe5e0eda7c2f71a32d4d89a3403970a3105ad9 |     
  riscv32    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/cffc874a6271ff053080543043159ccb02c443d7 |     
    mips     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/3379a2d5592f6737da3b75ef5c8bf70b55887091 |     
    mips     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/6645b86e13baa6d1e252326d8cad9162b8ed7a46 |     
    mips     |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/82dd902a8f7986cbf10bac901f776d5084dc75cd |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/01923f692d404f3cfd4c64f10f3bf449346465b8 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/a94a3a85b38f0c017c51de933676b4ae8425614c |     
microblazeel |            protobuf            | TIM | http://autobuild.buildroot.net/results/2c3eb08d2d1e3322be9ea98c145b7b5b67d2a5ef |     
  mips64el   |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/62b00dd15ca3ac6d06f127886348ce3ce0db668b |     
  aarch64    |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/02493b7ac90ae4dda7aac314a3df982822c537a3 |     
  mips64el   |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/6619954f986ac0d75e608913a82c678a4e12d961 |     
    i586     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/5bf43afc938450c2d14caca5375a477fbc422c1e |     
 powerpc64   |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/c707befb9ffbd21fde0305dae53d7ddd01939b82 |     
    sh4      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/c3e987715e3e42471dbaac43b29b42bb1aeea299 |     
   mipsel    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/159fbd65e0576c2ca42575745acc2060c085f2ba |     
  aarch64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/dbaafa25edc886bece26d469044045074c063b05 |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/a88fa308b6e1b275d028c92d398f6e5b648c1ece |     
    arm      |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/5dfa2cba4f3f5edb8648b4440028bc2b40ba3291 | ORPH
microblazeel |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/6c24392362c59f669d37b79f38ed275e11d0da71 |     
    i586     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/c1eff5247666748849aa9a14ad8bc19636d1265a |     
    i586     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/747c9d4276123c773f9a42d8c1434b446ab41051 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/9756438ffba05fd9bce2962c5fc5a47105706e04 |     
   xtensa    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/a56c20798dae511dcf48bb839af579a68694b441 |     
  sparc64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/5981823f6686276dfc300ac1ec20371a37d6206c |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/630d8125fa219e862e1cc98201e1ebe270e4595b |     
  aarch64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/8d44e4e8beeec72ec0743f0d4d6f32f2569b31ab |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/518ca500179f89e807a4f3dcfcd24c2fe724278b |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.33 | 2 
           host-mfgtools-v0.02 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/2134456e13e56d4707a2f5e1f0dd74fc2030fa7f |     
   x86_64    |       libgpg-error-1.33        | NOK | http://autobuild.buildroot.net/results/10b45f179aa33175528fea5aa641466d1cbc91e6 | ORPH
   mipsel    |       libgpg-error-1.33        | NOK | http://autobuild.buildroot.net/results/20b0527cbc6016f70319fd4e4733279b733b1495 | ORPH


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                   dvblast-3.4 | 1 
                qt5base-5.12.2 | 1 
                suricata-4.1.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          dvblast-3.4           | NOK | http://autobuild.buildroot.net/results/1555cf00b9e8cc942b955a2f2f5edf0a2072eff2 |     
  aarch64    |         qt5base-5.12.2         | NOK | http://autobuild.buildroot.net/results/b345e0090ea47d80c01e83ec2e32bb65f9345e20 |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/cd9e2229f053cc1c049d815629c6b37a70674461 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.36 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/df0025bbddf2f924887133dfbd9ffb3512c183af | ORPH



-- 
http://autobuild.buildroot.net
