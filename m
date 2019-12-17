From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Dec 2019 07:17:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-16
Message-ID: <20191217071748.0587E81A25@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-16
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 21  |  1  |  0  | 22  |
  2019.11.x  |  9  |  3  |  0  | 12  |
    master   | 125 | 95  |  0  | 220 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 19
                  apitrace-9.0 | 10
                tpm2-tss-2.3.2 | 8 
                apr-util-1.6.1 | 7 
                   dante-1.4.1 | 5 
                   libnss-3.48 | 5 
                  boost-1.71.0 | 3 
                    mpv-0.29.1 | 3 
                 samba4-4.11.2 | 3 
           uboot-tools-2019.10 | 3 
       alsamixergui-0.9.0rc2-1 | 2 
                 mesa3d-19.2.7 | 2 
                snort-2.9.14.1 | 2 
                       unknown | 2 
                  gmpc-11.8.16 | 1 
                haproxy-2.0.10 | 1 
host-gettext-tiny-73fc3e7ef... | 1 
                host-go-1.13.5 | 1 
              host-grpc-1.25.0 | 1 
            host-mfgtools-0.02 | 1 
         host-ti-cgt-pru-2.2.1 | 1 
              jpeg-turbo-2.0.3 | 1 
                libgdiplus-5.6 | 1 
                librsync-2.2.1 | 1 
               log4cplus-2.0.4 | 1 
lua-msgpack-native-41a91b99... | 1 
               mongodb-r4.0.12 | 1 
                     ngircd-25 | 1 
               protobuf-3.10.1 | 1 
            python-cffi-1.13.1 | 1 
          python-uvloop-0.14.0 | 1 
         qt5xmlpatterns-5.12.5 | 1 
               wireshark-3.0.5 | 1 
                 xvisor-0.2.11 | 1 
                       zip-3.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/ae4a3c015ebb903b05c66bc64e3e3104585e6871 | ORPH
   xtensa    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/ff4b413bc1000b8520d03b39d3eba6096af75e8e | ORPH
microblazeel |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/af713172a688acf0efa1c8dda15acbc67e541642 |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/2ee13eee955234ee10189beb9cc845e3816a030e |     
  sparc64    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/557701224efe99e36841b9d840742e1d04182b12 |     
  powerpc    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/523c7e1ba2ab341a84671f4714d1dce749453c27 |     
  powerpc    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/b229f86a3f806ca4fc20dd87e753c54387e299a9 |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/2914abeb7851b321b8f5a0657dec69b194ad6843 |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/a9c129e3e7890fd4590b400e2998f100eb70b030 |     
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/5ce5981b37d74ed67572e003aeb71a0e159acf1e |     
    arc      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/e581c9d4fb13c10e9ab7785f8bbd85e4ecaaa1ce |     
 powerpc64   |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/a3dff79cbb805301ea55bec432765f20c07158ff |     
  sparc64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/c6de5dc72713ad05fd726de3e593abb20c106edf |     
    i686     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/31512aca0b3e8383bd2d0d65bc4946c24f3995c4 |     
  aarch64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/82cbe984c92d482e58237aabbdcbcf43cf3d2103 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/10fb733b99ce6542009659541eb993bbf60915c7 |     
    arc      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/f1adc75d2a9a25ee22a0eb015a134be439b3007c |     
