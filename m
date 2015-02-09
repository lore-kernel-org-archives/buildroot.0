From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  9 Feb 2015 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-08
Message-ID: <20150209073016.04BD3100D17@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-08
===============================

        success : 348
       failures : 44 
       timeouts : 5  
          TOTAL : 397

Classification of failures by reason
====================================

              host-erlang-17.4 | 7 
                   perl-5.20.1 | 6 
             libselinux-2.1.13 | 3 
           libmemcached-1.0.18 | 3 
zmqpp-36413487f05b165dfc82a... | 2 
                 qt5base-5.4.0 | 2 
         qt5connectivity-5.4.0 | 2 
               libcap-ng-0.7.4 | 2 
                     git-2.3.0 | 1 
                  thrift-0.9.2 | 1 
            host-heimdal-1.5.3 | 1 
                    fltk-1.3.2 | 1 
                    strace-4.9 | 1 
                      make-4.1 | 1 
              libarchive-3.1.2 | 1 
                netatalk-3.1.7 | 1 
     host-google-breakpad-1373 | 1 
                      qt-4.8.6 | 1 
          sane-backends-1.0.22 | 1 
                  ltris-1.0.19 | 1 
                   czmq-v3.0.0 | 1 
                  xerces-3.1.1 | 1 
                 python3-3.4.2 | 1 
                 gnutls-3.3.12 | 1 
          host-gcc-final-4.8.4 | 1 
     openvmtools-9.4.6-1770165 | 1 
           qt5multimedia-5.4.0 | 1 
                libevas-1.7.10 | 1 
               libecore-1.7.10 | 1 
                     ntp-4.2.8 | 1 

Detail of failures
===================

         arm |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/0c8f338dd89ff82927e1789fcd19cb0bfd9202b7/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/1ec2b2e55242f7981617eeaf0f1e4fa5ccefcc0d/
      mipsel |                      git-2.3.0 | NOK | http://autobuild.buildroot.net/results/4b33f3f415776cf43be0910b583d222711a03cad/
      x86_64 |                  gnutls-3.3.12 | NOK | http://autobuild.buildroot.net/results/6d5352828dffe72e529c23edd10acbc516f2a25c/
     aarch64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/465ab7fe6ec88d00c5950f7c2aedf9b5701a1a7a/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/2f8456f8620349d4a9b8f53ded1f940820d77f7e/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/b5b6c733632c359c6cc8c67ea3d177f7f9999457/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/2fd8c0f387d857d56a810d555a01902367345542/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/e94677afbf6690123cc6854ecc9b4244ee836dc6/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/cbd8b54eef535f19d7d400fd269af1b3571d6143/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/8bf45e7d5611a2f862ff98adad488990aa8879cf/
     aarch64 |           host-gcc-final-4.8.4 | NOK | http://autobuild.buildroot.net/results/87b74a503afe00d9d600e46736189cc7c1b4b84b/
      x86_64 |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/bf2a33417b997822c44a710532565e44c212a911/
         arm |             host-heimdal-1.5.3 | TIM | http://autobuild.buildroot.net/results/8a56443290b24647b98bd34b0fd8c4a0fe7549c8/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/cf56b5b79116931ed5f75b97e7bda013d761e14b/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/092d06063f54640750bb9c91b350ba777d821888/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/1f3ec11b34905ddbe2ab1119e2a895465d7ca46d/
         arc |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/99e1db6b226271c44c8dc465285b2f154ddf0294/
         arc |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/28182fc99e643c27bfd4bc1283fe304c5a6339a9/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/dc34ed97945d1d051e864c439ec825f58b3dc3d1/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/23ba1963db5b384ab88d0dddd8f7c13437666777/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/5f967bb8d15c111d6cb783ef255a84a55289190e/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/165a227a0a8ecd4cb3f96761aacdf90ae974fea7/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/ab728d08ae2973b90ae03166d71c1ebc30a723dc/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/9e8b42402ec0ede8237f7522ebb4094d1b7ca474/
     powerpc |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/16830798d9c16106f4e32ca596c40a0a4e898e3c/
      x86_64 |                       make-4.1 | NOK | http://autobuild.buildroot.net/results/36449894287394bf97128bd001a2cfaa0bb58f34/
         arc |                 netatalk-3.1.7 | TIM | http://autobuild.buildroot.net/results/139df86f4c46130d88f0e1ceced87c784e1f9607/
        bfin |                      ntp-4.2.8 | NOK | http://autobuild.buildroot.net/results/8b38f3733e0de1a3497501bbb3f8d3eb286aa156/
        i686 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/bff7d8f3ec19ce790f0c88a336d1007e1ff29836/
         arm |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/d8a5875d87727ebb4e160b5eab11a23a9866ad02/
         arm |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/355d4715bbe388574866cbc39b8ade9894a8cbf6/
        i686 |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/31ecab4b67aa5c9f0a393f1f5a6a3660641a394b/
         arm |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/38404a18a905c60eeccaf5175c17a0244f7dbb9a/
         arm |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/7be10a41b0adb336459894b9ac3e87387dba0e99/
        mips |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/a1b1b58a857ab43624f76b176d0cfafd1465acbe/
         arm |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/9bdaa392e8dd00c6ebee156b758e3c0cac480237/
      x86_64 |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/2552e8c09817fe4634771847f4a3cb43ddda6f13/
     powerpc |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/4f19116e5f8aef2e0988b800ec4071da5083730e/
     powerpc |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/ae6140bbdcdcf74f200f5b8fb3316b8065db4d5e/
     powerpc |          qt5connectivity-5.4.0 | NOK | http://autobuild.buildroot.net/results/2f832e7f3ba89dba123bb27fad8ccc973d44d0d1/
     powerpc |          qt5connectivity-5.4.0 | NOK | http://autobuild.buildroot.net/results/2073d2b754eb5035c167dd0ce899bad030d1785e/
         arm |            qt5multimedia-5.4.0 | NOK | http://autobuild.buildroot.net/results/69665f3ff1e02fa4d9ba4473d8fedd41516a1c28/
         arm |           sane-backends-1.0.22 | TIM | http://autobuild.buildroot.net/results/ceb52a3f18467a1d977f3b5d0323c002ef5308a8/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/9b219ac379b1fe0823089efe35f2d763a8daadc2/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/476bb6162314ac6698143369c85af92f4bb0853a/
     powerpc |                   xerces-3.1.1 | TIM | http://autobuild.buildroot.net/results/bc64bbe5853d118cd3032c78521197bafb814ff2/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/b132be1e859fd3a9a241a51f938182bbcce098e1/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/c4751f33c5c65da4c44819e357796ec18a1fb466/


-- 
http://autobuild.buildroot.net
