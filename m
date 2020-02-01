From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 01 Feb 2020 07:17:13 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-31
Message-ID: <20200201071719.7DA0C25D64@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-31
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 17  |  0  |  0  | 17  |
  2019.11.x  | 14  |  4  |  0  | 18  |
    master   | 83  | 72  |  0  | 155 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   mutt-1.13.3 | 9 
              host-grpc-1.25.0 | 6 
                    brltty-6.0 | 5 
          libpam-tacplus-1.5.1 | 4 
                    parted-3.3 | 4 
                apr-util-1.6.1 | 3 
          libmodsecurity-3.0.4 | 3 
                      bash-5.0 | 2 
                  cc-tool-0.26 | 2 
      host-uboot-tools-2020.01 | 2 
               log4cplus-2.0.5 | 2 
                 mono-6.8.0.96 | 2 
                  ndisc6-1.0.4 | 2 
               protobuf-3.11.0 | 2 
            python-cffi-1.13.1 | 2 
               acpica-20191018 | 1 
          erlang-jiffy-0.14.11 | 1 
                 gerbera-1.3.4 | 1 
            host-mfgtools-0.02 | 1 
           host-nodejs-12.14.1 | 1 
host-python-setuptools-scm-... | 1 
            host-systemd-244.1 | 1 
              jpeg-turbo-2.0.4 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 libnss-3.49.1 | 1 
               libsigsegv-2.12 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                 mesa3d-19.3.3 | 1 
        network-manager-1.20.4 | 1 
                 opencv3-3.4.9 | 1 
   openvmtools-10.3.5-10430147 | 1 
                qt5base-5.12.5 | 1 
         qt5xmlpatterns-5.12.5 | 1 
                thermald-1.9.1 | 1 
           uboot-tools-2020.01 | 1 
                     vlc-3.0.8 | 1 
             xscreensaver-5.43 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/938bf4d63350ea8ab8f540aa142f046d72359cd3 |     
  riscv64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/04ae3f5ed85b39bc40eca643a1c37bcb98b03462 |     
  mips64el   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/a8bdfa0240a63b636db2129ce2910327f476ddcd |     
  mips64el   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/a281a57a6193a6482f82f48ce5d2b9c43d84a204 |     
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/ceecabb9607e04b39e728487cde27131dca69e7e | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/0999e2e22b35fd56fa36cc953a998941c88d6182 | ORPH
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/22c3e8f25276a857c309eb847fc9ee12d324920e |     
    i686     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/37b85ae0d74aee81745a1e5795ce02e4e2846232 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/bf02a701e1c8add89febc83929bf053843759518 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/af8575bdd005c97135e56c8d34f91f1a6fb97993 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6852b7ca6b0ac832755e2214c49063f52d68c0b8 |     
    m68k     |          cc-tool-0.26          | NOK | http://autobuild.buildroot.net/results/56ee14f1788de1e9dd1c70f4c7bb46a142340e43 |     
    m68k     |          cc-tool-0.26          | NOK | http://autobuild.buildroot.net/results/184c04b79501e03ceeafb2ef253ff04da3cb5701 |     
    arm      |      erlang-jiffy-0.14.11      | NOK | http://autobuild.buildroot.net/results/d4edfec0e7297471d12aa45aa27c9c8854d18861 |     
    arm      |         gerbera-1.3.4          | NOK | http://autobuild.buildroot.net/results/37b1ef54dc41100689f311fbc31fc9300dc6ae63 |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/211f2c33df99331a2179b76326095012fc135b70 |     
powerpc64le  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/fcee0d70e70efa27f4734c3d28148b7e5a955363 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ea3929ac28cf8c2975f271ad2d84f96e5d82b29d |     
   sparc     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/92c72e47d1a066166d560678dc9bb36d0a76b2ef |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c8f9e675a56a7a01d6f845bd13a6cf10f01503d8 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/8d9663f69203ed683de773463f567db7579ccb7f |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/909a14a803b2cb7715b7ddf25491d2d9777b3db4 |     
   x86_64    |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/c26d1e2705c57a493a737031d66c17dec197209a |     
  riscv32    | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/5c6a389b6b5c62cb5b0c3ed925434d817960067f |     
  riscv32    |       host-systemd-244.1       | NOK | http://autobuild.buildroot.net/results/d33189725fd7c509c4f2d3b40b960a8093e8eb3b |     
    arm      |    host-uboot-tools-2020.01    | NOK | http://autobuild.buildroot.net/results/1de2dcbf4bc21ee0187316e8e064c10956aee78b |     
