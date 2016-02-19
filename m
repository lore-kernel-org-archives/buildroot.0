From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-18
Message-ID: <20160219073022.418A8102E6B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-18
===============================

        success : 212
       failures : 77 
       timeouts : 1  
          TOTAL : 290

Classification of failures by reason
====================================

                      qt-4.8.7 | 8 
                numactl-2.0.11 | 7 
                   fio-fio-2.6 | 4 
iputils-c8ff6feaf0442f8efd9... | 4 
                  lshw-B.02.17 | 4 
                  boost-1.60.0 | 3 
               pax-utils-1.1.4 | 3 
                   erlang-17.5 | 3 
          chocolate-doom-2.2.1 | 2 
                  trinity-v1.6 | 2 
                   qhull-7.2.0 | 2 
              gst1-libav-1.6.3 | 2 
hidapi-d17db57b9d4354752e0a... | 2 
               libgtk2-2.24.29 | 2 
               trousers-0.3.13 | 1 
                     fbset-2.1 | 1 
                   hostapd-2.5 | 1 
                  connman-1.31 | 1 
                 libdrm-2.4.66 | 1 
                  prboom-2.5.0 | 1 
        ltp-testsuite-20150903 | 1 
                 libraw-0.17.1 | 1 
     host-google-breakpad-1373 | 1 
                   nginx-1.8.1 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                     rpm-5.2.0 | 1 
             webkitgtk24-2.4.9 | 1 
                     vlc-2.2.1 | 1 
                 mesa3d-11.1.1 | 1 
               tcpreplay-4.1.1 | 1 
                  gamin-0.1.10 | 1 
               linknx-0.0.1.32 | 1 
                    cups-2.1.2 | 1 
                       unknown | 1 
                grantlee-0.5.1 | 1 
                  cairo-1.14.4 | 1 
