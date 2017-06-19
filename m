From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Jun 2017 08:27:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-18
Message-ID: <20170619062719.53C8D21E0E@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-18
================================

      successes : 117
       failures : 74 
       timeouts : 0  
          TOTAL : 191

Classification of failures by reason
====================================

               util-linux-2.30 | 25
               libbluray-1.0.1 | 11
     python-cryptography-1.7.2 | 10
knock-258a27e5a47809f97c2b9... | 6 
linuxptp-97c351cafd7327fd28... | 4 
dropwatch-7c33d8a8ed105b07a... | 3 
                  snmppp-3.3.9 | 2 
              alsa-lib-1.1.4.1 | 1 
           argp-standalone-1.3 | 1 
                   attr-2.4.47 | 1 
                beecrypt-4.2.1 | 1 
                  cc-tool-0.26 | 1 
                  check-0.11.0 | 1 
                  cppcms-1.0.5 | 1 
fcgiwrap-99c942c90063c73734... | 1 
                kvazaar-v1.1.0 | 1 
                   libcap-2.25 | 1 
              pcsc-lite-1.8.21 | 1 
           python-pynacl-1.0.1 | 1 
                 sngrep-v1.4.3 | 1 


Detail of failures
===================

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/dc62d99ad0c84f0ed58ba9eaefc24d060f061c4e |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/3a1077ddb70c4f2772d6ab2312a90bbd6832857f |     
         arc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/d12eba1230ce25b0f13c83cd8b7a51c983a9c972 |     
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/658057bd52584dbef9105b79ef447e4f09cb1c06 | ORPH
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/4e107733eac23d46be7c2b71d2d7a68c4a76ed9a |     
         arc |                   check-0.11.0 | NOK | http://autobuild.buildroot.net/results/143e8d5f781049d3863a63a2d9264a4f70123a09 |     
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/fb91a30a42e1eb28e012d19b03060071866820e1 | ORPH
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/91c66f7ebad3812e4107e7cb6901d965f712699d |     
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/61da42bbdcd35540ad2fff5b703c52e63e48d414 |     
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/61939db50b1cf873dc0373e5a9cccbf57a1830b3 |     
         arm | fcgiwrap-99c942c90063c73734... | NOK | http://autobuild.buildroot.net/results/8e04bf5a85ecd7f120bc9dedeedc891def6c46c1 |     
        or1k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/04555122d64b3444ead5315c7147a0b5517bc0bf |     
        or1k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/5e5c8174127c1ac57d9d8224a3bd3948c12c4270 |     
microblazeel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/a5332bd5024500466de1b41018770ce1e6ae7465 |     
      mipsel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/22f34e21483bf34c07986cc91bcff9bf85ce6412 |     
microblazeel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/f559482674c71946fbfc9c10fca0364f82323ecb |     
       sparc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/33fc2c85c2f761a372c8d36d783820857de4dace |     
         arm |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/48e77d5a14bd6caf7051d4afe628e8db42e39ffb |     
         arm |                libbluray-1.0.1 | NOK | http://autobuild.buildroot.net/results/3ce92c00371dc0536a119b0c4005e80a8732bffc |     
        mips |                libbluray-1.0.1 | NOK | http://autobuild.buildroot.net/results/57964bf98bdfa91b0e832631b50eff0f33aaf07a |     
       sparc |                libbluray-1.0.1 | NOK | http://autobuild.buildroot.net/results/dacbbe96a6710064f7b8c7cbf5486a3a057ebcf9 |     
      xtensa |                libbluray-1.0.1 | NOK | http://autobuild.buildroot.net/results/749f31de2bb3048de43352dd864f7cf36efa45d6 |     
        bfin |                libbluray-1.0.1 | NOK | http://autobuild.buildroot.net/results/b7866004c50d180ed0a031054da9de0342fde480 |     
         arm |                libbluray-1.0.1 | NOK | http://autobuild.buildroot.net/results/be1847a3321278312645d278b8a0a11323793772 |     
