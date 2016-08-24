From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Aug 2016 19:25:43 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-23
Message-ID: <20160824172543.EED7510CACD@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-08-23
================================

      successes : 166
       failures : 42 
       timeouts : 0  
          TOTAL : 208

Classification of failures by reason
====================================

               binutils-2.25.1 | 6 
                  ffmpeg-2.8.7 | 2 
              libarchive-3.2.1 | 2 
               libglib2-2.48.1 | 2 
                 libraw-0.17.1 | 2 
                     php-7.0.9 | 2 
             rabbitmq-c-v0.8.0 | 2 
sconeserver-bbb384404575f8a... | 2 
                   taskd-1.1.0 | 2 
                  cppcms-1.0.5 | 1 
                   glog-v0.3.4 | 1 
                     gpsd-3.16 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
iputils-55828d1fef3fed7f07a... | 1 
                 jack2-v1.9.10 | 1 
                libaio-0.3.110 | 1 
                  libcdio-0.93 | 1 
              libtomcrypt-1.17 | 1 
                libxslt-1.1.29 | 1 
                   lite-0.8.10 | 1 
                   luvi-v2.7.5 | 1 
                 mono-4.4.2.11 | 1 
                   ntp-4.2.8p8 | 1 
                 openal-1.17.2 | 1 
               openswan-2.6.46 | 1 
            python-meld3-1.0.2 | 1 
          sane-backends-1.0.25 | 1 
                  squid-3.5.20 | 1 
                     wget-1.18 | 1 


Detail of failures
===================

        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/1e93be2fb02a3fb2731e48b0d9e54a0d4080a112
        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/ba908c6f3f0e56d4fc4ee6ab4f40703ba3296f69
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/1096b98b363c98714f76d10e3a5510fcd3eac53e
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/3c09e402dfb131042e9222176cdb319175a30e07
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/888e27716e47f33456e9725524d7da4497b9f193
        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/d6a884d05468b2fdcd3a342040418e4033505808
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/982045865fc430ec451965b23b0b5c5bdedc8739
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/35aa630db927115b0c53de2fc8e2e1df209248e8
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/beb0d5ee2841fab2fd8775cad18753e8087ca28e
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/914cc267eba357cc0c425f07e57c6ae35b099b7e
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/f9105e0102eb18f7cf11f77059ef744370f0ea2d
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/fcbee8a488c9187bec5c7185ce26b5268de85d8a
         arm | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/e59247f73ba4af4cd5d7ef285c4d359b4c930def
        sh4a |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/e01e49ff1cafc2be155f7bef10cf237035e74463
        m68k |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/b3cb8e2b31fed783a106424b74aac32e7b891d28
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/b8345157a1092035c8320a7953a5ffd022b13d22
        m68k |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/b4968493aac1156d45a92b546e60c76a318ed64f
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/5e5c06f3dfeed39dc31ae277f8330ce0f3ce7e19
microblazeel |                libglib2-2.48.1 | NOK | http://autobuild.buildroot.net/results/389f1bf27a943f386437e2802aca03efa5f89358
microblazeel |                libglib2-2.48.1 | NOK | http://autobuild.buildroot.net/results/65da6954f20ae416c492f0d8aed10b10099260ed
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/87adc290c898297e7cbf7e08c286d55d11b4f431
         arm |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/9eb895028668ab87843547018947125b39ecf4e3
        i586 |               libtomcrypt-1.17 | NOK | http://autobuild.buildroot.net/results/bdbfedf44e3863cf0df55d0b7661ccbffd90836e
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/3c74b1b08d8f36ca076ce725aa1c0a62a405f7af
      xtensa |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/f8ad644aa8f158bd577e6919d5fb9b9e25284254
      mipsel |                    luvi-v2.7.5 | NOK | http://autobuild.buildroot.net/results/8e001112b1678f9fb1c198c84184cd6f5fc3d004
      x86_64 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/c0c2ae7396f6173d3fc80ecb39d7acee1cdd0290
        m68k |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/728a36fbd7c79747f706c6a63e8d134e0274b01f
         arm |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/d7ccef77a355ccc23f26d012e8441af931469ae4
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/c5781ebee130b766724c3ea9eb58c415ff013bf9
         arm |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/6dba31c844b9d45d3dac4d5dea07bf09fbec38f3
     powerpc |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/f874bbef479c62995fb33031317e14797c57d207
         arm |             python-meld3-1.0.2 | NOK | http://autobuild.buildroot.net/results/f9ef01d2cb1d32cb13743e83c7fc9c0d354fc571
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/d1626811f00c51ea727d7a300774cff3002f1d4d
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/f478701ed5d8297876b03ad88bb330bc124953e0
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/f8be64d3c7733b4dcc04a4ffb1ead3442bdd42ea
         arm | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/749fbd6cc505f6f3c0cccfeb63be6deddab8fba5
         arm | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/d4927c124558ebe5969f4dc1ca58c7f59aff39cb
      mipsel |                   squid-3.5.20 | NOK | http://autobuild.buildroot.net/results/ea531dcaa3ecaa2f01131853f90af75db7b58496
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/f64c63980394fa03a0f6c5c8f9723e4e6fe0bc6e
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/0354b44ebe9d7b64ad69da1dcbb66d76d7377abe
        i686 |                      wget-1.18 | NOK | http://autobuild.buildroot.net/results/5dbf340aa2f8edf9c956b51e8a7382d05d6a7cb7

-- 
http://autobuild.buildroot.net
