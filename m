From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Dec 2016 08:29:53 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-18
Message-ID: <20161219072953.F21FC20C0E@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-18
================================

      successes : 140
       failures : 24 
       timeouts : 0  
          TOTAL : 164

Classification of failures by reason
====================================

can-utils-64edc021d22441002... | 5 
             freeswitch-1.6.13 | 2 
             host-nodejs-6.9.1 | 2 
                 openssh-7.3p1 | 2 
             berkeleydb-5.3.28 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                  libsvg-0.1.4 | 1 
             lttng-tools-2.9.0 | 1 
                   mimic-1.1.0 | 1 
                oprofile-1.1.0 | 1 
python-libconfig-b271c3d9da... | 1 
             qt5location-5.6.2 | 1 
               qt5webkit-5.6.2 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  stunnel-5.36 | 1 
                xfsprogs-4.7.0 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/873b3571b9bc010f224255a7cb0c38f1cd4c6d78
microblazeel | can-utils-64edc021d22441002... | NOK | http://autobuild.buildroot.net/results/fd97aa57747a546c799caf094aafe0d1d1225863
microblazeel | can-utils-64edc021d22441002... | NOK | http://autobuild.buildroot.net/results/1313f91df134035159e677c6b4a63838c75d074c
        m68k | can-utils-64edc021d22441002... | NOK | http://autobuild.buildroot.net/results/a1ac495c5e38e5d0777c431fc6a2e4b5bff7c2ad
         arm | can-utils-64edc021d22441002... | NOK | http://autobuild.buildroot.net/results/978bee40049896bd6e093fa31c5eb7673e05a6b8
         arm | can-utils-64edc021d22441002... | NOK | http://autobuild.buildroot.net/results/c692e96de1b4fdadf720ead8249a44c21fe945f1
         arm |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/2fb39defd42ca9fb7447158af4a26cb2d8ae9e4b
      xtensa |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/b370813ce8bde65a9208d7678e67a3b2f22ef36c
         arm |              host-nodejs-6.9.1 | NOK | http://autobuild.buildroot.net/results/c189d8dc0ccff223a3c8a751148cc9b61b3a505c
      x86_64 |              host-nodejs-6.9.1 | NOK | http://autobuild.buildroot.net/results/728c0d36ff8495095ae748fa0e1a02cbb4739dfd
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/25b138f1b2f2e0f71a2c3d099d1143c91471a873
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/f80fedc8b7eaa19919f4a37d354c791e4cb9ccaf
   powerpc64 |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/c77eaaeba9e6adf3ced1dd9d4866ba72f84c3ad2
        i686 |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/3c33d240d9ca063ade72535c9412403b7240dce4
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/d806fe4d45da137f61cf43256e4efb352deb70c2
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/7b121691774564e9961536bbc08279214eb7d782
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/08ba240bca37dabc91db1d3542681ba72fb7b061
   powerpc64 |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/66dd4f7ff635915a506f96d1d8115ac48cca0c6c
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/2a6d291422484a5c107309bdb3118f39d6f51af8
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/f1fd05260f7915c06143c650c2cdefa61234edf6
      mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/216f2127802b764905c13512b96bfac54ce87425
microblazeel |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/d997996eba4d514122ece32edbcb0de73b57d0e9
         arc |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/64d6115b7769aff995737e07f8f5ef351b817824
      x86_64 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/0a49fca12362502cec38407874ec92025cd4c7c6

-- 
http://autobuild.buildroot.net