microblazeel |                libbluray-1.0.1 | NOK | http://autobuild.buildroot.net/results/58cb565553831db2e8a4b78fc99de9415eedc815 |     
        mips |                libbluray-1.0.1 | NOK | http://autobuild.buildroot.net/results/b9395ff748489698fbd48428a7b783f9bd6bd713 |     
      mipsel |                libbluray-1.0.1 | NOK | http://autobuild.buildroot.net/results/b3bbbe4af1cf364c178fab9889a808d23d057b09 |     
         arm |                libbluray-1.0.1 | NOK | http://autobuild.buildroot.net/results/630cfe62798d0f35fdfaed8547038ba7673cc149 |     
    mips64el |                libbluray-1.0.1 | NOK | http://autobuild.buildroot.net/results/74175685e9e9976d3f6579f15b77a93e8d162384 |     
         arc |                    libcap-2.25 | NOK | http://autobuild.buildroot.net/results/20ae2e0523504c23926cfde6758be9b6dc2a39bb |     
        i586 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/5b88660b8fa13df0721d4650092aee12143019a9 |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/d3685c584e4c45d22303ad2fbdccfc3697e561c5 |     
     sparc64 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/4c208d0c9ffd2f7e42d1f9428eb1d2c27cc25421 |     
      x86_64 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/d6d49e4b28a5bccdb4185623b0d252841b8dfbd7 |     
         arc |               pcsc-lite-1.8.21 | NOK | http://autobuild.buildroot.net/results/7e0cc74209bfe085b3d765ed4576d9223322ef43 | ORPH
        mips |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/621a9a924a83841602cf2f3b50922040d8d2af85 |     
 powerpc64le |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b75adca8d05790be899005bf816970a7220d5741 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f26d903111557ab9a9f6d47844372a8b6d1f1b6a |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3100c5a3585a3634e82bf9f88d31eb8df6d157c3 |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b5f259031ae93c0d6d4c85eaa0ce95068d19e326 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/06a8b2c5ce5e4571d7945529e4626c9bf8509609 |     
        mips |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a7831488495435d5a6402a2c8492e389ec2ef472 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0cf8201c0d723c3788e462dbf7137056fbdbfe4a |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f758ff199dd390095181376936c67c301a6e0223 |     
        mips |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b9182cb6a088b3744b1378b4525b981be33aeb93 |     
     aarch64 |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/7b80116e8e67a3907b87deeeb76dd6399aa36e6b |     
    mips64el |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/8a23731915c09904cbf6d50d4b57d3ba22f7965f |     
         arc |                   snmppp-3.3.9 | NOK | http://autobuild.buildroot.net/results/f23597424e9c842d5bcade6b1baf76f63a0b8dcc |     
         arc |                   snmppp-3.3.9 | NOK | http://autobuild.buildroot.net/results/4d434a987c9d4318a8909f2935cad6393ffd1376 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/7b0b1d8ba0015308724a9677f890e6e63f77e0ad |     
        i586 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/11476388b8b774dc5ca7c9ceb34ea9ad1a4314b9 |     
microblazeel |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/9730d0c4a4001314351a0a116164ba854272db4d |     
microblazeel |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/4d1440360bddfd0ddbbdddf6077bca0e796f2949 |     
        or1k |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/f3089d8b8727a526eeb553964711e0066287422e |     
      mipsel |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/ace6aaad6bee0f4bed44126fea57a090ff2541f9 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/ff460fff5da05d38776eb04e8ada947290248f42 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/a4979169d78938e0cc06e6a69eaac0ab13dc3084 |     
      x86_64 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/84e8c23ecb77a99f9bb70fca9de4a5062414037d |     
     sparc64 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/d3433ef125b5cfbf8a4b8824c256dbd0ea34b6bb |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/92bc3ae63709dae8cdb8860bd997f72c92ede442 |     
        m68k |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/d9122512b0d0802c19184eccb5056bf985f74e5b |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/dad980abe5dc72df436b21270797b32435b55392 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/7def156b29011b90a20579b4bad436a7acde498c |     
microblazeel |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/0bb97b8edc5cea657992cdb083ce9ae79c969f03 |     
      x86_64 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/8f76af2caf7dd08919a20cc1fd848c920512e988 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/3a8ecda0ce63dd67a73d66fbd238072ddb079900 |     
         sh4 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/8d43e6f00be41fde7163868c5fbc3235097629ed |     
        or1k |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/5049aab863707aae09bde540d98ea8063c017e7e |     
     aarch64 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/e227393a29590b298112dfd8efa4aebe2ffa9294 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/8ad4455dcdfcd991dff728910bdbcfa57f5774a4 |     
       nios2 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/27947db73e4875df1dbeee35a6ea8ad6a31af0b5 |     
        m68k |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/5a9cc647e648a61e3c24f929987df356abcdc104 |     
      x86_64 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/eb01bb21f6c942cf8cf067450f016fd3893cc7cd |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/6f7e3f6b4acc93ce695c07199cf6bf643db4386e |     

-- 
http://autobuild.buildroot.net
