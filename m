From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 08:30:12 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-11
Message-ID: <20150112073013.6A56E1010FA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-11
===============================

        success : 203
       failures : 29 
       timeouts : 6  
          TOTAL : 238

Classification of failures by reason
====================================

                  squid-3.4.10 | 13
              host-erlang-17.4 | 6 
          sane-backends-1.0.22 | 2 
          qt5xmlpatterns-5.3.2 | 1 
           python-pyzmq-14.3.1 | 1 
                pinentry-0.9.0 | 1 
                openntpd-5.7p1 | 1 
                   slang-2.3.0 | 1 
                libsrtp-v1.5.0 | 1 
freerdp-440916eae2e07463912... | 1 
libwebsock-3c1615eeadb0b582... | 1 
make: *** [target-finalize]... | 1 
               openswan-2.6.42 | 1 
               lightning-2.0.5 | 1 
           libmemcached-1.0.18 | 1 
checking size of size_t... ... | 1 
tvheadend-c051d0bda5b69ce61... | 1 

Detail of failures
===================

    mips64el | checking size of size_t... ... | TIM | http://autobuild.buildroot.net/results/89885757539341d94764cf5647de18927d017a81/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/d403e4a472e9f94bc732844ce71412dee58d1725/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/2cd32a45055a007073a78a808242185ef26381e5/
     aarch64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/6dab74ca3295b4090ae508929c2fcbc507e59942/
     aarch64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/22ce0c5fb40e7c6a0338c326d7d8d6e99d46819b/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/47d5f6b4f9fab387ef56e6ba203f5e5e435e30fa/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/78ebe36da6f691a415399bb976b5f8b008d33516/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/766c51f59695d7edf40b2c2da6868349bedc744f/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/6ae86ce4ab3c3f3eacc01595959a5519e7c23975/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/6ffc163fee4e645487f2dcdde756ed90e6f6e36a/
        bfin | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/c0d22dc40d7d7b48e3fa720722050837ac7c08cc/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/61ef1ae1829e5470ebb91850a73d9d02c70c971b/
        i686 | make: *** [target-finalize]... | TIM | http://autobuild.buildroot.net/results/a141fa00b1a3adfbaf3a8917a4c7f01d6d2c41b4/
         arc |                 openntpd-5.7p1 | NOK | http://autobuild.buildroot.net/results/f4dd964231a5dbbc12a7237127fa9c45d6aa0d06/
     powerpc |                openswan-2.6.42 | TIM | http://autobuild.buildroot.net/results/77da3f9930ffa347d22df2c0ea1428ba8f6c7a54/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/179e4cc5e025e495d4819d1de1a05c68495f167d/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/7ee46c2c9ad115e7cb8f010c1336ca50faa52b51/
        i686 |           qt5xmlpatterns-5.3.2 | TIM | http://autobuild.buildroot.net/results/226b954eefc640c335fe9c0ac7c059cdf7d67a41/
     aarch64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/ecc6c0eeb4304e1fdca0477928737540f6edff34/
         arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/c389c6a253ed980c8ee91aae099b5b8c71aaa900/
    mips64el |                    slang-2.3.0 | TIM | http://autobuild.buildroot.net/results/7983b54f98fe3d9f9d7f38b584754a3af118c308/
        i686 |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/5f944e5b330d94f2420e57e18e67654edb5605bf/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/043135039dda1fb18d4766b727102b58c067425c/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/9ee393016c009f7ab42ee96d5175989bbde64c61/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/912c3f668bb04b12741f0b2772a46843a721b5cb/
        i686 |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/7614115691928cc3e878fd9ede675691783921cb/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/5ca4204e6c507b0f63a113a7ec2ecbc677fd9713/
    mips64el |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/c79cad84520691d315a875b001ebd3a818d0ffaf/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/b1418cfeb965628750595a2f92da250171b9fa53/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/dd932c4f1e13849cb4634df5023935167d2fca63/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/afee5aa6a4e343d8a627e1fd4d312e0a385be540/
         arc |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/f452223302261c1f2afe766d623f09e6985b1eba/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/9e9ca5ed7a65388a4d5e6049c21fd09812e993a9/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/11f7d272ca176e0aa73f5664a447d813297cc9b9/
      x86_64 | tvheadend-c051d0bda5b69ce61... | TIM | http://autobuild.buildroot.net/results/df2136b48cc2a5ba8059883b4473852a5f3a4d05/


-- 
http://autobuild.buildroot.net
