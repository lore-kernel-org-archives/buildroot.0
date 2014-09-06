From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Sep 2014 08:30:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-05
Message-ID: <20140906063010.93F60101336@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-05
===============================

        success : 171
       failures : 27 
       timeouts : 1  
          TOTAL : 199

Classification of failures by reason
====================================

           host-nodejs-0.10.31 | 6 
               host-ruby-2.1.2 | 4 
                  boost-1.56.0 | 3 
                busybox-1.22.1 | 1 
                minidlna-1.1.4 | 1 
                   ushare-1.1a | 1 
                libiscsi-1.6.0 | 1 
                php-yaml-1.1.1 | 1 
                  python-2.7.8 | 1 
                  prboom-2.5.0 | 1 
                 gnupg2-2.0.26 | 1 
               libgcrypt-1.6.2 | 1 
                  samba-3.6.24 | 1 
                  cppcms-1.0.4 | 1 
          perl-net-ssleay-1.65 | 1 
           libmemcached-1.0.18 | 1 
                host-gdb-7.6.2 | 1 
make: *** [core-dependencie... | 1 

Detail of failures
===================

       arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/ac5ad7be5500d50cdb0a1d649361b6fe14d29570/
       arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/812226d89a3d79ce95c53b5f5c736225969cb35a/
       arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/1c98cddde2e4f28ba8b7d653313b12a7c88dbb60/
       arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/994a84d192848b90a70e28e5ebaa769701bcaec9/
   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/d0a1f7a64c0b6a0748123f2525ee09af7369336c/
       arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/87127e51d49ec5281c4ea86a9637fd527ce483d6/
       arm |                 host-gdb-7.6.2 | NOK | http://autobuild.buildroot.net/results/03b15dde13d804e5b8b0df7f887ce0552c69fa6d/
    x86_64 |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/d66c0941009b442292011721d900699023e143e8/
       arm |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/6dc5a30ab02289d28b12fe736ec3fe34cc804da1/
       arm |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/dab15db53aeda3115945fc7befcdaa895ebd79e0/
       arm |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/89b1b745c52fa65313a69a157a4198180fd80cf1/
       arm |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/267f69143908a33054468179f934b28ba3fc4b40/
       arm |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/043c4a940d2cfea56be14b86fabf18b64db0987f/
   powerpc |                host-ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/e197f20bd5ec4aae6d8692d67df4f539a9df33e2/
microblazeel |                host-ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/b1fad7600afd4e9c747834d9585949260c82385a/
   powerpc |                host-ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/625419c6c20b957fe4d0c9f309da8730f0860304/
   aarch64 |                host-ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/521ea04ac7d16ff23901f92600b1b67235a00dbe/
       arm |                libgcrypt-1.6.2 | NOK | http://autobuild.buildroot.net/results/194d91880aefa05bbfec2b83daeed133ddaee495/
      bfin |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/5cba23312890c3985552305f9d85cd38270a9578/
      bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/ed812757a2400a6a060944c661fcd85d600c2a7b/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/a42c4d1abdee3ee28048e68f28781d5914dcd23b/
     nios2 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/a2e40c005135be85e6161f7294d749c63a6673e0/
      i686 |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/179d10ed4855cb0e357ff50517abc737c9abdce4/
       arm |                 php-yaml-1.1.1 | NOK | http://autobuild.buildroot.net/results/c1454491c21c81a2f01b5f21aeff5c39f0a49155/
      bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/12776a0122fa992aa23c80c449de3d6962d20bc8/
      i686 |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/d526340a1e079e504e4655766d0058317acec1eb/
      mips |                   samba-3.6.24 | TIM | http://autobuild.buildroot.net/results/9499dbdd4c6c2b1eb6dbe088b986c2ed72ed45c0/
      bfin |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/1c5efa35c3a8082a1a51cf59d5682b21e5e3d932/


-- 
http://autobuild.buildroot.net
