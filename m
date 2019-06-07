From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Jun 2019 06:00:51 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-06
Message-ID: <20190607060101.08C4D87ED2@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-06
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  23 |   1 |   0 |  24 |
   2019.05.x |  25 |   1 |   0 |  26 |
      master | 208 |  71 |   0 | 279 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

               wireshark-3.0.2 | 1 


Detail of failures
------------------

     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/eeb728fd8e73b0003a74e6c6d725a7d65f8bf8aa | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

    host-mender-artifact-3.0.0 | 27
            nanomsg-legal-info | 13
                poppler-0.77.0 | 9 
                openzwave-v1.6 | 6 
             iputils-s20190515 | 3 
package/nanomsg/nanomsg.mk:... | 3 
              domoticz-4.10717 | 2 
                    efl-1.22.2 | 2 
           host-mfgtools-v0.02 | 2 
                   libva-2.4.1 | 2 
                   gpsd-3.18.1 | 1 
              spandsp-20180108 | 1 


Detail of failures
------------------

    mips64el |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/a4f87792599e040d173f6484b2747688413b82da |     
     aarch64 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/f20f9bd1e855e84e54b4fd3b0ea9091d3977c4d6 |     
         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/eb99f5b35c56c8d357ecfea22a8258817e5dcf89 |     
         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/b24ae934e74179ca76f6048af7542d02651f5dd3 |     
         arc |                    gpsd-3.18.1 | NOK | http://autobuild.buildroot.net/results/a51a26de69bd1c8856ec47c3bbfc488d145b6f84 | ORPH
     riscv32 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/3af97a137d89f76abe2bba77cd3e059892a0bf73 |     
         arc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/af7252fe45665c2df64dd5963f3d13fc7f521b05 |     
        m68k |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/264526aef58f6e75752fed44f6e9ba760634f83d |     
        or1k |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/c0735bb6fefd6f987ce60bb0592441d231b9d68a |     
     riscv32 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/917e5776c32fa7830aadc852d65a2a4df1523325 |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/cf700fee7696d58a00d8a192f5824e9148544d27 |     
  aarch64_be |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/5bb196b2c7dc2f9b45ab2aeeaf4a6937a977e6c0 |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/56cffb288fabe6d828decc89871e50be7fda15b2 |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/30ecdffe399fa92c934916dee8b3335378e375c0 |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/28f8d1dd561b938540201a35ac78f25214f50622 |     
        m68k |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/4d5c7b15be4d8b499f896d0024b9860b8e0d1eef |     
  aarch64_be |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/24ab50b283bd49a84eff6a5ce738717464fb6c0e |     
        m68k |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/7588f7e24c2d0688d7e4a627f7b4b338913f7c47 |     
       sparc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/d4bc126bb6f3c5df854b398fbc26d103cc80e292 |     
      xtensa |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/392e547aa511cee92a35799c76b8b8bc2f55d1ae |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/612d42602905f1c00bfc85e46666467b44a1c08f |     
         arc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/96556e6e5228b18a372dff31489f6200f95261de |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/2ae64ddce2e4732441f767135822e7ba4547902d |     
         arc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/96d605142ca037a52b18f0396fa013bc3cec7d69 |     
     riscv64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/ea1d9ea6486349f534c7d1ebdea922c3f7553bbd |     
    mips64el |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/be4a2c1b2bacf5f665ffb9179573539b66c9b80b |     
     powerpc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/92643477e4c820cf8a7e60d20c0017c7db3a816c |     
         arc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/ad38ed60eee144f41bdeb8d34932b701d6d6539a |     
      mipsel |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/441413d13e8157bba823323a5ae8166c673c06a4 |     
      xtensa |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/7399669f28497542c1e1fd6f254c7d994dac3034 |     
