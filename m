From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 08 Aug 2019 06:17:16 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-07
Message-ID: <20190808061721.75B5085E93@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-07
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 26  |  1  |  1  | 28  |
  2019.05.x  | 25  |  1  |  0  | 26  |
    master   | 203 | 84  |  0  | 287 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

              qt5wayland-5.6.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        qt5wayland-5.6.3        | NOK | http://autobuild.buildroot.net/results/b3fdb94f328e9e39a8d3b3e5d1e5f4bf40f51e63 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    mpv-0.29.1 | 10
                      icu-64-2 | 9 
                       unknown | 7 
                   mpd-0.21.11 | 6 
                     gpsd-3.19 | 4 
           host-harfbuzz-2.5.3 | 4 
          qt5multimedia-5.12.4 | 4 
                  cmocka-1.1.5 | 3 
                collectd-5.9.0 | 3 
                harfbuzz-2.5.3 | 3 
                    wampcc-1.6 | 3 
                    dhcp-4.4.1 | 2 
                  flashrom-1.1 | 2 
                 libdrm-2.4.99 | 2 
               libupnpp-0.17.1 | 2 
                gnuchess-6.2.5 | 1 
           host-nodejs-10.15.3 | 1 
                   i2pd-2.24.0 | 1 
      intel-mediadriver-18.4.0 | 1 
               libsigsegv-2.12 | 1 
                 mesa3d-19.0.8 | 1 
                   mimic-1.1.0 | 1 
                  monkey-1.6.9 | 1 
   openvmtools-10.3.5-10430147 | 1 
       python-matplotlib-3.0.3 | 1 
           python-numpy-1.16.4 | 1 
                 python3-3.7.4 | 1 
                qt5base-5.12.4 | 1 
              qt5enginio-1.6.3 | 1 
             qt5location-5.6.3 | 1 
           qt5serialbus-5.12.4 | 1 
                  quazip-0.8.1 | 1 
                    strace-5.0 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/2a465cb3a95474d048fd618cae971d9214628551 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/66a70646df71a00932312f0ae97dbd2cb53bf6aa |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/2fbc3d7bc49ff8113b1d6ff924f087770deb0416 |     
    arc      |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/100f0031a7027fd4d1c8c16b5eee4dfd3a541343 | ORPH
 powerpc64   |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/322b12cc5cab516f8b035406b6fbebdf322dd0a6 | ORPH
  riscv64    |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/e39d1a2b4efa81ea863ba0f3f991af2b0c06adc4 | ORPH
   xtensa    |           dhcp-4.4.1           | NOK | http://autobuild.buildroot.net/results/e61b246df60af1e59b8f643510557ef2270f2d97 | ORPH
    arm      |           dhcp-4.4.1           | NOK | http://autobuild.buildroot.net/results/0c43c02b8d418b60b4734187abde1da585e9e0ca | ORPH
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/184f7720ef2d0659d580ef6eedd6c0a5ef35891d |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/a854b2ea283dceb3b75a0591d405cc29be96fbdc |     
    arm      |         gnuchess-6.2.5         | NOK | http://autobuild.buildroot.net/results/8c953933af9100f7c713ac1e5de42efb1802c2a5 | ORPH
powerpc64le  |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/cb3e12e07358f8d25e55d07b6268695265e97acd |     
    arc      |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/5dac01b7bfa7f4ce72ef3902c514533811f00629 |     
   xtensa    |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/f57eec803e488515b91ae7e3340c4f49c346e9c7 |     
    arm      |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/401b31a67ab81e06fcdf3e2fcbb660b9caec566f |     
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/6463b7273670f9b19bd14d63c5f6b9eb27277810 | ORPH
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/6ad9a9d86ad431be7334d41af66efdfdc6c68989 | ORPH
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/1cd79287ceba44b24e4637fe02a3eafdae703926 | ORPH
   xtensa    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/acd617be6bffa4e3c88bc3773ccf2a2640ef4093 | ORPH
    mips     |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/81a30aee42223f0a53f2fff782a0df19a2ddf069 | ORPH
   x86_64    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/0f3a794436587046e32a4ece86ea45e34ff194e8 | ORPH
  aarch64    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/5092f041b7e7931f4b836951850fad49575d013e | ORPH
  aarch64    |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/173186bf8cfed4dce5b4147e055e1b687a171eda |     
   sparc     |          i2pd-2.24.0           | NOK | http://autobuild.buildroot.net/results/86e52ddbd1bd1f7570b4d665c03153a28cb41a12 |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/b26b7c147fd409fe3d40e43db334583d382b8d64 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/993601f3d687eb4da0295b84862b44e0d8c91289 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/c7be770bb6f2d10bdc152d10b5e685b20bfa01b7 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/7a42e14210b5dcc4b0617b24a108b8445863a596 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/f3a44ef2512be77ab09cca73d123914a2eea32fe | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/f52333714baafd690b21602608a1ea5f902ef84f | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/ec63522d0013c955d76d412418b59801dc3fc1e4 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/78db086cbdab610d228a98f5d8d18d60c164fa10 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/4b485bb808a5f32a1e8de070ca90fdc77ce403cf | ORPH
   x86_64    |    intel-mediadriver-18.4.0    | NOK | http://autobuild.buildroot.net/results/d940d166ef57047acdf853c36e14a9ee468d928a |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/a435644418a0facd9cd05e0d94d7fd11d17ede2d |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/3e84a3a14d025efb1c3f66de87e322248328d263 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/b2d39e45d406f4293693c198e48b06f2cce52c6c |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/598a6b93c77b1653da41106d3d4b53ca5061d507 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/cdc0e2befacf6e171983cc45447fcb543a615c0d |     
    sh4      |         mesa3d-19.0.8          | NOK | http://autobuild.buildroot.net/results/37334237823cb633795553e1dab84765f8f02206 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/6cfacb69a7cee4a283ff77aa62bace6fb0970e09 |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/e09daa91e99622426e142eac608ced5dd393765c |     
  aarch64    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/b3d1d7e1111df84491b5b42b544f0a06d9f7fb2e |     
