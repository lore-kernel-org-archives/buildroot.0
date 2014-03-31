From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Mar 2014 08:30:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-30
Message-ID: <20140331063008.46DA01018A6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-30
===============================

        success : 54 
       failures : 40 
       timeouts : 0  
          TOTAL : 94 

Classification of failures by reason
====================================

make: *** [dtv-scan-tables-... | 7 
             lttng-tools-2.4.0 | 5 
libuci-262fede3e8c8c08c1eb0... | 4 
              host-scons-2.3.0 | 4 
dtv-scan-tables-cfc29758d13... | 3 
            lttng-libust-2.4.0 | 3 
                     wget-1.15 | 3 
              wireshark-1.10.6 | 2 
zmqpp-36413487f05b165dfc82a... | 1 
                xapp_twm-1.0.8 | 1 
libstrophe-d408eaf2bbfe5ff5... | 1 
             host-mysql-5.1.73 | 1 
                 mplayer-1.1.1 | 1 
                    crda-1.1.3 | 1 
jack2-37976441044d69b91d61d... | 1 
                 qt5base-5.2.1 | 1 
                  ifplugd-0.28 | 1 

Detail of failures
===================

       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/a8e7094824fd6ccb3d541b6a715477dd3a82bb55/
      i686 | dtv-scan-tables-cfc29758d13... | NOK | http://autobuild.buildroot.net/results/da357d0ecaec78f65e90f8e5d1a3f7c73f0a6f53/
      i686 | dtv-scan-tables-cfc29758d13... | NOK | http://autobuild.buildroot.net/results/b96f45e17f6d42ca4bdadf3a4cd59d76b55870c3/
       arm | dtv-scan-tables-cfc29758d13... | NOK | http://autobuild.buildroot.net/results/430de35dca437208f7b2ec51955e3fc5aa1ff2df/
   powerpc |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/a027648f16c60501c25fb03af37d63f49dce4b36/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/68b9db490b4defde0124596d9f657d6726de58a7/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/9be81bea14de05e892ac990b171aa9ebe70b5ee7/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/85d6ab7148177197a78ddbd8752a0cf86eae5ebe/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/7a39e18dfd2e70c9db081ca2d146163a80d1ec87/
       arm |                   ifplugd-0.28 | NOK | http://autobuild.buildroot.net/results/6b6ad678df549d8cb4ce0fa4a76013a3c26809a3/
microblazeel | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/4b81a95c28878879ed3ac9881d4e7d6fb855f78d/
       arm | libstrophe-d408eaf2bbfe5ff5... | NOK | http://autobuild.buildroot.net/results/f1c5e50269770a19ae60980714024af34c43e48b/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/ba9752a7bff34942fa9b673b6cf2b3cdda6e1284/
   powerpc | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/c6361937e70d6e11b44dc69249fc3eb1c3c09c32/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/2eed4ee775983784604ed747a2ec8ec35c82d75a/
       sh4 | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/5141d1bdfeccbcc1423b96c05be8fa3990a86544/
   powerpc |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/ae5877daf7f0c57bb19a88285754b18ad927e510/
   powerpc |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/a6c33dd7ec2a36a50c5ea74b989a371d6c85e899/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/92ed579a1c5e861bd7d472f31782c1fef31b702f/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/2330cc9c68bb6289ce38d989d5e602ec98d8c6f6/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/6b73d150bb181207e37bb67d871c33e37dea3e76/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/caf638baa17ea9bbd25cbcf7dc9be9bf67a1a952/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/7d697515c5ab9de19427296a89f3a16fbefe1d0c/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/6a66a389035939af542e172dbe2027ffa671e28a/
   aarch64 | make: *** [dtv-scan-tables-... | NOK | http://autobuild.buildroot.net/results/e453310340c9ed6529e3d4d68af541669450a4d0/
      i686 | make: *** [dtv-scan-tables-... | NOK | http://autobuild.buildroot.net/results/bd6ed0531e12dec91379f10879fe59e663dddfea/
   powerpc | make: *** [dtv-scan-tables-... | NOK | http://autobuild.buildroot.net/results/ff86b2c6a9381abb7644d0a8a1ef30e71e01c483/
   powerpc | make: *** [dtv-scan-tables-... | NOK | http://autobuild.buildroot.net/results/54c72d5e1b5725cb22e0a73c6e30d819b57def79/
      i686 | make: *** [dtv-scan-tables-... | NOK | http://autobuild.buildroot.net/results/39a8ba05c0d6e02b517d44b9c54b76acdb9174c2/
  mips64el | make: *** [dtv-scan-tables-... | NOK | http://autobuild.buildroot.net/results/4451e9c6fb4ea06f1f9570b28e90a9d1331fab67/
       arm | make: *** [dtv-scan-tables-... | NOK | http://autobuild.buildroot.net/results/56e96defb513cf1178cba6031b606ccc5e63a9e6/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/1255aaba073980f8f4479bfbc12e5a3b3ad1bfe6/
      i686 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/87badeb5dd980131c81d6533f3e75d2baf76d5ca/
       arm |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/3069070865f7dbfe1971e01f3a6b1b4078f70e4b/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/c94fab8824d432337689927fe53b6ff33809890f/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/bb85034bca388b170311bc419d9c25e1218cb49a/
    xtensa |               wireshark-1.10.6 | NOK | http://autobuild.buildroot.net/results/bf02e3aec692ae3c335c78976577efd17be4afaf/
    xtensa |               wireshark-1.10.6 | NOK | http://autobuild.buildroot.net/results/d35ccfd0af0590b0102acda62f43a70d236b8fdd/
      i686 |                 xapp_twm-1.0.8 | NOK | http://autobuild.buildroot.net/results/ebf7241bbaa2ae7fe79c43cf63024c92ec0a71fb/
   powerpc | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/886190937cb69c58447c181391f6c57b9f7207d3/


-- 
http://autobuild.buildroot.net
