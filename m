From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-27
Message-ID: <20140128073009.4ADF11014D3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-27
===============================

        success : 72 
       failures : 65 
       timeouts : 0  
          TOTAL : 137

Classification of failures by reason
====================================

               tcpreplay-4.0.0 | 11
            libvncserver-0.9.9 | 6 
                   open2300-12 | 4 
          sane-backends-1.0.22 | 3 
              pcsc-lite-1.8.10 | 3 
                    mpd-0.18.7 | 3 
                     vlc-2.1.2 | 3 
                 mplayer-1.1.1 | 2 
                   ccid-1.4.14 | 2 
                libnftnl-1.0.0 | 2 
                 libhid-0.2.16 | 2 
                  thrift-0.9.1 | 2 
            vorbis-tools-1.4.0 | 2 
               libsigsegv-2.10 | 2 
                coreutils-8.21 | 1 
             util-linux-2.23.2 | 1 
gpsd-b4c32aa40cff1b4e1041d5... | 1 
                elfutils-0.155 | 1 
                   ncftp-3.2.5 | 1 
mmc-utils-11f2ceabc4ad3f0dd... | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                       kmod-16 | 1 
                  ffmpeg-1.2.5 | 1 
               alsa-lib-1.0.26 | 1 
                 mpg123-1.17.0 | 1 
                libsecret-0.15 | 1 
host-gcc-final-b93bb009e021... | 1 
        ltp-testsuite-20130904 | 1 
                host-gdb-7.5.1 | 1 
rtmpdump-e0056c51cc1710c9a4... | 1 
           libcec-libcec-2.1.1 | 1 
                 libxml2-2.9.1 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/dc487500739741beb3998189662963313de9030e/
  mips64el |                    ccid-1.4.14 | NOK | http://autobuild.buildroot.net/results/26989b71d9e4a436b17a05ac63e51223619152b0/
       arc |                    ccid-1.4.14 | NOK | http://autobuild.buildroot.net/results/67bc67af380c2b5d425fda92810db016955fe1c0/
   aarch64 |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/cdf060c5602deec07e7841dc7d62f32fea37ba08/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/8a7d6e5374189e73b7e854f46776b534cdbc328b/
       arc |                   ffmpeg-1.2.5 | NOK | http://autobuild.buildroot.net/results/e5d4748d6e7ab7d99563eadc1f454d2c2bab96d3/
