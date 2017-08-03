From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  3 Aug 2017 08:30:49 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-08-02
Message-ID: <20170803063049.45E0621EC8@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-08-02
================================

      successes : 136
       failures : 24 
       timeouts : 1  
          TOTAL : 161

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 4 
              swupdate-2017.07 | 4 
                  cc-tool-0.26 | 3 
                 uclibc-1.0.26 | 2 
                    ficl-4.1.0 | 1 
                     gpsd-3.16 | 1 
     host-erlang-p1-xml-1.1.22 | 1 
kvmtool-bed2bd9e1fbef581909... | 1 
                libshout-2.4.1 | 1 
        ltp-testsuite-20170516 | 1 
        luasql-sqlite3-2.3.0-1 | 1 
make[2]: *** [libs] Terminated | 1 
                 qt5base-5.9.1 | 1 
snappy-be6dc3db83c4701e3e79... | 1 
               wireshark-2.2.7 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
===================

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/96c7a8130b804e0ca035acf412f3a904388a2921 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/090ad8c89756543130cf6785bca6a7aa10f2f87e |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/9a88ce3b7afdfd3053e0a098ca47611a22a840e0 |     
         arm |                     ficl-4.1.0 | NOK | http://autobuild.buildroot.net/results/d72a7e9775a10bc884b9953dd2eba3ad32100cca |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/a3de121068d90a7d94500176ffcef367a8c0f846 |     
     powerpc |      host-erlang-p1-xml-1.1.22 | NOK | http://autobuild.buildroot.net/results/4730476b360ec6d5e025437ce5092a50bba5e08d |     
      x86_64 | kvmtool-bed2bd9e1fbef581909... | NOK | http://autobuild.buildroot.net/results/aa837013534083c299f2408ab03739685ab12b13 |     
     powerpc |                 libshout-2.4.1 | NOK | http://autobuild.buildroot.net/results/7a00b9d0ea6a3ee441a89cbe9b5f7f256dc561b7 |     
     aarch64 |         ltp-testsuite-20170516 | NOK | http://autobuild.buildroot.net/results/a82150e5043971eb791b85a6e925269c11a723dd |     
      x86_64 |         luasql-sqlite3-2.3.0-1 | NOK | http://autobuild.buildroot.net/results/19b07adab2105c75de9444b03ccd5848b04d7ef8 |     
microblazeel | make[2]: *** [libs] Terminated | TIM | http://autobuild.buildroot.net/results/0269e8eddf6067e948437504531a540b7b63c38a |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/66a9da35d522067a96f9b26655df7e8ed9a1e3af |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b72bc7e2be93b2348c2b3b67f2ccb8db294d132e |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4b3b53ae0f278f70502bd125db218d6546ca75f3 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/22a7389b3eb2c64e693639d00b510b038b5b9083 |     
    mips64el |                  qt5base-5.9.1 | NOK | http://autobuild.buildroot.net/results/6f3c2fcb0a44cd13ef4c73822d4d08f923291099 |     
         arm | snappy-be6dc3db83c4701e3e79... | NOK | http://autobuild.buildroot.net/results/858eb45b5f6f8471fe520bbe6de71df6203c3e06 |     
         arm |               swupdate-2017.07 | NOK | http://autobuild.buildroot.net/results/cf73a914a9644c7bbb268fe5c0fb4fe5707274ad |     
         arm |               swupdate-2017.07 | NOK | http://autobuild.buildroot.net/results/9209ad927ce36e3135b2aca59a394cf376431d39 |     
      x86_64 |               swupdate-2017.07 | NOK | http://autobuild.buildroot.net/results/6b2c1a34601cc74147a082a81fb41d4506a9d3e4 |     
        i686 |               swupdate-2017.07 | NOK | http://autobuild.buildroot.net/results/a5492718134cca7dfb4abe1bba1a1af70620836d |     
         arm |                  uclibc-1.0.26 | NOK | http://autobuild.buildroot.net/results/7552fbb6652147e170201109f33b629cd7a993fd |     
      xtensa |                  uclibc-1.0.26 | NOK | http://autobuild.buildroot.net/results/62e97027845e556a1cec06933a6a14ad1098cdea |     
         arc |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/da0b5dae828eab9463793bb4c0af6a8875955817 |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/c43d794589817391d666c0aef97a64c4dde48d80 |     

-- 
http://autobuild.buildroot.net
