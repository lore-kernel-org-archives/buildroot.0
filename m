From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  1 Nov 2014 08:30:12 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-31
Message-ID: <20141101073012.B67F4100DBA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-31
===============================

        success : 225
       failures : 66 
       timeouts : 1  
          TOTAL : 292

Classification of failures by reason
====================================

                 schifra-0.0.1 | 5 
                   mp4v2-2.0.0 | 3 
                  nuttcp-6.1.2 | 3 
           libmemcached-1.0.18 | 3 
                 samba4-4.1.13 | 3 
                    orc-0.4.22 | 2 
               alsa-lib-1.0.28 | 2 
                    fltk-1.3.2 | 2 
              host-erlang-17.3 | 2 
      dovecot-pigeonhole-0.4.4 | 2 
                  avahi-0.6.31 | 2 
           heirloom-mailx-12.5 | 2 
                   mono-3.10.0 | 2 
                    qemu-2.1.2 | 2 
               libglib2-2.40.0 | 2 
          libmicrohttpd-0.9.38 | 1 
                 omniorb-4.1.6 | 1 
               iptables-1.4.21 | 1 
                poppler-0.24.4 | 1 
                    php-5.5.18 | 1 
                 webkit-1.11.5 | 1 
                collectd-5.4.1 | 1 
                 pixman-0.32.6 | 1 
                     rpm-5.2.0 | 1 
                 nss-mdns-0.10 | 1 
             subversion-1.7.18 | 1 
tvheadend-596b4e0b29937a612... | 1 
             lttng-tools-2.5.1 | 1 
                elfutils-0.155 | 1 
                     vlc-2.1.5 | 1 
               linknx-0.0.1.32 | 1 
                   libcap-2.24 | 1 
                      qt-4.8.6 | 1 
             host-mysql-5.1.73 | 1 
                   lite-0.8.10 | 1 
                  thrift-0.9.1 | 1 
       opentyrian-2.1.20130907 | 1 
ltrace-0896ce554f80afdcba81... | 1 
          enlightenment-0.17.6 | 1 
                nodejs-0.10.33 | 1 
                  nftables-0.3 | 1 
               mpdecimal-2.4.0 | 1 
                libcurl-7.38.0 | 1 
             armadillo-4.000.4 | 1 
                      bmon-3.5 | 1 

Detail of failures
===================

         sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/c8a51006f5e98c5fabe82b07500ceb89c8004c1b/
        i686 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/74287303f07831acdf10d1486f328395155e4067/
         arc |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/160ec0c0c20edb39d7c98777c481655c4d82f8f1/
        sh4a |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/720e2c8a5eab8b47d2510fe03b4a90ec8beafc17/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/daad247db16818f25ab33402e26e27257defbe13/
        bfin |                       bmon-3.5 | NOK | http://autobuild.buildroot.net/results/720644492956f59f4c68d60ecc42bf8710acfacf/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/637f6a337af54955ebd2b94d2b1e2fb84d3e06f8/