microblazeel |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/95d3a9ee41b0f68f59c1f6b35fb35506f53e3bb9 |     
 powerpc64   |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/cbd6e43d0192e3a51acd274e95f472a246208969 |     
  sparc64    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/6648817a69e36d5dc38998c6f5660f46f757747d |     
  sparc64    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/72aab71c4a4e9001c632484930c4442058cb3927 |     
    arc      |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/9e15258aa4baae4f2c6febc7d364226f17bb9d9a |     
    or1k     |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/88962edabca0f918cb090b612aab63e009ed893a |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/73881cc8cf1ffd79238f3a4ff280990c90885de0 |     
    arc      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/fcc3b2082a8265b469f099cd794b0d82225440b5 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/64c29231412c7713946153cc41e990cddf2fe307 |     
  sparc64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/d100f1289d05e906664b547090a6cfc7e12e51ce |     
   sparc     |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/786bec9ebf7c0bd6f9e8a7295703c33ff259713a |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2dbe3d4a976c334a191c845942daf3f5b49cd904 |     
  powerpc    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/5130f415483d5061918c0efeba5083863c0972b8 |     
   mipsel    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/7a2d7dcc46fca2acb890815fb5e51968e4e85d16 |     
  mips64el   |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/9fc0a367206b4750172f40a7fcde04dc0cc099d3 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/eaeca166b7220a52fd6cee5d31d96ae7b7c2b850 |     
   x86_64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/f430f8f510a17241efdd06eaa9006218662dae96 |     
    arc      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/af168eb53cbeae000a891781e3cc816a92fb1dc6 |     
   x86_64    |         python3-3.7.4          | NOK | http://autobuild.buildroot.net/results/e4f9d7af7406ab3b8aef27e747db897816464db3 |     
   x86_64    |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/7b9c28bcc0ef8e0f59e4d19497b61562f3eafd95 |     
  aarch64    |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/a9998b1c08d36b2def4e9a3b71536321bcdf333b |     
microblazeel |       qt5location-5.6.3        | NOK | http://autobuild.buildroot.net/results/1fed855980b29e2a440ce23c912f810ddf0eef6e |     
    arm      |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/ec9dcffed9f83d5119d9cfbf4ab1c9dcfcc40b46 |     
   mipsel    |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/92e5ae48399ef5ff05d5ea1070de93ba1a222df5 |     
  riscv32    |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/18271b3c5dab51e0d78a33514f39a05f24b50cd5 |     
   mipsel    |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/d1fd72a750b26d3b2551e05a40e740f22907acd9 |     
  powerpc    |      qt5serialbus-5.12.4       | NOK | http://autobuild.buildroot.net/results/8ebf50367fe86c8f056b89d9c87d2dcc452ec316 |     
    sh4      |          quazip-0.8.1          | NOK | http://autobuild.buildroot.net/results/b045b7ea40397a0f338d035c8651dedec5e0613c |     
  riscv64    |           strace-5.0           | NOK | http://autobuild.buildroot.net/results/7e99ef43e20ba8e594a404102c4591c46062b53f |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/2e82d06e7f5af807110f4aefe44029e45be86158 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b5569846729660846b2ae5f66e1f919c5c463f85 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/325ab4d45d011334e291d401264794174a72bd5e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7e43bd22aa67639cbe1347b27d16037ef678366c |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/ec57e6ab7d6f961a07ceeffe9458b1bded762527 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/b941f2810bcce6049c96c3b05bdd6d71a9c34215 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/17da72f8bbf5ea4fd32928d29bf148b563763931 |     
 aarch64_be  |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/942ff1d2a918a938b63358c7f00bcda0ab1cf88c |     
  riscv64    |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/01df5a6f38fb32563831d171d03dfb9ad89f5830 |     
  riscv64    |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/1eaa6bef116e15cc0f00560d1913c8ceeb92c1c0 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/a6e2d2709b7f8b010e27e280c1951a595a7ef79e |     
    arm      |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/6fdf44e0030ed30f67c8688088ae40f621d13bd1 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                  libssh-0.8.7 | 1 
                       lmbench | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          libssh-0.8.7          | NOK | http://autobuild.buildroot.net/results/71db034d38805b34c128220ec97c2f4dae45b75d |     
  riscv32    |            lmbench             | TIM | http://autobuild.buildroot.net/results/5989a0dfefbd2559cade0ae4879fd2ae2bcbb2b0 |     


-- 
http://autobuild.buildroot.net