make[2]: *** [code/CMakeFil... | 1 
canfestival-7740ac6fdedc23e... | 1 
           linux-zigbee-v0.3.1 | 1 
       openpgm-release-5-2-122 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
             netbsd-queue-1.70 | 1 
                    ruby-2.3.0 | 1 
                   slang-2.3.0 | 1 

Detail of failures
===================

     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/daded96b650c32dfbead8f63989c63b917b6350f/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/97a31324fb80790e1e17e8b9fa79a9d0eadea721/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/dda69b42e6b53e8dbd583f455e04a346bd59b86e/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/60cdc37c40e8d75801a2729cb189e25f8f2c028d/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/a45d7fc342a402f24978eaeb5f9a46cf4a66e594/
         arc |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/827f1ea3370ee3f1f3f37a3c9af25d8358230141/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/7656005e765b4ad013f70326e38739a943528a1a/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/4bc67ec24c34996fabee1f317e1bb2df40b21120/
         arc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/57e4d0d1ff34d9b42077f57f0d3c9ad28daf4a7f/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/9ec381c3f0dcac7ef1c3347285044f2c330b84e4/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/f29e68d4f629d26023e7e35bed2c03d3a53e26fc/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/818de47e3fce17ceb1dfa19275f7c6e59bac8969/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/247abca647f89328311612a082413842263d71be/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/1f436adc574220800fd32995fe89d2dd4b46bc54/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/fec493d5a14b765b891c2df769e544f8d6211da7/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/9b2012d7c035becd1a087d5a2e3c49770c0932db/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/d8314608a86e2c72221ac04f8a0b73f493299d10/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/47fdbfa103d63a76810ccfc55d3bb0e85bb83661/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/c984ecacfbde11da16e8aa26cdf620d8b2e332a8/
         arm |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/8693424e9b76449c5a78773d59b91238c38a4350/
        mips |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/14fcd0d320cd96c54f286430c64e356930a4e7c4/
        mips |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/cc5aa2218746cdf37ebaee2324cdcfcd086a3298/
       sparc | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/51b854cfaa825630827d639248f7211a34cb60bf/
     powerpc | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/daf6e3362f8c07e8f4926bc8d8d7852a9884fcfc/
         arm |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/4af6bd54d055f9b45c24b9a7d51a3474bab5df45/
      x86_64 |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/5f08cc7e07afc53386a7905b226e43ea9d3a01b2/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/b97ed7338cce52d7c24a3fd0b379c7aeb943e4ae/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/d0c0d0b7e9a4ebd3718e0ba343039ab6a8615b1a/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/aaa054a71ade3e8fc712e4e2c58c7e114f0a77dc/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/d4dcdc70f072ec995ff07d2f18d08327e68b8217/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/34545557ab72439da32740312e9a0d7c8f7a3bd2/
     sparc64 |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/87d1f75d17ca2d5e4b92e456e0aa438ffc4d2c29/
      x86_64 |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/43bb12e622b4e433c39e9f9ead715f611a118480/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/9b7d1bd29ad7fb4cfda0b74199e6837ef36e3236/
      mipsel |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/743362566cba4cb83c8b3fb1f834425e28bda664/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/cccb2668fb7c4a078a1fd61a1375b383eb8061bc/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/f4d0eeb175625a99817148c38be33b659581782f/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/0730b6d3e02795db928c283eb79260da9592b27e/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/fbe619854f7d72f589e14a4b5b801832175b4670/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/564120029f6a0a798df9d68170a4379482641a5a/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/e1c22264c483ae4e3bad7899969e1d2a6e234db3/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/bcba92ac5b230312606b6b1aa504c65d44de9ed1/
        mips |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/8a9d9fb258aa75d260fbd23ffcd672fb67bad76b/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/b2a2a9c9b68c9cfa0bc00b0aef55666a6e340ad5/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/e1e16fb10f49e6bbeef5d2a57531cae01d5afa02/
      x86_64 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/39bd06f03c5552a5076865162a745946fae150db/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/0d072f8b4f0481803c91cb31f76f9d07c064ba09/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/5f58d3608037a9775c65e08a6215aa767ccbf71d/
      x86_64 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/2165bbbf8f0d52e8b908e0ea6b234d463afb0525/
    mips64el |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/177d2c147535cb0c478de6672bff58796e5eaf5d/
        i686 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/359357c6ee51a6041277e307bd2de5bf99e611d9/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/192d94eae96309c6975d0235e15042700ab27a85/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/17f0ed9a6332371cdd01885fff8556138e76e3ce/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/c6e22b9a0d63a8d4fb1f06d1ca502bad197a2140/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/e1f6a83534a9203a0e3728578540a390e7c885d7/
        i686 |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/458e21564131ac5d5b84f335b60dbe5d04957ce2/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/ea219aca9758c06b047aa8b362539f8bf45d24de/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/2d1bfda2f8f9a64951d2240b96088fd3d57ffcd9/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/c73766e5e71a7410bc9dd11d60fc0a0f6e0c4e55/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/00ed6180978277c9041556104bf9a9c19ac42a32/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/76aad21eb02db56c1cc2ece7f67970ec8efb064b/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1341501811c988dfd896b12a2ede9b11d9a86fb8/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fc58a1fe70dd20669c705385b30af4c2bd86325e/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1fb7869d0f62b1af0c122e0a064bcf804e33b884/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/288d5dd46ffa2cab3b6413af95a8588a3d1c8fcc/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/549bdece3437f19a5a1c595644bebd4c467d1d26/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/917230082e7d1f2c8b151b8cc73a9aa9ab576d91/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fd834c5e9cd44f66f3978d927351f9b35df4605e/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/b1ae187260b05d63b6daf4efcecc7bf2041c54bd/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/87b2e9acbdc88027c01ed17cf40947723d8938db/
    mips64el |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/c176511cbb147c2d8cb0ec0ff3c1612ce8971cb8/
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/4dee51b3a0b9d845fec66159140a983334771596/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/af0aa06e2025229f148f628bcf222a55517a148d/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/df4c437ae253c64017fdb8bf02df0af3c9280398/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/bae6dd617a178830bea452e0107466001c5f602b/
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/e6de4ccfa81926431d0c481b8ba1d6106c3dd117/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/2a276effaeea02fcfda2b0bf14598276b459bbce/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/8c32c91d36874dd7f140a453fc096468a168bd9e/


-- 
http://autobuild.buildroot.net
