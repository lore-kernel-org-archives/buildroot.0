From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  2 Sep 2016 08:30:32 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-01
Message-ID: <20160902063032.AEC5F1027BC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-01
================================

      successes : 198
       failures : 38 
       timeouts : 3  
          TOTAL : 239

Classification of failures by reason
====================================

               binutils-2.25.1 | 2 
              libarchive-3.2.1 | 2 
                  libcdio-0.93 | 2 
                libxslt-1.1.29 | 2 
                    ola-0.10.0 | 2 
                    cups-2.1.4 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                   fwup-v0.8.2 | 1 
                   glog-v0.3.4 | 1 
              host-fwup-v0.8.2 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                 jack2-v1.9.10 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                    lftp-4.7.3 | 1 
libcec-2c675dac48387c48c7f4... | 1 
               libepoxy-v1.3.1 | 1 
        ltp-testsuite-20160126 | 1 
                 lvm2-2.02.162 | 1 
make[3]: *** [all-recursive... | 1 
                 mono-4.4.2.11 | 1 
                    mosh-1.2.5 | 1 
                    mpfr-3.1.4 | 1 
                 mplayer-1.3.0 | 1 
                   ntp-4.2.8p8 | 1 
                  openjpeg-2.1 | 1 
                 openssh-7.3p1 | 1 
python-libconfig-b271c3d9da... | 1 
           python-psutil-4.3.0 | 1 
                    qemu-2.6.0 | 1 
               qt5base-5.6.1-1 | 1 
                    quota-4.01 | 1 
             rabbitmq-c-v0.8.0 | 1 
                socat-2.0.0-b9 | 1 
            supertuxkart-0.9.2 | 1 
                   taskd-1.1.0 | 1 
utils/CMakeFiles/testpat.di... | 1 


Detail of failures
===================

         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/c88a0972817c2747f992df9c5ad734866f85cc4f
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/68c4ef447442020b03af23952b712ddd497b77b1
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/de2f78085ce4158abc24fa55dc020f71a72ca0cf
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/3dd3d03f59a4361f62f403865e4582431c663171
         arm |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/dde62fcc57a3f8eadfa312f2a1add8c85b4fc296
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/97c117830cdd5f110c56b788397a20bfc1d9f9ee
    mips64el |               host-fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/42a01117174e39fcfadcaea822b1e22428f63955
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/1e2b11a84439f26a17781a1b1190c69678cdc5cc
      x86_64 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/bad9e6bd0baa86a16eee29363080703a677eec9b
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/322b2f8c08691c99b9b4e114336aedf241c0db30
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/7c81dd47eeb6e86a91bbb58327059047e766d5f1
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/4056ffda2e7787ba35fc7d9ef9cd5eee53343eeb
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/d9e334f63e14e2c87be7fe6dc54f64b0c62ed980
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/fddf65132489757bcacff1104a17efb817e76f1d
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/81df622947872375be453d41aeddba5f3cbcc398
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/6645ffe760476f9f8feb4c921981aa37ff9842a9
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/f13d6ceb40228689235eb110833302b1dfc62014
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/c7a19fdff189e84a99893d30136d78fbdfacae85
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/8b73f117605c83470911d529ee9df5db8cdeab08
     sparc64 |         ltp-testsuite-20160126 | TIM | http://autobuild.buildroot.net/results/6f283b50a0e6c18c8b3a052e6a549b0bdaa413d1
         arm |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/0a2fc28eae119f0e42340b94c715ffd1a22d32da
microblazeel | make[3]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/76ad733a23657b73e7bac3e9d3384e98cb1034cc
        i586 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/6fa39a4fa03180deb8207a80e9f14ebe781d11fc
        i586 |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/2602bcf11dc8d28f04160e223131618ce6b3f2a9
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/7efbf4500ef373cf635a6b569ddac744e82d8fe1
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a9c46e3a0c1b55a3d182aa9df9d29b52607e3bc1
        m68k |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/2ec3df6b3e33226bf4bc5a6ac1cdc08fc839d972
         arc |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/42ab88009f4097114df6fac04ae864efe80c970f
         arc |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/72370b77295d29976d8732281e2ef272cff3d742
        m68k |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/6f021c0b8d649d08db4671eb7f1c0503646221aa
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/88b01768d04d5c4620f5aad16e5f242783faa72d
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/ea4707996ec24f71c6ea7fb8a6f09add9274b114
      x86_64 |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/a802f74a58a3156bcba0974df607666edcc3d724
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/02bf86db871d72e1f46a13c194b1d8403c6ca057
         arm |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/a94d852d375e76fd2f4ec9ffdbc3ecdb398c0a6a
        i586 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/faa71be2124b9e6567fa54dc817c919017435f67
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/da53b2ad86caf5b7ede358099e41b24f46cf55c9
        i586 |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/686e6e134b55fe36157f5384ae8cb8bcf85c5805
    mips64el |             supertuxkart-0.9.2 | NOK | http://autobuild.buildroot.net/results/5ede7fe4f5bf28f1d25968b474f3d94e714cd294
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/f464199810378baa2fbe3231f36d5f60326b2952
microblazeel | utils/CMakeFiles/testpat.di... | TIM | http://autobuild.buildroot.net/results/d4896c0a6186c3fa48a88bee605ec1f2740aa811

-- 
http://autobuild.buildroot.net
