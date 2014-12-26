From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-25
Message-ID: <20141226073018.703E2101276@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-25
===============================

        success : 275
       failures : 77 
       timeouts : 3  
          TOTAL : 355

Classification of failures by reason
====================================

f2fs-tools-baac4b4e6f41ceb0... | 18
                  guile-2.0.11 | 12
             libxmlrpc-1.25.26 | 9 
                     ntp-4.2.8 | 6 
                  xerces-3.1.1 | 5 
                    libcgi-1.0 | 3 
                  dhcpcd-6.6.7 | 3 
                  thrift-0.9.2 | 3 
                   erlang-17.4 | 3 
               host-qemu-2.1.2 | 2 
                oprofile-1.0.0 | 2 
             bluez5_utils-5.25 | 2 
        gst1-plugins-bad-1.4.4 | 1 
                  zeromq-4.0.5 | 1 
               host-ruby-2.1.5 | 1 
                    qemu-2.1.2 | 1 
               sdl_sound-1.0.3 | 1 
                gptfdisk-0.8.6 | 1 
                  sispmctl-3.1 | 1 
  toolchain-external-undefined | 1 
               libcap-ng-0.7.4 | 1 
                  redis-2.6.17 | 1 
       directfb-examples-1.6.0 | 1 
make: *** wait: No child pr... | 1 

