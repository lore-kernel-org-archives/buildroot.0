From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Oct 2018 08:00:25 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-30
Message-ID: <20181031070025.BCA5220736@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-30
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   2 |   0 |  18 |
   2018.08.x |  15 |   2 |   0 |  17 |
      master | 181 |  24 |   0 | 205 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

  host-xproto_inputproto-2.3.2 | 1 
       xproto_inputproto-2.3.2 | 1 


Detail of failures
------------------

      xtensa |   host-xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/02043c1698769ccb6ba8d6b183c4597415199117 |     
       nios2 |        xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/e17344ad64b9aef10a6880542d10391d390d8f10 |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                   dante-1.4.1 | 1 
                  giflib-5.1.4 | 1 


Detail of failures
------------------

    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/e0a4005ddd07a232352c294bb30371903c79e217 |     
microblazeel |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/b8f03beb6d80e28de9903d69bfcb6b763be68201 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  libffi-3.2.1 | 5 
                   luvi-v2.7.6 | 2 
               openswan-2.6.50 | 2 
               postgresql-11.0 | 2 
               boa-0.94.14rc21 | 1 
                   dante-1.4.1 | 1 
     docker-engine-v17.05.0-ce | 1 
                flannel-v0.5.5 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
             libid3tag-0.15.1b | 1 
        ltp-testsuite-20180926 | 1 
                   mpd-0.20.21 | 1 
                qt5base-5.11.2 | 1 
             qt5location-5.6.3 | 1 
          synergy-v2.0.12-beta | 1 
              traceroute-2.1.0 | 1 
              webkitgtk-2.22.2 | 1 


Detail of failures
------------------

         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/d7d50075c84e5fd7bb6b953b81ef95b2d4753b11 | ORPH
     sparc64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/ce4751dfa3072bafeebb9732e1f236a97acc5acb |     
         arm |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/522497f9f4a797aeca5c64322580c45c612abe83 |     
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/9e3694a64e92661d23538c4426d0ac9aa45e964f |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/f1547188d7041d1fe57ffd38f354cef490a9c66e |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4a136b3e7fb31c78ecec6a2cfd1747f8a463163d |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/7c67756ce6f5c594c87bdf82d23533ad20b8d7e7 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/3edf66362ea5a83291f19373e4b6f2e5cce98d7b |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e33d37256813330d6b577ef6ca9cbb4d353d0add |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/cf664070c701bb4e04972c6dc4454f168ebf8c4e |     
         arm |              libid3tag-0.15.1b | NOK | http://autobuild.buildroot.net/results/02406e6b4a9771d0131d16a47cd99e5f5a256cb8 | ORPH
     aarch64 |         ltp-testsuite-20180926 | NOK | http://autobuild.buildroot.net/results/fa244b96522c8fc77618c40d2d40976bcaa3d691 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/4a9796e1724280e0f866ec5c1c0ebb98039db1ab |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/4b60055573f9970534f5efd59eccea5cd0f2a2ff |     
      x86_64 |                    mpd-0.20.21 | NOK | http://autobuild.buildroot.net/results/dcc0a0bb68abda1b22687fcf43e909b380613ed5 |     
     aarch64 |                openswan-2.6.50 | NOK | http://autobuild.buildroot.net/results/0d85e407d93faf385da52cfc9af643139717dfe6 | ORPH
    mips64el |                openswan-2.6.50 | NOK | http://autobuild.buildroot.net/results/37dd174d5639c8f1a95041b91fe48840c0635be7 | ORPH
microblazeel |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/f403395e1034fd52568df6b5f3cac9d6c251e2dc |     
microblazeel |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/6f9a54dcbcd6b9001581539333f38f6f87333031 |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/29989cd7c7e83afff65d2291d81ffc4a8f436103 |     
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/af8a747eaf386e0836b34507d7380227208bb523 |     
     powerpc |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/0129d785477aa77678a6a64e2898b7a1ea70d553 |     
         arc |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/7cc0b5e59ddb861e08b2b21ff5bc09213e9d58fd |     
      mipsel |               webkitgtk-2.22.2 | NOK | http://autobuild.buildroot.net/results/39eae49f4acd54edd3691bc2ee7bf3ee9914b3d8 |     


-- 
http://autobuild.buildroot.net
