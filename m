From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 08:30:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-25
Message-ID: <20150726063019.9103D1019B3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-25
===============================

        success : 136
       failures : 156
       timeouts : 2  
          TOTAL : 294

Classification of failures by reason
====================================

                busybox-1.23.2 | 87
                   argus-3.0.8 | 9 
                 qt5base-5.5.0 | 6 
             expect-2014-05-02 | 5 
             libselinux-2.1.13 | 5 
                  ffmpeg-2.7.1 | 4 
               libglib2-2.44.1 | 4 
                  mysql-5.1.73 | 2 
                  boost-1.58.0 | 2 
          usb_modeswitch-2.2.5 | 2 
       host-erlang-rebar-2.5.1 | 2 
                   audit-2.4.3 | 2 
filemq-482797b8aa30fcc9ea13... | 2 
                      atf-0.21 | 2 
               linux-pam-1.1.8 | 2 
                   ushare-1.1a | 1 
                  guile-2.0.11 | 1 
             lttng-tools-2.6.0 | 1 
               curlftpfs-0.9.2 | 1 
                  acpid-2.0.22 | 1 
                    bwm-ng-0.6 | 1 
                 libpfm4-4.3.0 | 1 
                minidlna-1.1.4 | 1 
                iproute2-4.1.1 | 1 
               protobuf-v2.5.0 | 1 
                 mplayer-1.1.1 | 1 
             bluez_utils-4.101 | 1 
                elfutils-0.161 | 1 
               harfbuzz-0.9.41 | 1 
                   systemd-221 | 1 
                  snmppp-3.3.5 | 1 
                 empty-0.6.19b | 1 
               libsigsegv-2.10 | 1 
                  prboom-2.5.0 | 1 
                  c-icap-0.3.5 | 1 
                   ntp-4.2.8p3 | 1 
                  cc-tool-0.26 | 1 

