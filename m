From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Nov 2017 08:00:04 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-19
Message-ID: <20171120070004.B482020743@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-19
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |   9 |   0 |   0 |   9 |
      master | 202 |  22 |   0 | 224 |
        next |  50 |  11 |   0 |  61 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

kvm-unit-tests-5731572b2ac2... | 4 
google-breakpad-7515ab13768... | 3 
                  boost-1.65.1 | 2 
           oracle-mysql-5.1.73 | 2 
                      qt-4.8.7 | 2 
                  cppcms-1.0.5 | 1 
                      feh-2.21 | 1 
                      icu-59.1 | 1 
                       jose-10 | 1 
       kompexsqlite-v1.10.12-1 | 1 
                 mesa3d-17.2.4 | 1 
                supertux-0.5.1 | 1 
                       unknown | 1 
              wireshark-2.2.10 | 1 


Detail of failures
------------------

      mipsel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/bf800f2de69cedced594d60b4012a45c27e49698 |     
      mipsel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/0439790b6f472e3d4b2d5431a05aa5b408f62e56 |     
         sh4 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/7d2cd95bc75250b47f5c9947cd996852925f6e0b | ORPH
    mips64el |                       feh-2.21 | NOK | http://autobuild.buildroot.net/results/f6260a8d53ccffc1e51326bb5e3c375aeacacd12 |     
         arm | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/6380341dbb6c114e4452c5cda37da6b44b80d178 |     
     aarch64 | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/4ecf770df7c984a62082d59f8fab632d3efbe06b |     
      mipsel | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/e1473a12cf38ccf4dd3ed0f26a8ff9e6b57f0810 |     
         arc |                       icu-59.1 | NOK | http://autobuild.buildroot.net/results/09b2f38adf0ed6b8c646125c75f8ab89f110adcb | ORPH
     powerpc |                        jose-10 | NOK | http://autobuild.buildroot.net/results/00d5a4b809922f8fa42c0de9d461c9754d2f8098 |     
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/06beee7473d1730903b86e2f62498a56e5ea3f05 | ORPH
   powerpc64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/5ddc852a238f39a1f9b1d43ec6e68662f6d957ab |     
 powerpc64le | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/1ecee82c8da51277272990d10c781dfe5a9bc5d1 |     
 powerpc64le | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/a7e3e6d39b5b1b2cbf8b9a578041127ab317cfbb |     
 powerpc64le | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/16024e16655a919599f096322a19c70b7fdbac26 |     
     powerpc |                  mesa3d-17.2.4 | NOK | http://autobuild.buildroot.net/results/a89d3249486f0cdd06c5e28f8492dad337937dcf |     
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/9e3a0b5b8f2506fb2ce2fcc3d5d3a494a14439cb | ORPH
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/42e53c8451949d36540d60ca4b2a422ea878b6c5 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/84bf2eb1b7888040a866cbcda1cb03b8738bda0a | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/23f5af34ad48fb4139a2b964baca752d1ab1732f | ORPH
         arc |                 supertux-0.5.1 | NOK | http://autobuild.buildroot.net/results/69032f10edcfd65fd81d62a6854a4c06fa204d76 |     
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/db5d8c14705b6b05eb467c413195d4cc0c03b281 |     
        i686 |               wireshark-2.2.10 | NOK | http://autobuild.buildroot.net/results/14391727e980e69234f379174c80c267410b09f3 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

dvb-apps-3d43b280298c39a67d... | 2 
                    chrony-3.2 | 1 
                   libcap-2.25 | 1 
                 libdrm-2.4.88 | 1 
                  luasec-0.5-2 | 1 
 netcat-openbsd-debian_1.178-3 | 1 
pdbg-77158819158d1d7053a737... | 1 
                      qt-4.8.7 | 1 
                       unknown | 1 
                   zlib-1.2.11 | 1 


Detail of failures
------------------

      x86_64 |                     chrony-3.2 | NOK | http://autobuild.buildroot.net/results/de885d4dc42f4e7dcf04d2ac1f1412d3a478e317 |     
         arc | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/e3939d44376e92e8a35fb179d9890510334d8304 |     
         arc | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/93409fffdd4e0c33841d33fbea4beb4d6e06acca |     
         arc |                    libcap-2.25 | NOK | http://autobuild.buildroot.net/results/0f6b3ba174504fc30fe404ca6206124b4883dc88 |     
       sparc |                  libdrm-2.4.88 | NOK | http://autobuild.buildroot.net/results/f35deea6dfa65ec3b0bfae40b92a58c9351ca139 |     
      x86_64 |                   luasec-0.5-2 | NOK | http://autobuild.buildroot.net/results/c712bdab7c4e831626139dc50bb56fb867b69b74 |     
        i686 |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/dc7c44f80cfda96ce841c613b11ed7bef029d35f |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/27006a8e8d7a1f9e97f177e4322ba3bdefce6806 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/698212828729862462d3ce83b4d21d5ca18006ff | ORPH
     sparc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/dc3e11f7076a8355f3d2f9cb49c6325dcf7084bd |     
         arc |                    zlib-1.2.11 | NOK | http://autobuild.buildroot.net/results/081a652b180d4a2e1bd0cd6ed77fc1cddceeb76c | ORPH


-- 
http://autobuild.buildroot.net
