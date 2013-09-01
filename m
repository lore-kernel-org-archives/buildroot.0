From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  1 Sep 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-31
Message-ID: <20130901063004.C2A1252C5D6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-31
===============================

        success : 83 
       failures : 64 
       timeouts : 0  
          TOTAL : 147

Classification of failures by reason
====================================

              buildroot-config | 20
               uclibc-0.9.33.2 | 5 
                      icu-51.2 | 4 
               libglib2-2.36.3 | 2 
                   cups-1.3.11 | 2 
          host-protobuf-c-0.15 | 2 
                   mplayer-1.1 | 2 
                openssl-1.0.1e | 2 
           libcec-libcec-2.1.1 | 2 
               audiofile-0.3.6 | 2 
           binutils-2.23.2-arc | 1 
                 dropwatch-1.4 | 1 
                      pv-1.4.6 | 1 
                 binutils-2.21 | 1 
               alsa-lib-1.0.26 | 1 
                      qt-4.8.5 | 1 
              sdl_image-1.2.12 | 1 
                 rt-tests-0.83 | 1 
                  poco-1.4.6p1 | 1 
                busybox-1.21.1 | 1 
          openpgm-5.1.118~dfsg | 1 
               libassuan-2.1.1 | 1 
                  ne10-88c18f0 | 1 
                 libpfm4-4.3.0 | 1 
                sdl_ttf-2.0.11 | 1 
                  xl2tp-v1.3.1 | 1 
                  aespipe-2.4c | 1 
               ruby-1.9.3-p429 | 1 
                  prboom-2.5.0 | 1 
               libsigsegv-2.10 | 1 
               qt5webkit-5.0.2 | 1 

Detail of failures
===================

       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/f22931b5e6e7273de8db45ee97d81603cae47812/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/9a01b674db477353fffbe25dd05caa0b5ed8653b/
      sh4a |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/22faa1cc29088de9bec992bd143d9aff8566508a/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/dfcaed52cb4527a21757e17a4a33c33289aecc28/
   powerpc |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/3d3b52a332bcba6f9d0c2bac11140f89b8bc0f19/
       arc |            binutils-2.23.2-arc | NOK | http://autobuild.buildroot.net/results/1147718934709a31367a913004b790872f71518f/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/8d0b022fd3620b48a57a1c3ebbd0b0b1aaec0a9f/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/e49b4364c126627d856b8fe85812fcdfc0fd4396/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/aebdb1889009a6404c96b6e58e960b5cb71386e7/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/aeee6639ae89ef0c9577411b957847b7c777c752/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/5cb123f7e790cb23017ede0f376a51f18f89846a/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/dcc36afb91646d675eb166173161a8a3e9b9f04a/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/237057381357c3f3a4978379eb3cae4b45943369/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/edb68cb907378e69f5304c7aae6776e11d39b7bf/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/697e2fbb78710e04c058c7af13464ab8f4debc18/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/e04c02b2b82fa9d437ef90e772570f7bf6731164/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/4d6ad5e0bc76b7d1b16eafd7b67e48178bff16ee/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/3263aded05b1a58693460cb76553ee1cb757b4df/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/ec927d0742c98b12b4ce07cb224524808bca9737/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/9b96fe64a9c4140eda5b81dbe25b8e85b528651a/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/25bc93449014964aadfe9ddfce22b79befa758ba/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/fb5fd7531b911ea2e2651c38e26921d6249a7d6f/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/89e81e675b97e06d3728d07681fe9d9cdb54f04b/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/968a73eb989c8c9b9416d6a5c2a9241f12b0b53f/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/d816a4386aa7256c936c692cd883dfa66c405680/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/3e8b96d9140813e4ae3b1dc06551a5a9d1ad34c6/
      i686 |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/be9189ff995da7b2d4a033cb666b67baae80307e/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/2b6fcc3962d971601956d6487fa4fa897f579fbb/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/2d5cabb54c77c3ceb508fef259ecbd05f7f38322/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/146af890158e740dff2276f3d3cf0ecb30f2d176/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/507a6f7a3aa4771cf8ace78eaf36d7fcbf48549b/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/59ae754f3a9df66ee178567005a497376280c382/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/ecd5d080e098666591469d47a668fb93fe28b548/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/807c7c7d507e1d18036610d2f8309bbc3a15db03/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/b6b7fd50d3636760f4700197516666b46793fc44/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/2a1575b4a440cce171d528f876b09f2807fe5bae/
      bfin |                libassuan-2.1.1 | NOK | http://autobuild.buildroot.net/results/9097a9b489d7fd93b02e3519c1c97e38ad3d024a/
   powerpc |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/eb19e83444911a68b269e3b84ab60751978e1405/
   powerpc |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/483163239668d7c9402a9b0364bcc7b9d6263c77/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ab3b81b56069a8b745eaffa4f05fe7bc8204bd26/
      mips |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/0425acf402b55c226abc90391e653bc101886ee6/
       arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/fb3f419c11f10be8ffcda37b1501693f7f7a10f7/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/93a3525f1d12d222826f20c745b1fcc63b737712/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/9108618c98bc3210d920533976c3d11509ba8fe4/
       arc |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/89538d76aa94eb13c988605d7be603f094757d4a/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/65a531ca702b2f338b3bc91b95437fb51a5e02b2/
      bfin |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/d7acb584a4e4e4894b201fac1953e23f9e527f07/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/28118e160910feca8c7f98bdc2e86c41f4598f51/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/fa15747db66b2aaee4b96b88089905a47f54daca/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/f2c1029d9de9a76d7f9c52577f8b1aea3d3c8041/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/da0c469669bc8a61369e07491014805655926b59/
    x86_64 |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/3545d2cae38e312d15c91d1f0ddce5e424c7d7f3/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/77627017f8eb2f8d794dad5e467ac5bd31524508/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/7301d5d136d75aa0653641262d4ef6f246ae2698/
       arc |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/c9201b7008f549679cac32f1f57294be847e7725/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/2952f41095d682b5a2787ba1e01c96445009103e/
      i686 |               sdl_image-1.2.12 | NOK | http://autobuild.buildroot.net/results/995a2c9ee4218fe6aca10eb3d9d05ccfe0ebfb2e/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/8dfe5389c65c0daa426d39e0dd1093177564108a/
   powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/981f7dbe509df22f6af18967115e6cce9c78f147/
   powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/21a36ee411057516bd1a3597dd1d45673f43a405/
   powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/fee4686eb3533ac0f3952db1c57315ce9fb7bc9e/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/fa1dbc5c7555829c58c328e8d6361020790c9246/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/454bd70218b9768b94175e4599e5644c625fa55f/
      i686 |                   xl2tp-v1.3.1 | NOK | http://autobuild.buildroot.net/results/92e9936d6fc0ca8ba116484299adf0b623fd5199/


-- 
http://autobuild.buildroot.net