Detail of failures
===================

      x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/8c7a049c8915e1d610997b874581dff915918f09/
     powerpc |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/7a268aad6739f39ee58b7d4f5bd639eee11f6de8/
         arm |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/17260adf70680556d2ce2a470ecd030d935704ec/
     powerpc |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/9e96fa25a29920c7277f59f4af2432a8de91cbfc/
         arm |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/9154e19fca61a4d428656bb02b936a2095e046d4/
         arm |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/05c2fd5725761fee1220d7be36c8bfccceea7194/
     powerpc |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/16582ce227e071b3f65ac3028f47026934803c5a/
     powerpc |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/a45e21f4ccd7ec2bdaa3eafd5b19852685aee199/
      x86_64 |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/7aa7c0441d398ba9d25550ef1ded3b82054e4aed/
     powerpc |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/67f06bd7685ebd4e4a324742c7d2a40344950105/
        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/59b189485fd8dd4901ae696c357e88ef225476a5/
        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/c0bfca931d4fed6115de1c4a4223297d0e52572b/
      x86_64 |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/02f2af1a5d0866d4ccf74b43214d3fb50531269e/
     powerpc |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/1be47a7eb754f70d65a470cc71d2394e3403a448/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/3e336e95484e183415e8561cb79111b5451e12e0/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/0bc913f17212b26becff770476cffe9ce85742e3/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/c86c5fca91336dafb2c70a7a5ab45f27bb00d6e7/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/23d734b2e9b36950a9e8d3496844b70cd81a4ecf/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/5648150873689e5c3efeaf5e4817d917768183a8/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/31cc6ecc904ead91bdd35a8f49d3e93f189fce1f/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/01bc6a25121bed28e6d7d6319c114ad4c26ec966/
    mips64el |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/8754c98def7bb82ef74fe8576ffe8ae3b7b56a96/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/2f5bea67d629b1bd972c61186a068cdbe7a549a6/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/d9886a4ff7d7bfeb1e670e75ca5183e43e9389c7/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/af98fd1ded87641e74b0c9fdcea077d9a4ee01b6/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/39c1466d72d8a3a5ce906f47649a4091d034d27e/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/41384e2b293234c5ff1eccbb37869f10577284d7/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/6326611d79bf1406231d41cca975e2e00090f49d/
        sh4a |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/1bdd364e0462edd4689dfe6487559be5e86d32e2/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/d9f68d75a5956d0a38f01804cce50e5b8a3464bd/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/3683fef0bf625d941912571e61254a89e7b7c2e9/
       nios2 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/71ddf8ea487654ae1ef6dc50fe011b6c0b6921c7/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/d2c3dcbcaadc850c82900367ae9336967f4ed442/
        bfin |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/7e8b7aecbb80ea34426e9215955d61cad1eb2c09/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/641474dfd97241b4129f785ced7d8f70f452ff41/
    mips64el |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/9806821fb8365a9363d73727f3963c18b6ace1b1/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/9c138b02ae22da5b9ea2df0740d778c08901cb38/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/76106e1d792acc4cb756197947549e0547d5345e/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/03ecb7e6eb24ff087aab7f6366c6e68f8763d6cd/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c1139168668e341dcdcdf56bda7f8482b704ceeb/
         sh4 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/41d43ec578444012993d217b90520e4aaf4d2e78/
        sh4a |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c8d363671343be103ccbefbf32a2220969fc0172/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/e496188c0e15f526fc3e166711035b24c7363504/
      xtensa |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/2100e304b985baa6b3974bdcc7fa144d67c27cd4/
        i686 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/68d303002e9aaba57c493f61657c9a962c184b50/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/595675c5f270bed003aa89b9c3dbb15e82f5ef60/
    mips64el |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/24ad86fdb5c50396ab2404f94de64b60e17bfa35/
      xtensa |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/f0c5dd88a9fce7dd4d886496faeb73c6f84bdafa/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/815fcf744364843f184d401f141af71d5105a91f/
     aarch64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/51f7cbb7848076a5bf51d1710c2cff3bcb807c5a/
         arc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/f23e2cbb3a62b05cae4ff9927dcfaab99f1c7825/
        i686 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/88d6f6ab0effdcb9daa9f05b88538845ceb4ff3d/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/67c2a172047c274845dde14c2b70f63c9a17b7f8/
        i686 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/ec6fa7bb32237b45337f8e6d782d467bf282e4bd/
      xtensa |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/bef88880f32940d25c7056428b8c292e5e90ad78/
      xtensa |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/14ad4f0ea7278d5b57dffe38247d678ff004e5a0/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/5e0ac70c302dfd754daac286827baa29abb4b8c9/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/9b13ea97c9c5ccbd21450d5ad5f6f8bb4bcf8be4/
         arc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/791687de1d050f54d32c24e0dc394b75882c3d86/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/2040d138eb11850539d49d8c55ba5472d7f71d53/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/2e086cea8efdf02f8ca5f7efd7dffc846f7ca51e/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/a011eb9db421884d58c2723b3f38231e69cc65ba/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/0cea688e1c2abe0d5bc31208bda06d1b2520314d/
    mips64el |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/b62f105e0b2ffcc61a73b1357cc85a5d8725407d/
         arc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/5d070ffa269c85528f7ce80634c3952a15f090da/
      xtensa |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/21ec2d5390f2ec8491c422e5e9c2351acc61380c/
    mips64el |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/9c2afe7ab7c6188c21c3b23fa9b94f4aa976473c/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/4fa700bfa934a2dce1b9855faea1e3aedc3cbe57/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/d7f8bd9708c3f7881ea5e792c88c249c6aaab4f3/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/4b8cf1230895852d594e457a0b30fd3d90be8ca9/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/bf55bee553da3cab102048ddffa0f9f89ac2baf9/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/9de7a9908ed85f86eeedb14cd32b0cde60ff035c/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/44c7e91d89e452bb189149106ae4608550997956/
        mips |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/4bdacb5476eb8aa8d211126753d27715a4570fab/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/4bb9a2a92b9f4ca0849508e6e0aa494fd9ae45ca/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/87c66707399be9534dc67a52628c0656eea58f9c/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/aba34ebd7d89e0e371d8a9b11517ac4c2510f1a1/
         arc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/93f1a236a4fd8d905afd410d3ce63b1ad66186fb/
        i686 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/03c914b4dd8b8600de29b08bafff1db994ccb09f/
      xtensa |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/b22d1515d3860c8bb140c54f2d3b0a8bfc286228/
       nios2 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/88aab471dcce5a099972c34cd4467f6e71ac44dc/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/112f64ee8a32fda554f3d6259f720a4b6300f09c/
      xtensa |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/7762c1448b65952e9472163f5da90689cc5a17b3/
     aarch64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/1c0958819c9b295ddf26f1388f079eead4f7afa4/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/179e0a641670a4d722ea5f14c95fbba0c460b30b/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/5069ec4587a9b150c5f56813408b479dece72068/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/843d00d29d6f1c88db3758d50dace610613114a7/
     aarch64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/2208d3e756d3dab59d61f23eb658ee9e769312cc/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/5965cf6d0b09c7f5766c10233bc42a78028becdc/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/358881f5d643792ddfcd8a6abce7258170258623/
        sh4a |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/176dc529bb6d315d7cc915fa9bdeaf0ede167fff/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/950905b4feb2e183670de3d56732c9fa5266e5ba/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/861098998eadfcb3bd4ac9761118af44d0068df1/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/446c4cf61b960c6140ea1a9834140d2765185328/
      xtensa |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/9d9248bd86777e192c0d5058cf9d826eaf760d87/
      mipsel |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/bfa6fc3503441c3d8c26c674aa2b5b953eefee8d/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/23e7e5d89c953828f9892f27464dac965696fd29/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/e533189d90a3f6c37f333dd0a1004747f7791815/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/cc70aaa78e64a0d02cf73eb544f7f9035aec7c7a/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c919993be705db7ea400d3922eaf21b89039a10c/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/ca51d53cdce6b8f74566a984653eee8364b18e3c/
       nios2 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/5acb0f63412fb57845e75ff784f6dc308b310ced/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/3cb949b0a212ddb0c9a5ba31a738f0367efa619e/
      xtensa |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/f359f136fc64b7f01fc2728d57c65e607e0aa0f9/
         arm |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/54e58cfaf7ee83fa2cea5b61599a1ec758973560/
      xtensa |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/142711ca795049f48ca818f2bce3c9e2423187cd/
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/d08dbdef98a791fbb83404311372ee6ad16a1dd2/
      x86_64 |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/922be6b4f72f2ecd87092cc7c441d226e573740f/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/8ce09369ad00af1c6d4dbf3b82c4adca08e692f7/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/b429eba2f23c054cbbe1fe49cbf91cdd0429cb83/
    mips64el |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/554bf71c56350c90cb4e96572b632a4486128f63/
        sh4a |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/90a0c6e99e055ed76e6ae832b000d314cf4c9bf8/
