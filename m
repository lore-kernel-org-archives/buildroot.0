From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-07-14
Message-ID: <20140715063013.BF9911016C3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-07-14
===============================

        success : 84 
       failures : 61 
       timeouts : 0  
          TOTAL : 145

Classification of failures by reason
====================================

                    parted-3.1 | 18
               host-parted-3.1 | 13
            host-python3-3.4.1 | 6 
                coreutils-8.22 | 6 
                  python-2.7.8 | 2 
        gst1-plugins-bad-1.2.4 | 2 
zmqpp-36413487f05b165dfc82a... | 1 
          perl-net-ssleay-1.64 | 1 
                libmpeg2-0.5.1 | 1 
                 webkit-1.11.5 | 1 
                     popt-1.16 | 1 
                  tstools-1_11 | 1 
                oprofile-0.9.9 | 1 
               libcuefile-r475 | 1 
               harfbuzz-0.9.22 | 1 
                 libedje-1.7.7 | 1 
             lttng-tools-2.4.1 | 1 
                  cppcms-1.0.4 | 1 
                  zeromq-4.0.4 | 1 
                busybox-1.22.1 | 1 

Detail of failures
===================

       arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/2fe9421e81f473b1a1f4cbd33cbfe64b14b44276/
       arm |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/6bf16ce6b32ce53f6513169e5237e23eadcf0c9f/
   powerpc |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/4af729e19892f69fcbe6da1cd65b324391f8e369/
   powerpc |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/81d94ead4b25db448a865083ce9b097c04b7be2d/
   powerpc |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/10cc6be3f999ab3f507312f64b759ca88f15eb38/
       arm |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/3125808269f04d1b2601cf164b2ce18f56723191/
    x86_64 |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/33631c420326fc70c6763bd92648709bf5c1bb64/
   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/6674f01c3d99dc26f816dc8df13414516dc6dfbd/
       arm |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/2d3a2d758583f9924447f4f21431d5d1f53b4849/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/c6df38192c0a2e6191346a91e3bca2c2352de298/
     nios2 |                harfbuzz-0.9.22 | NOK | http://autobuild.buildroot.net/results/e81ab7e3ebbf94bb813b86c0c429715739da9847/
       arm |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/f84d2d7027918d7296fb01796a37ed83be6e9ca4/
    x86_64 |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/4b1ceca6e824b0e1eb89c2f6c8e9b2d42eefbccf/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/47ed6595d2177b5b97d6dc03965bb6e74103f9aa/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/8c8e8d1171e0336ef579d4e016fdcf5b40d19949/
   aarch64 |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/9f51d836f5f8534c1eda41855c0d0836ef088a29/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/3e13a374ab717c80d21130a2bb4ece06114b380b/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/04a9eaaac6334a270964bcdd687105c9068e95ef/
      i686 |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/b99a2a0ba9f19fe05e7e298984ec6f0c9239c2ba/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/cf7d2b2288f9d8f5cf9c6f00bc5fc9b789ef4fc2/
       sh4 |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/65adff5df8c9db856ea75c9684985b81d71d45d0/
      mips |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/525ba1654efe581e816d483465f67ff0e2c0f275/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/2996c22cd57b218fda9ecfe2477dc67f043dea68/
  mips64el |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/03dccd0bd0e1b18606c44d87daa0565c74282a24/
  mips64el |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/8b7990278abe52127f9cdde9cb1eb5aafc67b030/
   powerpc |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/5e29088826c3fab9b4a5751b783f7a1ecd546e23/
  mips64el |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/3aa753c3e53e42fa7be2ea42b2d0b0b14387036e/
    x86_64 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/8c9f3e9b88c108a299a19602e16f1176aaee5bba/
microblazeel |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/9a74a9707ad8d5b345ffc881cff2880322989574/
      sh4a |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/63171785d0c5744d471dab99caad65a17aa04654/
      bfin |                libcuefile-r475 | NOK | http://autobuild.buildroot.net/results/e25529a76e0b9bc09260f6005c2d0b869fb939eb/
    mipsel |                  libedje-1.7.7 | NOK | http://autobuild.buildroot.net/results/fb8e92ce31b1349672371c1dd0d0b1a762fa5306/
   powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/2996316de02eb470bc66be78b60abd68f0ed13ff/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/9959ddf2754b53c5f9c57e4ffb5bcf4b3c4a5ddb/
       arm |                 oprofile-0.9.9 | NOK | http://autobuild.buildroot.net/results/1038fa9a1182fea723d0becacb70b6e9b6fd3235/
      i686 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/ab19c904340d80c148ed71e4923b99f5220a58aa/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/63271fe4ec2e4da6aa4cb11553a310094e03840a/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/f98e82655e017e46d72eadfdc16d99d26e87317c/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/2227ceda772330ae1cb474dcae3ee3808357ffc8/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/12cd7a0fd167e51e29109ed4411d53338f945b14/
    x86_64 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/46ef5dec7d9cc3b8dc74a26bf63661eada17a2f5/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/3a4632115eff4fd049e25bacbb58ee782be355a8/
       sh4 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/4eff74ac4c318f9acc011ddacc6125e7ef196b1f/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/459a67b2871eb618f0f777e43a18db967c5733fb/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/3bf8f028f9241b24e041551276efc1d53fa0a3b4/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/001a822598dade096d28eebd8dc51450d040bd9c/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/bf2d469095fcd2cbd273b55535cdc9bca227f1ca/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/72983e0823662e38065bd3e857f4787cfa7b8c56/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/b7ef7680a7d05dddc00f80bdeead8b462d53e04e/
      sh4a |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/bf46b8ad2e39a81b90293aa8aa0595729e8f7a5b/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/7a826ac9ec0f2de52973bde9dc88b2a3742207a8/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/f4e3bc2a356092a67460b224dba10fd696bd687e/
      i686 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/7e936ab70466b232ccb03aaaaf503ec270d48c0c/
       arm |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/c3207a5f2ec7e0ddb92cb68ffa989c9aaf831ade/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/97af45d6a3c5671c106b35d012913f5fa5677e9f/
    xtensa |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/12b5612828d7f1fc7d1f69fc01341d5a6e628db5/
    xtensa |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/cc1d285ad6120b14aea1d905ef1466d43dfa925a/
       arm |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/f56936905fa5a2f68893e699ac940585323bc9b2/
       arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/b37f7697368c45330f9d275b9e121203093d808e/
       arm |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/c8245c17b93ef5344a97c5fd626d0173d2dcca1d/
      bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/2637ff5480e1aa42ddc93d73c4ff103147c6673d/


-- 
http://autobuild.buildroot.net
