From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Oct 2016 08:30:46 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-22
Message-ID: <20161023063046.84EEA103F77@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-22
================================

      successes : 211
       failures : 68 
       timeouts : 2  
          TOTAL : 281

Classification of failures by reason
====================================

              python-pyqt5-5.7 | 10
                    mpv-0.20.0 | 6 
               libbluray-0.9.3 | 4 
          libmicrohttpd-0.9.50 | 3 
                    mpfr-3.1.5 | 3 
             berkeleydb-5.3.28 | 2 
czmq-5205ec201e97c3a652c17e... | 2 
                    lftp-4.7.3 | 2 
                  libffi-3.2.1 | 2 
                 libnss-3.27.1 | 2 
make[1]: *** wait: No child... | 2 
net-tools-3f170bff115303e92... | 2 
          sane-backends-1.0.25 | 2 
                   dvblast-3.0 | 1 
                 jack2-v1.9.10 | 1 
                   jamvm-2.0.0 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
kvm-unit-tests-0b04ed061003... | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
              libarchive-3.2.1 | 1 
libasplib-f7219142e790a329b... | 1 
make[1]: *** Waiting for un... | 1 
make[1]: *** [libavfilter/a... | 1 
                 mesa3d-12.0.3 | 1 
                   mpd-0.19.19 | 1 
                  mysql-5.1.73 | 1 
                 opencv3-3.1.0 | 1 
                p11-kit-0.23.2 | 1 
                pinentry-0.9.4 | 1 
       poco-poco-1.7.2-release | 1 
               polarssl-1.2.19 | 1 
                privoxy-3.0.26 | 1 
python-libconfig-b271c3d9da... | 1 
                 qt5base-5.6.2 | 1 
qt5webkit-b35917bcb44d7f200... | 1 
             tinymembench-v0.3 | 1 
             transmission-2.92 | 1 
                 uclibc-1.0.18 | 1 
                 weston-1.12.0 | 1 
x264-3b70645597bea052d23980... | 1 
zlog-6ddb9bbf3ff0123e701bf6... | 1 


Detail of failures
===================

      xtensa |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/6753309f4f113a32a904a4a52cdc0f772873f5b6
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/c4c7090453a341c3706124ae4b83a2732f1a5ab5
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/bc01986a22535e00b64bff1da0fbece20b13f843
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/a4a873772bfde8fd9cd6fdef025ae1cd00c8ba37
      xtensa |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/29ad877562d27896e3d68c06b8c1e3970750b51a
        m68k |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/078c0ede1de2bbfdd24c9381d2edba3add2894fd
        i686 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/cb54c7c528dd150bc51b364150066392007c7225
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/ff2ed7ea60083e7567bdf49efb285cc4f5b0e1b2
      x86_64 | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/0e3480bc17152f17e9cc56cb2707a93a590b3b15
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/595baa9a36186ea321a904ceb042ded8315c444a
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/faeb0a2b942dea8f56abd3eaee31b87ffee24d9f
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/346fa3eb07d12d0e641aa4ff0f4f3ed753ff8e6f
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/e2fe11ee092059b8a789f9d60c94b55017cad045
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/4ab7ba1c5814607ddf9ea34e424576fa024f2c50
        m68k |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/cc9b87c4c695f97a056cc53f19e7662750dffeff
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/941c06e29f6542e258f20799dc6f3f94b2f8af88
        bfin |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/fbf63bbe0974b490b875a95fb930ba601364b85a
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/da755e061141d5bea311234a34f0ba127f11c96f
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/428ad7f3c019ae8c7f1f7194ef33bc93e39333c6
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/fefc2eb13d52a26afc65980d482006a0b48c840a
        m68k |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/f7f5ca25ada7314269d649bd0d8cc676ab3d621d
        bfin |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/d195f379591dc9570a9b971db04bec8e787cdfeb
        bfin |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/4809bd30d260193442fd55770ed1f14f808b2fd2
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/d046311d48feb0ecc5a1ae63fed5d13058e2aaab
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/bbf398143b75da21ca8cab4e8b8327b6bcc80607
      x86_64 | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/a6cea201bfa0fefc57c794745bb7121ff41d1754
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/4c069c950d1c914772f875de57b974a5bbdd9969
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/91a080fe35c2aaafeab371cf3137e3923ccd44fe
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/d87015d7edf2934176eda9a6855a79d5cd2d05c0
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/489dc486520a70e436c36caf4082d156f5f05ff2
         arc |                    mpd-0.19.19 | NOK | http://autobuild.buildroot.net/results/3a43379c81049cbec674320bb4c446e4dadc3de4
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/f9547b1416e2edf1c37262e8eda4cd544cda9154
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/379b467f7fd2c97a58fc760e1b7ab9f25b96db32
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/7c70254fc1948f7685dd2312dc3778bfa1694ecc
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/020f57fae4fa47e2ff6d8a240c019b81039c7c87
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/dd3e60bac666a2733c4d991eb77174ffebbd9042
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/bd5969beae2ed7a6afc516570a34c4bf292514d2
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/33b7b3a8c1d889f44c4e8928f52915293bfc0aa1
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/68555de54d3fb848e399fe08cd9640d27d13d932
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/fb83326d664f662dc8dd0d8f90472c2236cf3769
      xtensa |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/ba2ddac557798082e740d1a6c5f5aad318f87646
        m68k | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/0b5498b5cbf6cf3736790a1f6e9f12eebed401ba
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/82b759ba1bfebe942f7baa5f0e6420a5414f8f27
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/49cdbed9284d2d6c736ba71343dbcb7cd215eea5
microblazeel |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/34df000fe9b5dfc2530be20ca68ed3d7af8c19ba
     powerpc |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/ef689e1b7857ad927248fb8f6a3fa51afe56085e
    mips64el |        poco-poco-1.7.2-release | NOK | http://autobuild.buildroot.net/results/1ed07e545a568715e24394a4423256696af45845
         arc |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/4fc6990b9a6c74bed169571d832e439d55f7eecf
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/90f2d86ccffba93e1900fc3f8fccd9426511559b
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/8cadb5cf063e3f97c77bf66a637377a6c5240373
         sh4 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/86aeb114a36a3236d99e271c4c3f40b837632676
      x86_64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/35b70024a1de9d7fb909a1f989b091f2a1a828e5
     sparc64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/19a7a473f416d4f075c7b143efbdeb74f7961ddb
     sparc64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/db9578e6ed9ec14fec573f5144d8ca097629bd36
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/d370716d300dfc38d87e5fd2208f82442e68a16c
       sparc |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/a81da5d20e40a6a336a794279095db3d338f7be7
      x86_64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/9c1b17d5e4e24de9d0770d4923eb91b4d2a2e7ce
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/53d184e8735b91e9c475a88015dfd89f645d013d
      mipsel |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/ea73f95d1ff1c7636bd69bfb22658df92512333c
        i686 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/e67d6f834149d4e358cbbf8659ab6c38d740f04f
       nios2 |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/5dc8dd48de7fdc28cdfdd66cade9a887da2d42fe
      mipsel | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/cf35a3ff7349ed779ff7df93d15ebe5f683fa65e
        i586 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/015b8cbd1b9bc37dede825ffb145d19fc37edced
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/fb4f8ce88680262ccd90134349478cfbe3b16f77
         arm |              tinymembench-v0.3 | NOK | http://autobuild.buildroot.net/results/3841e0c0faf0fca5bbe78d8aaa822a9eb47edc9f
microblazeel |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/d454b01843ec9a6c58152edce9c1897d42623b32
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/ad1dc51c415c5fc3d500e1c87c61de22d8283806
         arm |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/4a216d0d0587e90f84a883f8012854148b5e0db8
        bfin | x264-3b70645597bea052d23980... | NOK | http://autobuild.buildroot.net/results/920967068cf3b75c4ec6c78d63f3129808f2d9d1
        bfin | zlog-6ddb9bbf3ff0123e701bf6... | NOK | http://autobuild.buildroot.net/results/a1fc08418f4d46918e2cfdaae2e3eb3f11e1477a

-- 
http://autobuild.buildroot.net