Detail of failures
===================

      x86_64 |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/0c73f34b2470a26d8de2b6a7b43cf29d0afa08ed/
        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/bf89dd5babb6af116de87b997f75c3d9ba85329c/
     powerpc |                   dhcpcd-6.6.7 | NOK | http://autobuild.buildroot.net/results/eb342ee64b4ae3e15217e6f12b7956696a70c57b/
     powerpc |                   dhcpcd-6.6.7 | NOK | http://autobuild.buildroot.net/results/3129f5b105a2a01d1060563572daaa836149b4b8/
     powerpc |                   dhcpcd-6.6.7 | NOK | http://autobuild.buildroot.net/results/647314c762ec2e1c96415815920c18dc9755d138/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/3d3d55dea59c3e455e1bd804c3529500b9a5898c/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/e84440bd48f238d44908f466427d18af52af0148/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/a13ada236c12d82874cab62e44229fe50cc2be81/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/96bbb32b1748046a2d3a63935e2a4572322257a7/
         arm | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/a6a147804288adea0de5661ce0f7be49247abc42/
      x86_64 | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/b346472e686af5b517b689217349eab21878bb7b/
      x86_64 | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/c3d0d227e6b5bc7eb2c92023076761bc01c17104/
         arm | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/6b7e79987271ade5bf3ab33e030c44e5f9350b0a/
         arm | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/ee716c5de2bafab91d92961e23416e6959f3e93c/
         arm | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/a25aefc2e079a9de08aa77183f7591805fd59fc9/
      x86_64 | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/7a4ac31458ef7bb3ea1da1aaadd2450c0c6fd154/
         arm | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/cf6f5b6981694f74bfca45b3d04ff35e4226b162/
      x86_64 | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/dd259a6aa4f2fdb61453f2ac16377b143f6c324f/
     powerpc | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/7af5befb5ab146a9f3e09fadb39d848a4c1bf9e0/
         sh4 | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/14442a86a26a34ccdc672d7d57fe205b87a2a4e3/
      mipsel | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/9a1dae220fae33494078ed060fb3a74e134f1259/
         sh4 | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/49a6a2a88cac6e0899f271a5e65c78dd9eb2eab4/
      xtensa | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/c55263a137411dde450171157aa0333e8cc606dc/
      xtensa | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/efe8f81858b21682b7138332a42bf8a70995b423/
         arm | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/55a3ac5dfedd8fbc2c987244380315e209bd78f5/
        bfin | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/84e9ce19ea2655a63f90f65758b0ebf8cffa0cb1/
        bfin | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/b0925c520389ffdeceb05d8c2819eb58f8677fc4/
    mips64el |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/50be02e77333c4ea782409f2024f221441064b97/
         arm |         gst1-plugins-bad-1.4.4 | NOK | http://autobuild.buildroot.net/results/de34744c114a4ebe98549a8e3190dc5df5db8e1b/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/f9ea21e19281c3e6c9dc800ca16659405df874fc/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/6bb318e4299b7b8875a83093bac8228e93628dbe/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/0647e6d9d7a9e784a70098cb3472e9ac66e69925/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/858ea3cb7fa667df7f6ab165895be518d7392e75/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/ddb1f04515835df4561be32d9055782984f20920/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/6581ceb9f414aa3f71b8c25f9f5e1b386bd3f432/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/540f1bbf4d599b8edb2aeb83377d5dcc67950865/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/713003bc6e85f7b8cfd7b51016902e60b9964e70/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/370660755fb4fc44acf12799b8d8d0afa2a74aec/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/c2e5f6e0af1c8c781a7a177ffb9eb7b4478eda5e/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/cd255c6d8e8580fefa9a8d74815e87b6ce76a1d6/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/2458778db4015b08e4d0b2b090be5d300c245300/
        bfin |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/081f7a4916c4a6dbdeab93c37363879ace35a69c/
        bfin |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/750efaf031a79239181a51bbf0159337da9fbf9c/
         arm |                host-ruby-2.1.5 | TIM | http://autobuild.buildroot.net/results/76bb32b15129df87fca821ec644803ee26a118ef/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/b3c7821dbd9763be30c203f81020f36f8f8c07e0/
      x86_64 |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/e7dcb34bbf83485b5a7ba723a7e8d22dc44d849b/
        i686 |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/d979b082ec2e793e046d5e8de08eaa7ca9874a1a/
     powerpc |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/49b08e4cbb4fcdcd37b934745da131986d825835/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/00436e3dd62ecee81cf0275b5dfcb65f2e66d61a/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/2b77084097e59f137f658042f3ee84af44ac45b7/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/d7c566e194e7fd4d31cee96b11c6f51cda698d13/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/b09913b103e86865b3b90096ee089ee78ef43d5d/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/1b7ba55cff194de1cedfe542f6452ad68a31ddde/
         arc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/87645cab4a2eb6cd7865b1981b8310e1aa494657/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/d0ff66987003f195b9a44ba761bf2616a151702f/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/c3da13613ea16db94cc38d6f3c559f541b9fcbde/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/8fca8af688de17a9115d667159d714ed35244caa/
         arm | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/0787c3204ccf2016619c4a83a129a9d5317ab269/
         arm |                      ntp-4.2.8 | NOK | http://autobuild.buildroot.net/results/0056192a06d44814a0279637c4bcbf602936e7ff/
        i686 |                      ntp-4.2.8 | NOK | http://autobuild.buildroot.net/results/8f372acf73743edf8027cda6865ba1aa7b6413a3/
        mips |                      ntp-4.2.8 | NOK | http://autobuild.buildroot.net/results/5189e84004bf28b891da3ee07fecc8717b4e8e8c/
        mips |                      ntp-4.2.8 | NOK | http://autobuild.buildroot.net/results/0b2d8419e9751cb5692fa61870f93c9bb9207218/
         arm |                      ntp-4.2.8 | NOK | http://autobuild.buildroot.net/results/7035825ceceb408fbccad3dbd599226430fe64ce/
        i686 |                      ntp-4.2.8 | NOK | http://autobuild.buildroot.net/results/3a420e54d17d7ea2af9e2525211f7f6c4d8bf7b9/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/f22977bd720f62504bc1eae5ab23bda82f501d5d/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/a747987c859adf74384524658546abe8a1d1049e/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/d955fc946ffb4704fa0ab8c6f0dfadbeb1754c79/
      x86_64 |                   redis-2.6.17 | TIM | http://autobuild.buildroot.net/results/eaca9ad3412e20b71e61add0a895d6a4f5084ac4/
      x86_64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/8208c347be9a44746a66589be18c6b8e09ba241e/
      x86_64 |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/1106b66bde8472500417345e6b08a20126e7e870/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/9eb6e60330b07f3ccfc1efc8641a61ae59eb550b/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/57fa9f5dab820a47a59e134aa382259d840bff44/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/eb237cc664f3ae2b95acf0cb2868e1ea581a0cc1/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/7cbdc4925b29f20ef2a493ae400e250eab4035d3/
    mips64el |                   xerces-3.1.1 | NOK | http://autobuild.buildroot.net/results/bae510ff2ffac10e9e1ad7ecdc24062af5f5361f/
    mips64el |                   xerces-3.1.1 | NOK | http://autobuild.buildroot.net/results/e176c5e8747d601f40543a5f43931bd92cf7166c/
    mips64el |                   xerces-3.1.1 | NOK | http://autobuild.buildroot.net/results/dbbf9076b029f32d31bda81fbea5139087e55eea/
    mips64el |                   xerces-3.1.1 | NOK | http://autobuild.buildroot.net/results/5795ab9da26d9101631435572613be3e07f3087d/
    mips64el |                   xerces-3.1.1 | NOK | http://autobuild.buildroot.net/results/564bdbb88dab7458bc5587dd5a64e4f791940426/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/a40f76308a5f28896f52978670d74d15c471efca/


-- 
http://autobuild.buildroot.net
