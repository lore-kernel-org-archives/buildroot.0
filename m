From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-07-15
Message-ID: <20140716063014.7ACE1100D32@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-07-15
===============================

        success : 77 
       failures : 71 
       timeouts : 0  
          TOTAL : 148

Classification of failures by reason
====================================

                    parted-3.1 | 23
               host-parted-3.1 | 15
                coreutils-8.22 | 10
            host-python3-3.4.1 | 7 
        gst1-plugins-bad-1.2.4 | 2 
          perl-net-ssleay-1.64 | 2 
                  python-2.7.8 | 2 
               polarssl-1.2.11 | 2 
zmqpp-36413487f05b165dfc82a... | 1 
                     popt-1.16 | 1 
                directfb-1.6.3 | 1 
                       unknown | 1 
                  nftables-0.3 | 1 
                 httping-2.3.4 | 1 
                keyutils-1.5.5 | 1 
                  cppcms-1.0.4 | 1 

Detail of failures
===================

microblazeel |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/533cabcbfdf6d400323925b14f685d0f18ddeb41/
   powerpc |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/603c7dbd4580df18655d4b1989d46a9904023d91/
       arm |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/ac4dbb1342e9c9f1de5412e0b71fe4422ef744ef/
   powerpc |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/c05598b6ca229b9d4eb376169ad0e1ca690cee08/
      i686 |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/7ff878e206f6b25eb986fca230a508b638f1edcf/
   powerpc |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/a0c25faf149de9d51768eed8ff5a2274282cd797/
   powerpc |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/605b7bfa70c2fee702f7768ca6967f892c697e8b/
   powerpc |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/94a02ba46140ac7d82fe084c8e0ddaee28a968e1/
   powerpc |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/0dee7d823b4440d70259121db69f155c5784b40e/
      mips |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/228224668be4376844fe924d0a5b346af0414460/
   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/25dbf0fe12f5c7df865421662550dcbba73ddf99/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/a92d79515a70ff8fcc17e719159dffa7e4fb4803/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/725050a7d8482e87f66d1a06296988d454d7b17d/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/50e0f14db0873e73ee9973b5df7c691341dd7d5d/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/40bdfc745d7ec19f7923f53a521c7ae98cccd358/
       arm |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/3ab57dd96cf51b29d2d61efbbfa5a8f62b2ec6fc/
  mips64el |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/3659be9c3a4e8faeeae79ad340118a4298d9f4ef/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/28ea4b463f4186efa3a636511a36ceb518b25e1b/
  mips64el |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/3ef46f2c688456bda48e8851d826216050353e47/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/368b8850337048640fa950d2d36b1f6e4b1e07b4/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/dfd83aafe0df634602a8b4547c85caee81510bf5/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/5cb281bab05ca76f056d889160a7e217becee009/
     nios2 |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/c104ad458e098e7442febf37ff0bf9e1d0cde9ad/
  mips64el |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/34b83cfd5738a175687f4bc6209f570f0945ba1d/
       arm |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/3a207075eeddfac63b84c26d3e40faf33c01dead/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/a9dc3d048000f0fa924b6d47dacdcff49f656ca1/
      i686 |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/f01896de0f45d8c3965fd853c9fe03ff1c0af72f/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/3f6c5b307b3042bfd15f30e0d09f47acfdd01284/
microblazeel |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/170c33f7416b0101c3bacd0b5c030aeef02ab306/
   powerpc |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/2e01bad61d33295bedbcf83b09b78e4f16598be4/
       arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/33ea1ce103f3f19e4fd4b52da0d68d804ea5456a/
      i686 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/8005124d057027fc3748582994f85afadcdf2212/
    x86_64 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/314de1143353dc416b1786ebd37756432c22ff83/
    x86_64 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/2ca865a2809da7241cc2e5f207122280a6057ef0/
       arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/7b120adc5e3268a73093bd010d29102db5d9a2f9/
   powerpc |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/0cac7885b8c297a0a7c8890fd3bef9b9884bd74c/
      bfin |                  httping-2.3.4 | NOK | http://autobuild.buildroot.net/results/e9715416de049613f4195855b70d9c50723fbe63/
      i486 |                 keyutils-1.5.5 | NOK | http://autobuild.buildroot.net/results/36e34a8e4c8b1953ad6be21355dacb4eeaf14661/
      bfin |                   nftables-0.3 | NOK | http://autobuild.buildroot.net/results/c2671b00b6707c4a7acda0d2670d442d338ee498/
  mips64el |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/4a495f9946dc33d845e7d49aad01947f83bf8ef5/
       sh4 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/96221570e6b41597c4a0dcb760b67a2fd63b9d40/
      i686 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/c70f7cad5f562822e5a321cf9ef5c964f8cf613b/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/9fd3670b0eb15e6fdd9c0a61ce6fc495290c4b8e/
    mipsel |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/3fe46e1a6ef10645e46a2e9efdf651f60f05dea8/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/ecdacafb3245afa1cce4f587eff9bdfe5c162f81/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/c50decfac4cd28da6af34ee40a216cc84cda9f3e/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/ee20455ead785200847f50e463c32c55821f8925/
      i686 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/ea58ef9a191a65487d127026bc61f6040fd9cf5c/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/bf9d22e936903a2c489b8377501dd67681d9baeb/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/635a91e367b8fb736b70b120c59ba73a9f7d0da8/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/a0af363ba894f089b88d791a5c56f546f2c3aeed/
  mips64el |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/e644b7d69bf6fcbecfc4a4a6ead8a7de799647d6/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/2909c333e94b4dbfa4f606e1919e38a13d3bd7f0/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/9a8c60694a55233a0b51e5bebb348c496d0e4ef4/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/98b5f4751a2912464312986eeab6a9a9f9e6dba6/
  mips64el |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/96b7ecd5f720489ce126bc31afecb72390c88589/
      i686 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/7775dce233250623499aadaa14468cbfe49248e7/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/826d13beb8b80be5d8d13e6336b04929d76d76a6/
  mips64el |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/46a8f75905be28ec07ea31de461c49d09004ca41/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/de42a3e68aa74c02292d9cc7d7d8cc86ec0c3f3b/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/8b10327606634e62a17cabd073c1cfb8156d8b43/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/6a9a8ec52ecd09a9179bb1fbb95e1f21cee308b7/
   powerpc |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/82c2f4fcc1ee4c195422a357666882e8f7b12680/
      i686 |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/56b50a34cc8d35dd63c89d21590451900d39fa24/
      bfin |                polarssl-1.2.11 | NOK | http://autobuild.buildroot.net/results/b535dfda85c8a25c5192c4be7540c4e852fce717/
microblazeel |                polarssl-1.2.11 | NOK | http://autobuild.buildroot.net/results/4cc33cde97140f1ff02c27f45e830d1aed988886/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/48756fdbfe161c05586137f8b0e4d2bfa355ee00/
    xtensa |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/c23a29dcedbd1831a5a25689a64edd8e24128c9e/
    xtensa |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/3dd8d10a52f23ad4bdd850eccc99285369a9ff66/
   powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/95054bdaee24d8d9c51d0a9892760b69a6c27934/
      bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/5d4ae5583562f1fdc12a202398b292dc1826d467/


-- 
http://autobuild.buildroot.net