microblazeel |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/364cbac949a3e52fed3427e41054458ca5cc6e7e |     
   x86_64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/0069cd5d015f10f09049e80d8d2ce98988ae7913 |     
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/d8a9fa2efc060ef5c58819c61e20ec17a2857efb |     
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/b3966e019703e21475ba11cab73bc59e4ba11037 |     
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/29b88844ecc803c6a03c2c5af47db19f059b6c2a |     
  mips64el   |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/a94924238878e93e3c70cc0eedc06e5c8c361ab8 |     
    arm      |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/5596f195a9f9741c02a616ecd86b09422ba040dc |     
    or1k     |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/b61e2a41f9f3a8ec2438f304c5bf86b6d0445f11 |     
   x86_64    |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/e459765100011cc2bffffa927cabaf56b5a294e0 |     
   x86_64    |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/09d63d3ec465b04c36703cb75f8707458e8430d3 |     
    arc      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/552ed588702d7bf0c2abcea8653cdd259e206063 | ORPH
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/d5984652291b58231fa1fff9703e34aee4990520 |     
    arm      | host-gettext-tiny-73fc3e7ef... | NOK | http://autobuild.buildroot.net/results/82fb9444c5e7068afee60b675dc237e5e0b55755 |     
  mips64el   |         host-go-1.13.5         | NOK | http://autobuild.buildroot.net/results/9a4ea6e4b3e88e44d9fd2d835d1d7c7e616e5d1c |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ff9a503f301db10ae886fe10cdba3a54b2487570 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/0d881e82f862f82c9bd8347fbb1b79afac89bd14 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/739e450b579e5844b85824c650af26eeb44cc79d |     
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/aa1463299d6c82427771f3c3d8f74c10bd8d4ae7 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/043c1eb5d0a4fb90e63b11ba7b8fdc179380950b |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/23c6ed5440546b3eefe4366b0baa85754b017c1d |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/df6c6cc777eaca2ee2694db23f369e32b8f6a85e |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/763d99c69909a77bff74ece43ee69340619568e1 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/6413e4c3d94856f9e08ca024a5b65b86fb6c4acc |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/65b7da70da556c05549b79b976033e68555ff4c9 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/ef128c4a005cbeafb389eae7169242e38a54f57b |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/8ec8f38bba35427ca23e549a28325bd59f084577 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/66bc72fa048e9124956e73a8692b43d4edef5383 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/d865028dfe9f48aa008d5804b218830b53cf52e4 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/7db2d114fc23547f88811200933058a5b870768f |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0969ec10d3c1df3d0e5de6ee573cc239cf23d87b |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/964ad4be6d7ee465a448a641fe2dab542db79de8 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/f9a6d6f65c45307171c4746427da8888a7207f94 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/cd1b3e02eebcd4c065f0b665b376bd7b8f3acef9 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/5c81ac6e3875e92d49f866d0c0dc8a12856ff0db |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/b1277c61678ec0fed5c6c8f7a429437c0447f928 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/aa5832e06d592bebd6dce9ac67789b9588f64ad7 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/ebf34f1a5b554ae8ca295ccc5441a507b0241c4d |     
    sh4      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/bac96f88b22baf761bb7244fec36ccd0754a2c82 |     
  mips64el   |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/42b89233950714af5afaa70e53ac1c465cd46972 |     
  aarch64    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/778e74f13dcfef8bb723f1ebb4833dd9c452bd0e |     
    sh4      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/64c9ba38dbe2b166e700a6efb3aafe7078ead781 |     
   sparc     |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/96d783d1190753647b1985563f113a8f79fab909 |     
  mips64el   |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/22191f391b98f0e7ad954f7d8afa9ad0509c72cf |     
  powerpc    |         librsync-2.2.1         | NOK | http://autobuild.buildroot.net/results/e586376c64eb0bac012ca3ea25f222e909affcda |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/ea8d29f38bcc9b44b0aa0e2000aa0f6a8159cfc5 |     
    i686     | lua-msgpack-native-41a91b99... | NOK | http://autobuild.buildroot.net/results/808ccaee924a7e753d4a5903a2072ef1b210dbdf |     
    i686     |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/09358d53bb1a795f9adc344d01d8ccecde3dc781 |     
    arm      |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/464b969963029794bdbda7fe541613d8c24f2294 |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/c5465916affc2d15d5a6aba3fff40973ad95e4f0 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/35fcfbc8568da4ba16e10c7cb2584bdca71fa23a |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b9dbab4178fd00c63a4374186fe0fbc5ea7239a3 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/ae9dd2ab35f747b25050772353272cdcf538bd31 |     
   sparc     |           ngircd-25            | NOK | http://autobuild.buildroot.net/results/f1ace553657181f1e9b6b4cf055ad6e90bae9f24 | ORPH
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/821fb1b8035cfab2a61c8b45f086b59632b89278 |     
    arc      |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/0f3447e5773ccea4eb02be4eb61b63ad5081f2a2 |     
   xtensa    |      python-uvloop-0.14.0      | NOK | http://autobuild.buildroot.net/results/c93744b6e06789d01dbabd90bb5f0cb590bbba6a |     
    i586     |     qt5xmlpatterns-5.12.5      | NOK | http://autobuild.buildroot.net/results/73f9933b9548e6730ef26b5a18e1bc3a6684beea |     
    arm      |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/c5785c93861e068a9360c5817996bf8ffa1f8316 |     
  sparc64    |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/21f7f05a83ac5415d2d6f48c1ce8e18a76c515ca |     
  aarch64    |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/5d2977729f6f65082fe19f5cfbb7b06228ea688e |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/a6f17f0ddada2dec247f02ab8b62f62170f5a8ea |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/39cf4523fb96033709b68b2ce2a7b9eb5326eee5 |     
    arm      |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/13f5e37b47b255da4158bec34e5459136f7e60d4 |     
    arm      |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/1c26db2509c79e00c0de1165945277eaa57b149f |     
microblazeel |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/b7b6b7b7aca79e847b442cbd2305427d91fe5d70 |     
microblazeel |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/1cd5a82a0e799aa5027e2e2c03b246332cc3a15d |     
microblazeel |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/d7ec878907f714377c83e9a496e97cbf9382d787 |     
    arm      |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/1c7f0c1b3ce4871cd87bd6059b1f0a6dc4e74a9c |     
microblazeel |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/196b81d580325607c8da90beeb79e1f6b8ab8b47 |     
    arm      |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/f90f7b4ac710b56686635f8ae27059c11b963e47 |     
   x86_64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/591b08a9fb8ba0930f91a0859c0d2b39c6cb0d10 |     
  riscv64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/3897402ac4f4a35e6929d8711e0380d55ef1b89f |     
    i586     |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/dfb68f1d911ba57205a4a24763db22407635e903 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/874b67bc6c9e49352a3741b2bae3c465d580aaf7 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/ca6fbae0d74cc13b281e6edee86c13f92dfe6c94 |     
    arm      |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/3159c696c6d5b56e22bbb02c89e5aa94bc313755 | ORPH
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/03b899199dc179bdda0f2f30f6ac68fd3e56fc55 |     
    arm      |            zip-3.0             | NOK | http://autobuild.buildroot.net/results/77346a2cdb9eeef661527fb9566019f3cd1b82c9 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/f495a27b97c6a86cd826ad09d2db64c5bc0d6810 | ORPH


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                host-go-1.13.4 | 2 
               wireshark-3.0.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         host-go-1.13.4         | NOK | http://autobuild.buildroot.net/results/aa3a66650716799d0c3fc788b89645e9e2c3ec21 |     
  mips64el   |         host-go-1.13.4         | NOK | http://autobuild.buildroot.net/results/ceaef476eab05acc32d7e994be768f5e719f8885 |     
  powerpc    |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/efd5b85fb3902ee5706a46cf6714757528a69c29 | ORPH



-- 
http://autobuild.buildroot.net