microblazeel |       dovecot-pigeonhole-0.4.4 | NOK | http://autobuild.buildroot.net/results/e42b7b5359f74acad314475ebc186c5b451e6c27/
         arm |       dovecot-pigeonhole-0.4.4 | NOK | http://autobuild.buildroot.net/results/e8a1dcae2fb561b8fa27ae96c0f23f720d5f4975/
      mipsel |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/16f6956d5a215fe678a45cc4b24ba196309ee05c/
         arm |           enlightenment-0.17.6 | NOK | http://autobuild.buildroot.net/results/b0d8b1715bd4b33602ee788154188825abce81f9/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/15848b13b735d9b58becab8c880a1f34c03f4832/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/634955d04177feccab8e13895bccfab28f48b397/
      mipsel |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/1cce267cc4b0a7d6bf5ff10f5429ae7dfe96960a/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/1d46cbac23bbe3fc8ba11112b81bc165d6a530bf/
        i686 |               host-erlang-17.3 | NOK | http://autobuild.buildroot.net/results/e2abc0efeadb027b68bf8662ad024cc9c9e17c06/
      mipsel |               host-erlang-17.3 | NOK | http://autobuild.buildroot.net/results/22533d57db8a105deb737830dd0f164de17b17f0/
         arm |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/23ea744dfeec147d1a8b676b37dd4b4e78783464/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/499151dd6a8a924ba83c7e86cdb6e12f098321b2/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d277366ccfc119f151cf111c7c6619b5bf413584/
         arm |                 libcurl-7.38.0 | NOK | http://autobuild.buildroot.net/results/9aab688ca620a875392a8db93915ed5d9d450eaf/
         arc |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/e455cd1342bacb91b4a9ffa2460056455810eaab/
         arc |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/6c1e678fcb1e438c3fc8de8fda7b56e7979b1332/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/a6bd1e8a4d0e76f6af3f94df93d737a80a71d9c3/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/abd1fa0685b1cb4f6c7808841eaaaf7d1c2ddbd3/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/efece2c84716ea34111032cbcd439cf2456aed01/
        bfin |           libmicrohttpd-0.9.38 | NOK | http://autobuild.buildroot.net/results/b657d74a24847d478253301beff54673a2340a49/
     powerpc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/49a2a3e8fbb8002cad1caede21cdf3fa6f2db3c0/
         arm |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/b1e8d62425ce7c2c55c61b6bd892b6ffbee8d356/
         arm | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/76dca96cb6a0e40d0d7239233f3e6f4ff9ebb01f/
        i686 |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/0e5dd5e414ff38fb8ae2aa7fedf1183531bd0c6a/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/5d5074aa73e167099410d244a18114dbced348d1/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/65850774d4c6b875cb6ebbf461dcc48cf8208f4f/
     powerpc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/5298118b20f5e0c4c38104411d979e1c17cca04b/
      x86_64 |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/62af25aace6b17492135e3567f3fa14cc05fef75/
     powerpc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/235cade242ce3bcd583c57575a3612b811fa6e89/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/08ff84363c402cb28b4b37e0c6cefd5da1605304/
        bfin |                   nftables-0.3 | NOK | http://autobuild.buildroot.net/results/ec58bb97e706dd2d15ed7b04bd58bc97848ab800/
      x86_64 |                 nodejs-0.10.33 | NOK | http://autobuild.buildroot.net/results/3c4a5be556cfbd0d0e632757887ebc2f1de64bba/
         arm |                  nss-mdns-0.10 | NOK | http://autobuild.buildroot.net/results/4819cacd4b7015ef2bfaaf1b3fc9ba33f9194315/
     powerpc |                   nuttcp-6.1.2 | NOK | http://autobuild.buildroot.net/results/adf2d463227d1e0fe76ffe144bdb51cfc368c3ec/
         arm |                   nuttcp-6.1.2 | NOK | http://autobuild.buildroot.net/results/0556ffec533af65392c24f7c74092d3282245c95/
     aarch64 |                   nuttcp-6.1.2 | NOK | http://autobuild.buildroot.net/results/cfd9a483903f84a0bc5dbf8a7c123ab84ac4b34f/
        i686 |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/832cf7d95f68c2c40cdd2f5f83170ed4c3e0a383/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/6609b8dec80bec1abe27667977a8cdbac6411f66/
        bfin |                     orc-0.4.22 | NOK | http://autobuild.buildroot.net/results/3162e7ca4a668c0be0a3c74325737cb7879f69ce/
        bfin |                     orc-0.4.22 | NOK | http://autobuild.buildroot.net/results/2732e3f4573c6013648284df8ae459f73dabdf4e/
     aarch64 |                     php-5.5.18 | NOK | http://autobuild.buildroot.net/results/9526f93e2c8c87f8932cddcc0704282008234565/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/ec31257a66583ca69bbad5ecfedb4c25b85268ee/
        bfin |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/0243bee07ef9312741dfe82441dfe30edb0b5fbf/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/d787274e4f6b817c76df688638df86d4c7d0e4fc/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/fd92a762198b8013f84a7b54f4b3caecd7d59f9b/
         arm |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/117fba8af99c37defb69d42d1325a4695fc4cfe6/
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/0a6323ae2b2de56e1662d79c7dd608658cddfaad/
    mips64el |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/8c884413f66ed2871e534fc4266f3185115aad41/
        i686 |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/d0135c96a109a0b065b19bc8059091343ddc9507/
     powerpc |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/d34ab04fe42ab13fa8b581a0bf2c35a5b3b8776a/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/65a81a2e860946535de0f0c32eaa8a63d1b71d3d/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/d7b7fe7030764d5a350e09fe2a6ff6a601b35164/
      x86_64 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/b624c7f9fd7b431e97599e4b9b5e2a87fcb1a0a9/
        sh4a |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/018da8a9f4af0fb342e0d73aeb5d8227ab57cea9/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/ef935a0d9cdd61f4c3fa493608a9d0f4df3a1e1e/
     powerpc |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/7376d1a1f53b6ad588f78902a10f9496c9dd1655/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/e888f49b942364008a410718b87dbc562296ed9d/
    mips64el | tvheadend-596b4e0b29937a612... | NOK | http://autobuild.buildroot.net/results/1272e5e9f99a062c97afaec018280d5a0219b67e/
        i686 |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/06f6f168a86449ce8d810ff094cafca93f9f3a86/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/247f57855a80e454028a1c57e8a78ca28828a275/


-- 
http://autobuild.buildroot.net