microblazeel |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/b24d0aa6609384a67e6bb471e720cf7a5d34b93d/
         sh4 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/77968fe43bf58c1f64c8fba160fd4749248393a5/
     powerpc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/04a173ec686737d5ae885d484adfa5ded9dd02f3/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/9ef4985d9203599c4fc3fb5b4709afa95e66ddf8/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/017d7f8d1f6329f4d7fe0411cb77c89e8a0c73a8/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/bcccdea05e94e76e1f4c69e127da3a562f1392eb/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/a6a3ed4f0163b4f83462017f0fffbf65dedace66/
     powerpc | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/547117118bdb97f9f756513389233453b0480a1c/
      mipsel | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/dafd69012e66d0fd67d2779bda3aca7ee0a606fd/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/5c974ffb5a9d89779f41cde5dffdc32b798b30da/
         arc |                harfbuzz-0.9.41 | NOK | http://autobuild.buildroot.net/results/31bfb6acf63bbe5f98c91db1d8550247937112f4/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/f3a18244927ec72641d635a3533483ef0662141b/
        i686 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/a83fcbb3b64ef2816229ecb9dee90dab419b783e/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/c366dd3fd00b7df63f3c2f3b60eb39cb2046101d/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/e221861198590af2fa072653ca74e377e83e802e/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/ce18c65cc03c84215b9c97eefd8e970110f55299/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/fc8c41c9738e79e167ebd091348dae37ec1bac08/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/ac38e5153cfee5057bea6bcd49f491d782054124/
      xtensa |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/6b9500089897efb98458e3827672f60c8ff7df4b/
      x86_64 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/d6e7bb4df637e941e95d71f68b930821fa180224/
      x86_64 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/56ef2d6b2aeb95c68f8e08e4ebef85f321df99a3/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/5568af2548f9eeeea9ef691edd7585ccd293d5ab/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/e90c7c587c07fdc386e897a5ad120400939e77e7/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/36e5cd79af35aa0f3d3dd4a745444dc18108dc91/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/875d7e387d859863c73587553c2a6964cb74268f/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/073f0319cc562d3fd8d3bf252734a1187310322f/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/beb813afa2e2d3eb51a5e8ffc9b81493e73bc423/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/02f8135ee8195ec30b3ea95952e086d4f9ef7644/
     powerpc |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/1660e7205bc2b5c5f5ece4576a90798a5bf24945/
         sh4 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/4ac3eca084b897ebc385652d2a1979d9a22354c9/
         arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/8cbbffc760b6e440b21eab3f867a96c5c520ab81/
         arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/5e1458f272913a1c2a1b6430c8511c3b367d9981/
        bfin |                    ntp-4.2.8p3 | NOK | http://autobuild.buildroot.net/results/e845d784de92f859924962588750a0f853790b99/
        bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/fac5d83bddd66f35885c7878443dafa46fa92636/
         arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/94c1538c96168a99ce5132fc5045fca8a95b411e/
         arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/1dcd9d8f12c6402c503d4e637841f6d6d52d890e/
         arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/dc1fbc9147b7ffc01a707ea420d87e19f692462d/
         sh4 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/329146d76bb3f6d7449c4e0ec2799931d5d5efc9/
      mipsel |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/cf4c0572bf65a8fa20e247ff3909b6ec3f57473c/
      x86_64 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/517c56bf798c32e7d815920f271ff79d44214b3c/
    mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/503498949348153351ad3ba62c223ac5b26dae3a/
         arc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/53bc2dd8ef3149bbd2c543af0b5371305abe6629/
       sparc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/39964e11dc64b3bb2c2c8500f3ff07becedb80e3/
        bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/25d8b4079702e16cfde056ef4455e5b4295bca17/
        bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/9edbd1fbb17d2a9694104c07cde758831453d680/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/facc6d9eed4d81d97dfc89f2048aeca3ef54e42a/


-- 
http://autobuild.buildroot.net
