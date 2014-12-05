From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  5 Dec 2014 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-04
Message-ID: <20141205073016.B2AE910149F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-04
===============================

        success : 195
       failures : 27 
       timeouts : 3  
          TOTAL : 225

Classification of failures by reason
====================================

                  guile-2.0.11 | 10
             python-webpy-0.37 | 3 
                  perl-gd-2.53 | 3 
ltrace-0896ce554f80afdcba81... | 2 
                    ruby-2.1.5 | 2 
                 gnupg2-2.0.26 | 1 
    xserver_xorg-server-1.16.2 | 1 
                    exiv2-0.24 | 1 
                   squid-3.4.9 | 1 
                upmpdcli-0.8.6 | 1 
                gptfdisk-0.8.6 | 1 
                 libnss-3.17.2 | 1 
              host-mono-3.10.0 | 1 
                 libraw-0.13.4 | 1 
           libmemcached-1.0.18 | 1 

Detail of failures
===================

        bfin |                     exiv2-0.24 | NOK | http://autobuild.buildroot.net/results/4779ba2c5c48b700ff3302a0fc45ac61cadd6b21/
         sh4 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/b211d7899a46484fcf43f3fae8dadff9ccb94c91/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/0cc8dc8d153506c70ee08303cf0c390e150c8439/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b612ac5ba01b5f1746cb0f58187383ee6280c947/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/ca3e62b216f912a0fccd9d0266edf662209f2043/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/e377d6bfa04c56377db58bff1479653690ea87c9/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/76493a5de51725d32bd30eed33e8b764c8233e69/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/3ca3e96cbf762ed3fcf27aaf912e897d220e23e1/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/f99f2d5f29f282906c3c37b61dd56d6d71971bf7/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d70ffe0e64d5a16778be686d1556a2c2f3ed9242/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/bb0320ba5b39400755a6a5be0131a532944c3014/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/e7301f292cede44212c097fc91805566cf086d73/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/dbd1a8017e768605515f5fa2c021284a9a2534e3/
        i686 |               host-mono-3.10.0 | TIM | http://autobuild.buildroot.net/results/e2e8c5c6a8d4e85e375c01562579f8ceae08cee4/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/b1872e2be09beee3e0db40a01ea3806967c175b2/
      mipsel |                  libnss-3.17.2 | NOK | http://autobuild.buildroot.net/results/e01733c4b8c23f62e2081f0c4aadc16e22c4a2c4/
         arm |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/195d87cf26a8d144e79189e9d37f635624814aa7/
        i686 | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/70a0614ca7baf6a46898834a87cd46865f6e3385/
        i686 | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/fdb7e760faeda77b263a6dac3e322a25b53e67ff/
      xtensa |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/6466c71ac3680923ab95d2ae9918d849c80516a0/
         arc |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/16dfdecffb15e75e46720f4ebc685622e4e4362b/
    mips64el |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/5132abdfac63487f5f984728098f439126c215ad/
     powerpc |              python-webpy-0.37 | NOK | http://autobuild.buildroot.net/results/0fece3ae3cffe21fc4dac428aa3b677fcbf9b6b4/
     powerpc |              python-webpy-0.37 | NOK | http://autobuild.buildroot.net/results/68e24721a349b44525ef4c7c1ce3c11ce0e8de14/
     powerpc |              python-webpy-0.37 | NOK | http://autobuild.buildroot.net/results/4770623d0f58fbe7a93ec9dffae2f10fa9181c00/
         arm |                     ruby-2.1.5 | NOK | http://autobuild.buildroot.net/results/c94fef5d2cfb00a336905ae3c110d7680f6d5416/
         arm |                     ruby-2.1.5 | NOK | http://autobuild.buildroot.net/results/4375cb1e325a336dbf59f22f975be9165ad0648a/
    mips64el |                    squid-3.4.9 | TIM | http://autobuild.buildroot.net/results/a7a229ddccc44e8f9e80b2005430d408ecf9a91a/
         arm |                 upmpdcli-0.8.6 | TIM | http://autobuild.buildroot.net/results/e3404f735ec3cf71731fde45de179bbc84263aaf/
        mips |     xserver_xorg-server-1.16.2 | NOK | http://autobuild.buildroot.net/results/87be2c95957f9925c1258812e536df72689fc5da/


-- 
http://autobuild.buildroot.net
