From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Jan 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-08
Message-ID: <20150109073016.7B66E1011EF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-08
===============================

        success : 190
       failures : 54 
       timeouts : 5  
          TOTAL : 249

Classification of failures by reason
====================================

                  squid-3.4.10 | 19
             host-guile-2.0.11 | 16
                  newt-0.52.17 | 2 
               lightning-2.0.5 | 2 
           python-pyzmq-14.3.1 | 2 
zmqpp-36413487f05b165dfc82a... | 2 
                 opencv-2.4.10 | 1 
                   lame-3.99.5 | 1 
             libselinux-2.1.13 | 1 
                  thrift-0.9.2 | 1 
              wireshark-1.12.2 | 1 
                libsrtp-v1.5.0 | 1 
           libmemcached-1.0.18 | 1 
        gst1-plugins-bad-1.4.5 | 1 
                       unknown | 1 
              strongswan-5.2.2 | 1 
                 dillo-3.0.4.1 | 1 
           host-openssl-1.0.1j | 1 
          sane-backends-1.0.22 | 1 
             alsa-utils-1.0.28 | 1 
              pure-ftpd-1.0.36 | 1 
            ecryptfs-utils-104 | 1 

Detail of failures
===================

      xtensa |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/964e44f0c1653370600c7e8c647abda3f6380e34/
        i686 |                  dillo-3.0.4.1 | NOK | http://autobuild.buildroot.net/results/10f7ba386a13753c942139b8bc13ca74d8932f3a/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/133ddde2772c4cbdf6e19f23289002aa9142a5b6/
     powerpc |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/209dc257f134eacc269b36803aa29f5423b1975e/
        i686 |              host-guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/2496c2f7026d165bc46df1e12f8a46a5a6b9a61e/
     powerpc |              host-guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/634e342f7f384fc6eba11872aa2d680c0d8dc98a/
        i686 |              host-guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/6c12b4fab3f8e29776655d709cf4ac9731706a9e/
      x86_64 |              host-guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/6be7360b985a8afa2ba184031eace4009d563db3/
     powerpc |              host-guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/14f502687f6344a85e67b37efe9b00b8c586a266/
     powerpc |              host-guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b08e88c1ef68e72ebfdb4f2e8c85c97670b26128/
     powerpc |              host-guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/8f94d45584ace8d9fed8d27c43d09a21b1b28212/
         arm |              host-guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/9ba4be333da87c36b11f8407aebbacaab425dfe2/
         arm |              host-guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/97402e9e0eac88c59ef51b95ab20c7e69aa14245/
         arm |              host-guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/24b9aef88c11243d5c139d00121a439318ccbdab/
         arm |              host-guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/492fd94cac6c6f73df43979704fae140d4d647e2/
        i686 |              host-guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/64b18a738d238bdef33656a6a4876912d71bd01c/
      x86_64 |              host-guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d966d33481e829e3cedd96b756505693787e1f53/
     powerpc |              host-guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/5fc291fe1b937a1dc7bc4eebfb21f404e4b20eb5/
         arm |              host-guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/c0ab3e19ef7b48793f4822068bd33fc5083dba50/
         arm |              host-guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d39f42d07e577abef15da28db5b2d21def3944ba/
     powerpc |            host-openssl-1.0.1j | TIM | http://autobuild.buildroot.net/results/0d5a55189129c8e27dcb72b90b63c5a647d67560/
        bfin |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/61f1e956bb433aa80f859b3cf37d374feee1cb0c/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/7d6464d0feb06df9254cd1d4d3378443477244e3/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/21294128b82801f7a351729aabc1e70084f00e72/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/8689c2fcbe0703170c315b57cd26e403b9b409e7/
        i686 |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/eddf696432843eb59ba03cf3df83c63471a31f59/
         arm |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/88262127226d016fbbbe6cbc35bf9aa7af67eea9/
         arm |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/54ccfc255c063852f2db268c1b74dcac3fc9dd5b/
    mips64el |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/6a6235d1faedb50d20ce5182939766e66ae11531/
         sh4 |                  opencv-2.4.10 | TIM | http://autobuild.buildroot.net/results/27639614db5c34726fad82df1a637ca044449660/
         arm |               pure-ftpd-1.0.36 | TIM | http://autobuild.buildroot.net/results/e1b6d56db55cc0487b83c0e4305173b9e35b0c97/
      xtensa |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/220de467acf66e0702fa09a7b1471281c6a66753/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/561e4ab3aee80e30d3bda4e16af3dd745bf94aa2/
     powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/a69c3d50f206774ae52778b5b647eecfd6cb1798/
        i686 |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/3b626b674ee91915656b7e6c2b21eda1696e0f19/
        i686 |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/cdfe21b8cf72cfcdfe3f99e1d5fb5fc453c4c9ce/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/faefb68f3355f80b6c9bade4f2546b18985e3fff/
      x86_64 |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/7e935b2f47bebcb39654b8148812e7854a5734e2/
    mips64el |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/4a34742d2a941d1642b0549aab086a53615522a1/
        i686 |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/62ed46cdf21a0c7d1704e75457ef310d0d425551/
    mips64el |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/73fcffafbea320f8c64378bbe8a96922b5e7c6b5/
      mipsel |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/c3daa4386a11ba0199d00ad28b36b8b355ac1920/
        mips |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/73fb388860be042b8c67488782db7dc3154ade64/
      x86_64 |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/f468a96b49aea2b8c5b84e51aa0c23edd069850e/
    mips64el |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/a2f8a3a2fe94c49b9b092679dc9f5f49fe702de8/
        sh4a |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/23a938fd1e8f7d26e78c2fca55c8cc1b5fec10c3/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/58a4d8022f880b91bb6402279666db19c605fbe1/
        sh4a |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/578398274aa7fc67521df14009fff24c89616138/
     powerpc |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/75b153a4fd66f22b96d52122a5a586348ce1c4a1/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/9cddc7df90fc27a632a25560bcbd406d7da6b5ea/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/2dc5ac063a5139cbbd60963216db8404c9c04d36/
        i686 |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/531cf835ab12bfae30dc7fcae2260d150d69e7f8/
         arc |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/63417d1855ff93d2a7b17a226f90de22443fba3a/
microblazeel |               strongswan-5.2.2 | NOK | http://autobuild.buildroot.net/results/73dd1a4e5bd947ae41a1269b3680b540bb760878/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/1f6da178323ce76abe116b987c13a7d7819651e7/
      x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/0b8323f36b7742594bdb02b169e0d97f8e2bf20f/
    mips64el |               wireshark-1.12.2 | TIM | http://autobuild.buildroot.net/results/b2706208ef507759ea72753671ae0a7d6bb09539/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/58514abda66d058d4fa2cbaa70e65d72f2ca2794/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/126f35e3b0b95aa8bf4056d6e0888b25977fae05/


-- 
http://autobuild.buildroot.net