powerpc64le  |    host-uboot-tools-2020.01    | NOK | http://autobuild.buildroot.net/results/78d855d783a272ab9e49d3e6bf2747ea1bd07769 |     
 aarch64_be  |        jpeg-turbo-2.0.4        | NOK | http://autobuild.buildroot.net/results/fb2864a32616c2a36bb821b66e5fde251f00f04c |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/7fc4918d8dfbc9be86cdd8b819df800322738518 |     
    m68k     |      libmodsecurity-3.0.4      | NOK | http://autobuild.buildroot.net/results/49b36aabb1d2c8cb62e69f2b4852f16db91634c2 |     
  powerpc    |      libmodsecurity-3.0.4      | NOK | http://autobuild.buildroot.net/results/daa657d0a2e433e57e69bdb8f87bc8e4c5d32aa2 |     
  powerpc    |      libmodsecurity-3.0.4      | NOK | http://autobuild.buildroot.net/results/61a4bfe7f63f80c92fe7b99455975a23c7a26064 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/e0d0eef2f93e88a597de2a23413ac19c811f6560 |     
  mips64el   |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/79b50913d1d097e61848db2ddccd554b3aa3fca3 |     
   sparc     |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/b65c6808cfd4f751c44b803eef1f5066acb9aa4d |     
  powerpc    |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/72dd67a78a57b9f0519ba1fc1d2a414b1c7e3fc1 |     
   xtensa    |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/ad436e9574c680e48c6ef70b1cbfa1617115b654 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/fe32612d929bda5b48d326ab984c3a44b6cd2201 |     
    sh4      | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/6ee07fa4adfd600547678bca36a6ab8de302b72f | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/c03f222637374e131fb9955e225b96c4b3612875 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/1369779f06953796a003e2b3e2a96d0350f00aa8 |     
    arm      |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/001794c3adde4e9b18d9dc14aebf332dfc983537 |     
  powerpc    |         mono-6.8.0.96          | NOK | http://autobuild.buildroot.net/results/29bfc8089077627a893596a0506aa07ad8267110 |     
  powerpc    |         mono-6.8.0.96          | NOK | http://autobuild.buildroot.net/results/0fe5dd9024e512e8caefcc9dbfbc11e85ca1ca0c |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/4097931e916b7814f274cee7c013d1c3ce0a9f13 |     
    i686     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/912f55b0d64aadea9aadae60bba31ba0243a4d84 |     
   nios2     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/c45928d4c49a579f438a8fc97177b2cf7802644a |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/c1166ddeffa69c3bbd7e0b6bdaf6f68fc105bbe9 |     
  riscv64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/9920ad5f8ad63259951ea6981d7fa613a35d2fe2 |     
   mipsel    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/d979830a1cc766107af7214f6e17edf158a7d342 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/7be661c024fc08ccde05f95ee01b905a1982104e |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/d28a9b6040298860c90220099bc75c5c07777477 |     
  mips64el   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/76900e4eaec460c0c7efbd6660906592dc10b336 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/11b89ed3e0edea4bf7bdedc70d84fe0e274c21ef | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/a10435a3ce2b577b95fbeb884aa703190410f7c6 | ORPH
   nios2     |     network-manager-1.20.4     | NOK | http://autobuild.buildroot.net/results/932051e2b24ae44bbea63221cc0a772fc766bf66 | ORPH
 powerpc64   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/ae6e034995ab1a6c2ed2f21f02a5a74aa8cfd8f9 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/9801f4ab3515582b1064b85b08cb792d2b2b673d |     
   mipsel    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/a9a2665c259b4edfa555bf109ccee76c95f5de81 |     
    or1k     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/b579ff6757a047e85b509c0c67a46d8547aa8d3b |     
    arc      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/bf3b6123d667e7fb323870cb00349a54c8893c47 |     
   xtensa    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/b7ba1210d5aa184b133f0171da621d2b0083ec39 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/b3a8c83aa01bf4b4cd160c3918210e9fbe8e18d4 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/ea34d82f9422d6eeafaac195272408ca4579b3f3 |     
  aarch64    |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/16da45c0e61cb1739bf587d3b6700cceb72dda78 |     
   nios2     |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/bf441c2b15478232acaad2f06d0327c706d8c44c |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/8de198cd5479519b55245365e27e501878f9ba53 |     
  aarch64    |     qt5xmlpatterns-5.12.5      | NOK | http://autobuild.buildroot.net/results/61c83beec3632a4e19be252f6699ee8990da0b4e |     
    i586     |         thermald-1.9.1         | NOK | http://autobuild.buildroot.net/results/19b02c043547ea2489e66b418298ad890ae6cda8 |     
  powerpc    |      uboot-tools-2020.01       | NOK | http://autobuild.buildroot.net/results/71b3c955aa4e4ba9aa5b64e4a9ab8fb5322c0b48 |     
   sparc     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/1118612a2c5be0aaf77953a123b7c5295e1da5c8 |     
  powerpc    |       xscreensaver-5.43        | NOK | http://autobuild.buildroot.net/results/dce4a5de9c388cb8ee2694c77984c160c8a377e7 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 1 
                   mimic-1.1.0 | 1 
                     vlc-3.0.8 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/fd422f1465d8445f4c15d0cdddaf24451c454726 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/beca28a076f0df8024caf2348e2dbb599d20cd3d |     
 powerpc64   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/3a9757fed5bf3619d68a01b3dcba27f1ecd488ff |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/a91c167f913a78fe7a0fb6c1573fe3b8c2c2f484 |     



-- 
http://autobuild.buildroot.net
