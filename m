From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Sep 2014 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-06
Message-ID: <20140907063013.1CB98101499@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-06
===============================

        success : 144
       failures : 37 
       timeouts : 0  
          TOTAL : 181

Classification of failures by reason
====================================

           host-nodejs-0.10.31 | 6 
                  boost-1.56.0 | 4 
                      ftop-1.0 | 3 
                 webkit-1.11.5 | 2 
                 gnupg2-2.0.26 | 2 
            host-texinfo-4.13a | 2 
                   czmq-v2.2.0 | 2 
                        jq-1.4 | 2 
               alsa-lib-1.0.28 | 1 
               host-ruby-2.1.2 | 1 
             libmatroska-1.3.0 | 1 
                  cppcms-1.0.4 | 1 
                libnspr-4.10.6 | 1 
                 python3-3.4.1 | 1 
             host-mysql-5.1.73 | 1 
                busybox-1.22.1 | 1 
          enlightenment-0.17.3 | 1 
          perl-net-ssleay-1.65 | 1 
       directfb-examples-1.6.0 | 1 
                   slang-2.2.4 | 1 
                      qt-4.8.6 | 1 
                upmpdcli-0.8.0 | 1 

Detail of failures
===================

      i486 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/ca098ae672956cf50d808fcff83bf4956bf4e31d/
       arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/5aeb3a9f067faf6687051643bf49a0b619cb4c3b/
       arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/c8be1d63dbc4143955c665a090f0606f20d75127/
       arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/ffbc880af29a0308bef4964bdc6b01b4604d7f56/
       arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/c79533249d3eb08e6c46579b8da8a315305c058c/
       arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/fe75ffe3734dae9190259b06ef2debed9fadc3d3/
   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/2be62c58fbed40eed8fc8e8453336190cb1083d1/
     nios2 |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/a87e5bd299a1dcfbd5fdc0232736c779b938c7fe/
     nios2 |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/4853f7fa4ebfaa3f778c3f36fdcdd9a03e77dfca/
      bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/9e3b165543f69edcd2ea99e03a3da8c5d42c52ba/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/a7f95353f5592a9399c542d8d56c3ca040f8a61a/
microblazeel |                       ftop-1.0 | NOK | http://autobuild.buildroot.net/results/e9d55202ebbd7595bde48e2a471fbf33c85a239b/
    x86_64 |                       ftop-1.0 | NOK | http://autobuild.buildroot.net/results/c93f0e8f10e4e905276ce5a9eb96cdebb4294d8d/
  mips64el |                       ftop-1.0 | NOK | http://autobuild.buildroot.net/results/517175ba8df3a3c354c2a21413b438cc73c9dc64/
       arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/fcfde09a8c0121192dc550c72d55b1dd277ec6bc/
      i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/ebee75bfb89f6b8cdd2bf555ad947e36057dbf0e/
      sh4a |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/a6d967056de06bd07dc69f4fc1ec9b0f1e1d3927/
       arm |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/ea4703de4285f557b52921f13f44f0d0ee6ddb2c/
       arm |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/91ed7072347b980129b56c8ba291a87d078814c7/
       arm |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/0240160f9ebfa35d3f5b5b0d64814a521bd9bec4/
       arm |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/99dbab7726f362b2a5a9c840426abea80340567b/
      i686 |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/4899f4e6d0ad58fe5bd5e46a311179f08c6a5b2a/
    x86_64 |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/802134ceb92d82d2d4ef6a81c67ad1c98696663a/
       arm |                host-ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/a01c5f90e9dd8c5134a326db6ba9db3a7b5e6d91/
       arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/24e94a6cea3d79ac3dab6c0baca615ddaeb9e04a/
       arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/0f96c0f86f9fb733b531dcd5ed98e29a9bad3745/
   powerpc |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/8422492ff88761d81e54172a5ec6950e8ff847ce/
   powerpc |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/5d3611f42f879947083635eeec705841da04b83f/
      bfin |              libmatroska-1.3.0 | NOK | http://autobuild.buildroot.net/results/12e752330b30adb5078acd72a548cc172fa9ecb8/
    mipsel |                 libnspr-4.10.6 | NOK | http://autobuild.buildroot.net/results/7e06a73a31069faba96658ab7f0181018c4a0a8e/
    x86_64 |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/42153224cc0edd1a4976e8d1237f01feaed6ab2c/
  mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/357ab3aef1a1989e42a9ea4cc3b605bcb827b606/
  mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/2ab5ab179dab9e1a47092b066f97d48c75ab935b/
       sh4 |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/5bab4c127047275a640c1d55ed54316e960e5af0/
     nios2 |                 upmpdcli-0.8.0 | NOK | http://autobuild.buildroot.net/results/a193527b34c7b8c458904a7f1b5f88d236bd8261/
       arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/31ac17cc64328bbb6531a45b071c1d0429520e2d/
    x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/da11f76cacfd05999700c38d40628b526622ff6d/


-- 
http://autobuild.buildroot.net
