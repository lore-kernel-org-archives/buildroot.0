From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 08:30:33 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-18
Message-ID: <20161019063033.999E3102FF4@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-18
================================

      successes : 118
       failures : 59 
       timeouts : 2  
          TOTAL : 179

Classification of failures by reason
====================================

                    pppd-2.4.7 | 8 
              python-pyqt5-5.7 | 7 
             util-linux-2.28.2 | 7 
              lirc-tools-0.9.4 | 5 
          libmicrohttpd-0.9.50 | 3 
          motion-release-3.4.1 | 3 
                     vlc-2.2.4 | 3 
                     xen-4.7.0 | 3 
                 jack2-v1.9.10 | 2 
make[1]: *** [libavfilter/s... | 2 
                    mpv-0.20.0 | 2 
                   bind-9.11.0 | 1 
                  bustle-0.4.3 | 1 
czmq-5205ec201e97c3a652c17e... | 1 
                    efl-1.18.1 | 1 
                  ffmpeg-3.1.4 | 1 
                  guile-2.0.13 | 1 
kvm-unit-tests-0b04ed061003... | 1 
                    lftp-4.7.3 | 1 
                  libffi-3.2.1 | 1 
                 liburcu-0.8.7 | 1 
                 lvm2-2.02.166 | 1 
                  multicat-2.1 | 1 
                privoxy-3.0.26 | 1 
                    quota-4.01 | 1 
          shared-mime-info-1.7 | 1 
                   strace-4.14 | 1 


Detail of failures
===================

      x86_64 |                    bind-9.11.0 | NOK | http://autobuild.buildroot.net/results/e96a36c4da3c3be4b79a27af75a70bb8955c31a9
         arm |                   bustle-0.4.3 | NOK | http://autobuild.buildroot.net/results/a61063c2e3d2dbe9ae9210e4b013b30dc9d86f7a
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/c3809d695e84e72bf23d5c9e2d798e450d782748
        i686 |                     efl-1.18.1 | NOK | http://autobuild.buildroot.net/results/70a7e021bbf2a4ec080109c0abdf567b436a0671
      mipsel |                   ffmpeg-3.1.4 | NOK | http://autobuild.buildroot.net/results/392508e57dbe0a4ba9f2a772229f04bb42092f36
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/33e16131fce7139fe94663c0c0b05a5af6feb902
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/0b9d19000175a63d02764d5f4a98c5bdf4c6dd15
microblazeel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/8d9c07f867a81c0c7770f78e57eb447c31b062f5
         arm | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/3a7e90f90ff9b8371de8dd3f732a8b347a46b6a1
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/bb35cca83cb88a3f1377e4aa3ce3095efd4ca36b
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/82aecd618a96ef2d9319fda55e03fe9ef2e50427
        m68k |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/9f7b6bcaefd7e0c49c8463604604a94dd732b5f7
         arm |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/e7b7fc1543070a78a83f4ba30100835876b3b644
        m68k |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/8fd4f4214b7b723296780b9af1bc736e31691a2b
         arm |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/9eb182ab2d0b396eeff3d637a040da5a4d5bdcd7
    mips64el |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/f015d52faa214f7786dd3169628ce74b738a8b46
         arm |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/55f1ac19736499ef536561bd65c011d2649f43da
    mips64el |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/c689786b6b0867cea2e45df1c5556cccdd377b33
      mipsel |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/5abbed6ab1367b9a5dfda970fc9eecc7af22f795
         arm |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/1bf336ae7cc8503278ba90a6ea3ed4254ca8de20
        i586 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/4f79d52a62f0c19f07286a0ad8a07cf39e3fee02
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/f4459c8988c36edc39cda281deb9eebbe4ca4689
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/e083f68fc579c92e1582d7b1d79040156711a1d8
        mips |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/7ea76a16fe31f069770710da156fc7ca1243954b
         arc |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/1ead788527824dbada78076d3c89f712727fbe04
         arm |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/8b942070649fc2dcfdc18834d670bd4699e0c8ec
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/fd78e21463411635d33d71a735c6903f8f260846
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/06c4b969e414f7d2318da2c4688192c8fd5829f9
    mips64el |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/a425e4ca8d11533a03e96a6475fe1a1ca3bd15d0
         sh4 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/7d34a8074d5885a2c868ac8b6e7feb5641bf750c
       nios2 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/d6adf48024b6c68ebc0424be7c271e7cdf216f93
      mipsel |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/ff9bb188ac49fe81fe67aaae7677fd0bc58751d5
       nios2 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/194bf3d9c0446a9028fa0abbb1a489632bca381a
      mipsel |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/b3d7cbb8d7981e6027fbe94b23ac3c818630e92d
       nios2 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/32e8fa36b709ee8aa018ff2ff027c03b2b75b96d
    mips64el |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/6621f6a4c8d69bcfc5ec7d703f9716dcf99e4476
      xtensa |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/92335f6baf2dfbc0ee1309b06b816c581a55cef4
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/839705e3a8553d2714771fb7ce9f219dfaf74078
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/3d475ef9225f76441c7966c2000245501d2186a5
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/29f2eed0bdffc5a047ef39cfa510f9477eb8f305
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/a4cf9da61c76687a13f7072746f55c17d2d4457a
      xtensa |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/f886f4a65534a7c1af239acabbc774d614148670
        sh4a |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/723d2a74e8fc47856aa328b7ba7d6258403499c1
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/7eeca0562a779141fdd88d22fd50a1731eeebe8a
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/b908d49dd568dec76c93c43706e4b6747a466151
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/54990551945582bdfce2c8bdf2955d5e22d716d9
         arm |           shared-mime-info-1.7 | NOK | http://autobuild.buildroot.net/results/1d69b8ea34cf57255be54de0c87fc83590fb1337
      x86_64 |                    strace-4.14 | NOK | http://autobuild.buildroot.net/results/8191033b16337281987901ebc1d43a5c3e718b53
      x86_64 |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/4856585a15e82a8635c4a4869da06bc6086883dd
    mips64el |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/00ee269471031a67eea15347feca6b54a8f58333
         arc |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/4a8e082147cb0377a89ffdbbffa2516fbd329d82
        mips |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/5123ae771aa158dfe5902fc09eb36b1f404d0440
         arm |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/93cf0413f949b94cda189dd5d92737b3c50374ac
        mips |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/372ef4263cb6420cd36fc1e5b74684fd3c8f4ea1
        sh4a |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/f822c61c4644454c4ceda1c738311d16471500f8
         sh4 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/8b83f4ab3f58040ba62fa340320ba7b8b998b566
       sparc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/7fb5eb1d2219846c5f3ca31a25e4c0dd3aef3c79
         arm |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/7c05169cbdbf369c554ae7771d604199a3ce6ab2
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/1caf93fcb951dff33b9a80fe38ddde3ba5553382
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/b9c868dc92663d1680dd13ce0117511fd3ea4be6
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/2eab650fa75b82278c2bead67fd505e809a6188b

-- 
http://autobuild.buildroot.net