microblazeel |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/ed02de77327e83ab33e039549cb0a3a2fe3d662e |     
      xtensa |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/14b872eb64f0b1e83cf483681523694f0f3ae0b7 |     
         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/be26e0a3bd5df3ef5f0af3e1dd5e927e61ed60a4 |     
         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/c8bc5deacce58025eda92412e1d43a3e33ca031e |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/7034c7a2782ba2956cf76b34da2726e8e0e2972e |     
        i686 |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/cc6575f9152042b345641335f158d30417f066d5 |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/b128982ca498725ddc794e8b28cc86f968bf760a |     
         arm |                    libva-2.4.1 | NOK | http://autobuild.buildroot.net/results/5a9418c312e822e70118dd209e36acbb7326d73b |     
         arm |                    libva-2.4.1 | NOK | http://autobuild.buildroot.net/results/f8e447acc4efb355b47c4d365af56a752a56fea9 |     
    mips64el |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/545e00c0523bba2f37533dc294f738495f19c735 |     
         arc |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/bac8e98690c6f167cd768fd43dc1749384399747 |     
     aarch64 |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/d279abf8b637cccc743f709858949a243731fc33 |     
         arc |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/cbfbf302c187b2ef4e2498bbe9a9988837402f90 |     
   powerpc64 |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/d547ce9a67834160bf3f7e3e2b52b1b607d3afc4 |     
         arm |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/ec1cb0216ebedc5c7bd2c8719460db28b666a24f |     
 powerpc64le |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/8c16135f0cdc574d7ea2cbe89edf32ddf7372f80 |     
         arm |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/0e57946a3fd829f0d6ac01292d8cc37cf60466b9 |     
     aarch64 |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/52407cf22a941b4f2dc627266f074dfe8062b89c |     
    mips64el |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/1e6dea97f4b7103536fa497c0c0354a42a9f5bd2 |     
      x86_64 |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/ac8dd7bb0db36c15f90de5a16df5c4c012bf434b |     
     aarch64 |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/c6d196bd3a2c8c20f657f91f40779234effd2fe6 |     
     aarch64 |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/c427a53dbdfb2104ff89985d61b364c90318d3ea |     
         arm |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/bc1372112a2eda98c01f98b00bb0beb8ee0ae3b8 |     
         arc |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/8fad35ab8439d63c7d1b3d02ef790bb23f57d27b |     
         arm |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/0b9428d9fd4d26c5d1be033f561185243310c043 |     
         arm |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/529a031da3fef639401abc886f4d633a3691bf82 |     
        m68k |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/76c6a7cec54e46c2ee9f395f9dd65737402b9d7f |     
         arm |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/b5dfe5a195d3f64caf23be863633162fd201c571 |     
     riscv64 | package/nanomsg/nanomsg.mk:... | NOK | http://autobuild.buildroot.net/results/4eeaee052f106c41f66c3a5435b20895ee8e0514 |     
         arc | package/nanomsg/nanomsg.mk:... | NOK | http://autobuild.buildroot.net/results/c40fa854d7182ed81fa9e9052e82b6ec94c47940 |     
     riscv32 | package/nanomsg/nanomsg.mk:... | NOK | http://autobuild.buildroot.net/results/32729906c25a546c10fa5bd212c0f8c2d5008a27 |     
     sparc64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/fd42d2a5194e7b103e35ee0272a8bfb59ce9bb3c |     
     aarch64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/f6ab9df9eafe9962078a2c4b1f42e8c2b8385697 |     
  aarch64_be |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/82fe746abf93163961d9909486610edb57f7ed3b |     
        m68k |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/18edc7c6ab5e97b9a5ce222c6fed99514c1406f0 |     
      x86_64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/5de283ee7f732537750f8af47418b22a6a64ef74 |     
       nios2 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/e175e314a6785d0605acd594af71fa355045fa76 |     
     aarch64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/1c3a8e63b1cd40fd6ce45471b5ce93d5a61f12e2 |     
   powerpc64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/ad241444a9896aa7ddea34f6f69f303dad0e7555 |     
         arm |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/7f69f65e8414a7518e57420a306e19a312ee4800 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/2e0ac5fa623f5fd1fece163e6441cd6ac91f2d0f |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 


Detail of failures
------------------

        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/bef0eac99399b809fd12e899692717e516c7e3e1 | ORPH


-- 
http://autobuild.buildroot.net
