From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  6 Mar 2014 08:30:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-05
Message-ID: <20140306073010.F1C12100E3F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Build statistics for 2014-03-05
===============================

        success : 66 
       failures : 30 
       timeouts : 1  
          TOTAL : 97 

Classification of failures by reason
====================================

             libxmlrpc-1.25.26 | 5 
                    crda-1.1.3 | 3 
                     wget-1.15 | 3 
zmqpp-36413487f05b165dfc82a... | 2 
              host-scons-2.3.0 | 2 
                     php-5.5.9 | 2 
                 cairo-1.12.10 | 2 
              gst1-libav-1.2.3 | 1 
             dosfstools-3.0.25 | 1 
              wireshark-1.10.5 | 1 
 libevas-generic-loaders-1.7.7 | 1 
                      tmux-1.8 | 1 
                       [7m>>> | 1 
                  zeromq-3.2.4 | 1 
                 qt5base-5.2.1 | 1 
                     vlc-2.1.2 | 1 
                   cups-1.3.11 | 1 
                  mysql-5.1.73 | 1 
         host-python3-3.4.0rc1 | 1 

Detail of failures
===================

      i686 |                        [7m>>> | TIM | http://autobuild.buildroot.net/results/9d49f31c9dc16d2a2a4aafa535fbb5ea7e24a66f/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/3a1b75baf1d0ca71ac2e7e619890c03afda7c9c9/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/43a53d2aca347d26ef373f9404c125dbb8b6210c/
      mips |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/1b7aa96d59473678e094f92a6a7fc9c8482d8766/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/01bd83acd95c42912679e60270b5c896d814b4e8/
    mipsel |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/bbcc1af57bab2909dff6a5cbed3ae3d97b63a536/
       arm |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/ca95ca0533975fdb9ac23d431a0471de940e91f0/
      bfin |              dosfstools-3.0.25 | NOK | http://autobuild.buildroot.net/results/ff5c3a07b721430797b7ffa4490e0a82dd93b47a/
     avr32 |               gst1-libav-1.2.3 | NOK | http://autobuild.buildroot.net/results/696820273dd5888443840b4593486cee683ed9f6/
      i686 |          host-python3-3.4.0rc1 | NOK | http://autobuild.buildroot.net/results/4504f49add858a1f15a32c0489e4353d2e6118aa/
    xtensa |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/3b98babd7b78b21ee924ec651c5caa9050bd425f/
   powerpc |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/f0cef401b382e7ef95b94cf8f95bc8be7d2eabf3/
      i686 |  libevas-generic-loaders-1.7.7 | NOK | http://autobuild.buildroot.net/results/5ca7c20dce1900f0b7cbfb7f14eaf18ca0f8ac8d/
       arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/26163676bb4db1ef4f494e1e484fb2134cef8f16/
      i686 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/013fea828e02d883df95c6899e2ec28b4f980c87/
   aarch64 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/c4757ac9301c56f5dc30afe8b2bf313e679a2ece/
  mips64el |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/e9f11cc1d90a79f06998ea6b04d7aa09d9322a5d/
      i686 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/ebabbc9f38e2af1a480fa0eb4922696514177d1d/
       arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/2cf5479403c8ac7340ab3b93517d8f70391f507f/
       arm |                      php-5.5.9 | NOK | http://autobuild.buildroot.net/results/c3c81db94fb1833744f8b7f244be7246d177239e/
       arm |                      php-5.5.9 | NOK | http://autobuild.buildroot.net/results/d57e98977cbef312b5f5a6e371fdd152a73c79bf/
       arm |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/5818bf18161116c8995b5c17fb375a8ccd79e2bb/
     avr32 |                       tmux-1.8 | NOK | http://autobuild.buildroot.net/results/19e5d3e2e5e9d6aa17aeb508cc2b907b09c6dd87/
    x86_64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/e8ded16258b071767472f1faadb2550d2d528b96/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/e626950df840aae92069d839d5670420c459cac2/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/4f1a9bd7a60b2305bbbb469ffb3a08b96f88fcaa/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/83b5ba0145fd41e2b2e800ebee28c4bc490b9e8d/
    xtensa |               wireshark-1.10.5 | NOK | http://autobuild.buildroot.net/results/466b11b053609ea1518d3385c0ab0c7c5fb9c406/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/e20c7ea0b2fc4d7d5f01df9cc7c1240f23ce5b82/
   powerpc | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/8251dc246862a3ec4e3dc50ee7ebf8a0470e2756/
      bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/df4baf53ab612b93b19447ca888cffd5709dae44/


-- 
http://autobuild.buildroot.net
