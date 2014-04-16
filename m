From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-04-15
Message-ID: <20140416063007.F1CA8100D1A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-04-15
===============================

        success : 56 
       failures : 25 
       timeouts : 2  
          TOTAL : 83 

Classification of failures by reason
====================================

                     mtd-1.5.1 | 6 
              jquery-ui-1.10.4 | 5 
                  cppcms-1.0.4 | 3 
                  zeromq-4.0.1 | 2 
jack2-37976441044d69b91d61d... | 1 
                  libmnl-1.0.3 | 1 
                     nmap-6.40 | 1 
libtool: compile:  /home/te... | 1 
zmqpp-36413487f05b165dfc82a... | 1 
               qt5script-5.2.1 | 1 
                libcurl-7.36.0 | 1 
                 webkit-1.11.5 | 1 
 /usr/bin/install -c -m 644... | 1 
                  samba-3.6.23 | 1 
                  snmppp-3.3.4 | 1 

Detail of failures
===================

      i686 |  /usr/bin/install -c -m 644... | TIM | http://autobuild.buildroot.net/results/60208633f0116ea0525eb8ec55bc3dd5ea652d20/
      bfin |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/b83fa93cf6f9cd1cb6033e9989b0c26bc650d300/
      bfin |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/46800dcae7ec04ce854a2b1c998e02e8ddd85c95/
   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/cd2abded14d3131df6dddd75ced15cdbe57fae2e/
    x86_64 | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/95e9c1a5f9232ec2aec36c6dde87e84ff007b08f/
     nios2 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/278718ad973b4ed2a9f00c8a63bec5046793c268/
   powerpc |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/e69b9198c0b4b8c1cdf3fa9d94afe1683762fa23/
       arm |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/a4d0b4f142f67660cbd8e4e4bd6b83d12017b052/
       arm |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/0058ad206def7f2f684e215ed314c57d7b240d63/
   aarch64 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/43a16a44a26b38f4c6a2f352d8bfe5e07af6b2e3/
      bfin |                 libcurl-7.36.0 | NOK | http://autobuild.buildroot.net/results/d82c3618e9dde3da7e36ba2b58545a9a8de5e442/
       arm |                   libmnl-1.0.3 | NOK | http://autobuild.buildroot.net/results/4306b2516dbbbb82a39f386811e5abe9f0e901f1/
       arm | libtool: compile:  /home/te... | TIM | http://autobuild.buildroot.net/results/d581a60ff3faec7f11a9b951863209fce9db3822/
      i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/59cffc6682df0383019d22eba5fb5a905d7afef0/
   powerpc |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/51fe39bd942e4d8d0045ac810708719b9459e21f/
       arm |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/703e786cdb62aa2a3baf73d78f99383c7dee3588/
      i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/7c155924c429c853f961bf84c41137e100219b0b/
       arm |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/399495c83678ed5222762647b467d2ba5093ecd7/
      i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/a6769831fd38cc250d543c34de84cf7590bd0fd7/
       arm |                      nmap-6.40 | NOK | http://autobuild.buildroot.net/results/f7a64912f0d7d2529e3495ef445b3a0746b07037/
    mipsel |                qt5script-5.2.1 | NOK | http://autobuild.buildroot.net/results/0e63bc604f3ec422996eb0f5fd92f4437954ca04/
     avr32 |                   samba-3.6.23 | NOK | http://autobuild.buildroot.net/results/ee8f0bfb0064cd1a7f6379aa91658ebac39d98ec/
    x86_64 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/7b9ec11514219e5f315df0b30204f431b4c4f8a1/
      sh4a |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/f8464316e4f1e913b1a37be617f459b62ce8e166/
      bfin |                   zeromq-4.0.1 | NOK | http://autobuild.buildroot.net/results/aa0a6e0f14882bd67aad6ad3641c623cc385c28d/
      bfin |                   zeromq-4.0.1 | NOK | http://autobuild.buildroot.net/results/d98cc96da644cba729239c275d46ef6f7b804e83/
   powerpc | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/f7df9a3dcc5956765dd06e612c9eb4aa3882481f/


-- 
http://autobuild.buildroot.net
