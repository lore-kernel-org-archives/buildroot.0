From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Feb 2016 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-26
Message-ID: <20160227073018.3AA7E102741@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-26
===============================

        success : 206
       failures : 59 
       timeouts : 3  
          TOTAL : 268

Classification of failures by reason
====================================

                  trinity-v1.6 | 5 
                   erlang-17.5 | 5 
                   qhull-7.2.0 | 3 
             stress-ng-0.04.16 | 2 
                  c-icap-0.3.5 | 2 
                   mplayer-1.2 | 2 
hidapi-d17db57b9d4354752e0a... | 2 
                    cups-2.1.2 | 2 
        ltp-testsuite-20150903 | 2 
                    sox-14.4.2 | 2 
canfestival-7740ac6fdedc23e... | 2 
                  cairo-1.14.4 | 2 
                  boost-1.60.0 | 2 
                    ruby-2.3.0 | 2 
                 libdrm-2.4.66 | 2 
             webkitgtk24-2.4.9 | 1 
       host-erlang-rebar-2.5.1 | 1 
                   jamvm-2.0.0 | 1 
make[1]: *** [libleveldb.so... | 1 
                   redis-3.0.7 | 1 
                   mraa-v0.9.1 | 1 
             bluez5_utils-5.37 | 1 
                 mesa3d-11.1.1 | 1 
                   fio-fio-2.6 | 1 
                sqlite-3100200 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
               libcap-ng-0.7.4 | 1 
                   slang-2.3.0 | 1 
                   tor-0.2.7.6 | 1 
                  gamin-0.1.10 | 1 
          chocolate-doom-2.2.1 | 1 
make[2]: *** [all-recursive... | 1 
sconeserver-c4b8e14f6e9e06c... | 1 
                 rtptools-1.20 | 1 
                      qt-4.8.7 | 1 
                grantlee-0.5.1 | 1 
                  weston-1.8.0 | 1 
                pinentry-0.9.4 | 1 
                       zsh-5.2 | 1 
                moarvm-2016.01 | 1 

Detail of failures
===================

     sparc64 |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/ed5749a7b0510fd01131d7c0c0a4d69997177116/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2938973d1e66e91960b9fabc20cdbd7408729f60/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/97807e266ee15db1e34904eb626a446cd4669393/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/9c7874e6d00642496d40776f02f92297082a3919/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/ac94098b323d6094ec5cca122ef0d7003002f647/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/d412993be916afae1829252b8d6ffd6c706a503a/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/527567dfad18dd07b497d33749392869fe993025/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/28186bfed86045d4ae90da6d1dcb19446eebc30a/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/6e8c9f9a16ecdec026a31b0491ba2d76d48f0d94/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/409deadd4e87da9840a441b9c8baa621d6cbf1da/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/1eba415cc0bb847871384a7f84ffc57d6e54e1d6/
      x86_64 |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/a85a26a3e1cc69a22f59f87e4c38fd8134333d46/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/266f3b78800f533e1b3ca3f4a807ae41221b7fe4/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/4271a0b6fd3c85081fe8ebb5a7912a85d0a0f7ae/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/330a6be2449785eff4a43ce1e5a9b31b719c041b/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/aa67aca38fd84098ea09a6c173676ec9ea6e4b04/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/3b2925a0ba9e515905efcd73c6e0bb42df2390ac/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/25c943c755b4752a0efee7fc992146aafafa940e/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/eb321db6db5d760fb88c8bea98104c5a01f9136a/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/196b1a4ad286a6dabaf17594e57e999700b2634a/
    mips64el | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/bb36f7544be1137d7c03a9b7835ed28689977505/
microblazeel | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/e17711c2bd3a01144692512cb917ea40db4f74c2/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/d3c5ab2493537fd0236dbf868ac0cb63b72a1886/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/209e934fd5646d5343aba63f281720f6c6c67d25/
      x86_64 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/a29e01c45db15d910abb1e4b1a19cbe5875c4d5d/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/26fa8503fbf7318c72d3f2a8183eb1029aa48e04/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/ebe7e319db5ae2fde7d7d4e112b1b6a87f3dfe99/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/9e1bcfe3630c8806d314e99639d03890687dd568/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/203fa5988ec823b2948ebb3d177b24bee6b0de41/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/aaaa570397266bdea6f78146fb05158ddecb76d5/
microblazeel | make[1]: *** [libleveldb.so... | TIM | http://autobuild.buildroot.net/results/c4ce0b213c60a6e5b736c9273fb1d44d9305951a/
microblazeel | make[2]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/238847d64ea6f15246142baa722a13ab00b513a0/
         arc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/b83831eb714fba4d9a816a97912b57a5e598e7bf/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/e5bc1958e2df41a3cd38a5807951c8362a1d5a6e/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/b0fee202fdeb0a532dc9b58e49d67a76b9d7ce23/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/2f058c7a1c2541acda5c8719d723a974a0e56248/
      x86_64 |                    mraa-v0.9.1 | NOK | http://autobuild.buildroot.net/results/748eee6874f64294d10666093edec448f5fe6f57/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/360ca3048f3adbcb91440ce2f47a6acdd810bc6d/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/da6f437bf5f25d3122c26bf746fae997ac704a2f/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/32f324c7920ac46d393954de13b8a98a77a0c392/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/d7ece42d0d059a2e1ebecabbc5348178df413d3b/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1e241ad02526941bea2901df8e1268a2cc9e9770/
       sparc |                    redis-3.0.7 | NOK | http://autobuild.buildroot.net/results/41873692d62abb75d4643bec2e3c54fac7b0395b/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/8390dddff16f9f80b295800a48e9a685870eecf1/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/e255eacc00a876619fffdd0c8a479ec43a6c76fe/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/d89ec4ffc9bed833b44bd31e1325362a6f587bff/
         arm | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/00e425b27bcc4f9875975a6d41fcec435baf2f30/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/80d10224d58feb524afc7dd76d83c7cce3f01cb6/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/a1ba322643b9f8f935f1c59963ebc51f6e4c73d4/
      mipsel |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/d95042f714d62082279271b828496ce4cf33a032/
         arm |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/e448bb3304c0deeb0b070177a1bdc2e217fdb31d/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/91c57b470dd3ff621784cc64fc33b04879332b2b/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/e0e47950a0a24651557d547ee3e8241838bf5d7d/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/aa3514d5a20fb9282d8ed1bbe0abe0a2e45e6758/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/4b65a1b481daa199720f694f746dfc59a44137d6/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/abe6f9805c29c83e91fd225b7d89484dbb05effe/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/16b0335b1e74f4845b84fb15ed055526fe30fc03/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/cf5a41a9b85bcf1ad20d859dd646c4c87d2234a3/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/feda5b7f27517abe30c54aacdceabcc47342ddd8/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/2412cbca085a461131d69eff13f9f55194912459/
        i686 |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/0e1cdd953322086d54572bf5ca547f7ba0562af4/
        i686 |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/ab73ed7a56d07ee8acee3fe95adebe89277774e3/


-- 
http://autobuild.buildroot.net