microblaze | gpsd-b4c32aa40cff1b4e1041d5... | NOK | http://autobuild.buildroot.net/results/53678894f0c0da3da36fe6bf106b528b26d102bc/
microblaze | host-gcc-final-b93bb009e021... | NOK | http://autobuild.buildroot.net/results/bf180127edca93307541440f37a1cc316a59ad0a/
     nios2 |                 host-gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/192db028dce4f228075faf50b1b748173b7bb4dc/
    xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/122e5347041c2fde8a1af43b6c5631019b8cfb75/
       arm |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/4e300ed4cb38c8bb44514a40d4e8e96e018e0118/
    x86_64 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/cfa4dc30ad42a478583d6c88478b65f27fb9451d/
    x86_64 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/9d4ecfaf43e3f70035985f174b346985f90915cd/
   powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/17ed200e0cf82df244444942ea058a2efa0f8e90/
   powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/b3a973b09f39101f52e52305ecba46acce03045a/
     avr32 |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/bbaf58bcceaf7d22614753d39a44a1c2d33dc234/
     nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/6e80935c888cfd11b61648a064e7eb0a441d65e8/
    xtensa |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/c27c8ee6599a5e881a5d798e0bbe7f3dc566fa7b/
    x86_64 |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/a03a9724cd30ee7a05e70c12ab359ddb3792b667/
    x86_64 |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/5ef93e2128e9d8c9021574234beabe70884c42d6/
   powerpc |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/b70489b49b913772e305225e51f9dc89c21ba4e5/
      i686 |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/c04b872fe4c59d10cd390e2f7e13dbe7903217e3/
    x86_64 |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/583cd3c6d1de868cf471cc9c968c85be294cc75c/
  mips64el |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/895cbb8f4a2de7bea2675189c4f517fb4d825195/
       arc |                  libxml2-2.9.1 | NOK | http://autobuild.buildroot.net/results/836dfd2cc0561a51f1465d5d32da9810dad40009/
  mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/81304fefd3d4e814ef7193aa34963bd74a8eda94/
   powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/a6179634436d4b222d3671fb0435582a3e3b79ce/
       arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/c0e1156e00e544109a6ce8ea115c68f733f7db39/
      i686 |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/13d5ebda9c216e809acb71ae256bb7e543cce922/
      i686 |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/f4ab883843010f34a73c9b6c3cb1853b61433e9a/
    x86_64 |                  mpg123-1.17.0 | NOK | http://autobuild.buildroot.net/results/e24e4e5fa975fc75677c0780699b3455b2e18da9/
    xtensa |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/d000c6f0861a0cfdb25db654d22d058945898259/
    xtensa |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/5c0323942745be3c1637258792165d31ad8f389c/
      i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/6d10db2dec96e94cb01cd534bbe5a5e255f5a372/
      i686 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/cc7fab60e401d4680b69cd1cc90e9bcae0ad7a0d/
    x86_64 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/cdc69829f663462554a7b5cd8e6e92737a80bab9/
   powerpc |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/423e5097c34cab9e182a30d010c90e5cf9f64907/
      mips |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/f928ef928e3efccb8bedddfb0d624834bf92ace2/
   powerpc |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/970b303da222f33cccf5fa7c4e6a0e155b329e52/
    x86_64 |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/f0a7f14b9c5bd5d3df45d71b3cbd7928878867b1/
  mips64el |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/be20dedeff2467d97167ba0087be03b8a24981b3/
   powerpc | rtmpdump-e0056c51cc1710c9a4... | NOK | http://autobuild.buildroot.net/results/c9b77a5345cb8149ca9449267436c0fe0e7f736e/
       arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/f71d9bc4659bb7aa8b09bf8932ec32cf0de7d88b/
       arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/adf0427802dc7db8657075b81bfa688ce72dee00/
       arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/4cd574fc81d87045323f6775792570e4ef599c0e/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/9fa11d10d2f7921e3281372e9670a5bac4935914/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/eef5658d079acbd34083eb2f452b4eb1e21eba6f/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/278a3b6fbf61be0f55070621b5302b4c71dc1c49/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/300f161a6b94f899ce66afea961686634ab47506/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/59fdf3347b95792cb247d605f20824c326bed03a/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/dfaf2e6c65927dc878a1881f2d3f0d0f1786a94f/
    x86_64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/5e44d8be01aa94740f01bb37600e50e316e30d8c/
    x86_64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/5d7dcca723019cfef5613f9b916dea850d7a4ced/
      mips |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/4c7a7ddb57cf3c07f9abdf639493a418688433b6/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/aa2012141d5f123c8698089664eccde2c9c0ac78/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/d8ad04a60efbdc1a42be82c153613a4b5e4c3b9a/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/ae2fc29394b5be1d8f010286aa57bd2c76fdaa7b/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/16ca4fb8b67a237180fe5fbeab5c8113919346a6/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/b17c7ec6708c92abc967b7cb9aaf82aa06f02602/
      i686 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/56d396f302b6947ebef8921f3093810a13e023dd/
     nios2 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/597f3454c2fce6b16a6ffa999ff9114549166ca3/
      sh4a |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/e03bb7eeff5d01a7890a897c39b6331e55b6fd29/
    x86_64 |             vorbis-tools-1.4.0 | NOK | http://autobuild.buildroot.net/results/d488dc5e1d684124e7367dac00ba2fb8c7b1b876/
   aarch64 |             vorbis-tools-1.4.0 | NOK | http://autobuild.buildroot.net/results/e6ed61d3a5646713855cb7b1950f1820c625b5da/
   powerpc | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/32362eec829d940553a14237b9f9187a1e32c4bb/


-- 
http://autobuild.buildroot.net
