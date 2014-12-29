From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Dec 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-28
Message-ID: <20141229073016.9A54E101206@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-28
===============================

        success : 225
       failures : 30 
       timeouts : 4  
          TOTAL : 259

Classification of failures by reason
====================================

                  sispmctl-3.1 | 4 
           libvncserver-0.9.10 | 3 
                gptfdisk-0.8.6 | 3 
                oprofile-1.0.0 | 2 
                  dhcpcd-6.6.7 | 2 
                  thrift-0.9.2 | 2 
  toolchain-external-undefined | 2 
       opentyrian-2.1.20130907 | 2 
               sdl_sound-1.0.3 | 1 
freerdp-440916eae2e07463912... | 1 
                       unknown | 1 
zmqpp-36413487f05b165dfc82a... | 1 
               mpdecimal-2.4.0 | 1 
                      qt-4.8.6 | 1 
                  zeromq-4.0.5 | 1 
                   wvdial-1.61 | 1 
           libmemcached-1.0.18 | 1 
                yaml-cpp-0.5.1 | 1 
                   erlang-17.4 | 1 
                  cppcms-1.0.4 | 1 
                 dmalloc-5.4.3 | 1 
                   libiio-v0.3 | 1 

Detail of failures
===================

         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/23398bc625ad2719f001c1ab0c76713bc2adbf07/
     powerpc |                   dhcpcd-6.6.7 | NOK | http://autobuild.buildroot.net/results/ca32c4de8b645c96cedb80b6270a792e9601ad84/
     powerpc |                   dhcpcd-6.6.7 | NOK | http://autobuild.buildroot.net/results/e97e980a2f1e0ff4138a6dc03d86ad3ff0973e4a/
    mips64el |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/6afd10f435692c72363f065d654d07eb4d74cd37/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/89101289474d51e48f80e353aa4e4449113c083b/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/c1fdc7df0821641a0876da4f3138f6854d9d989a/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/0a74f37517f9944018d343361575479496a9bc6e/
    mips64el |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/f1c1b05223fd62b96b9f2f4d780650c4d2d634b4/
         arm |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/1d3839229c11979210d6a8ad440a66d0587ea546/
        bfin |                    libiio-v0.3 | NOK | http://autobuild.buildroot.net/results/964f98fafdcd7e994ea25cf0993915d81537c31c/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/7a6ca3c1f6b7bae6365fac0ffba9c16542cb9255/
      xtensa |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/e648ed8e7d96d2727c4446d12f5864e5691a4210/
      xtensa |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/e92cf4025b0f573d4a9ade30025954168d8469f6/
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/be20dec9ffe7de3adc46a834852b20353d39baff/
    mips64el |                mpdecimal-2.4.0 | TIM | http://autobuild.buildroot.net/results/d5d13915a57503d0df5fec6d10ae23b04946c120/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/3815ba4ff4d43b53bd5b6195b9d3174e424672b5/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/b4c2a802946e75c6e50da68cef71e5d3cc2b2552/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/e822d62bbf21f8a9ef6cffbf888947fb0d09a861/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/e5e9ed8277dda1dcefbae4b75c673693a85ea422/
      mipsel |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/dd78faeaffe79bb4ed14e8d06ac7033fcb0341c1/
      x86_64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/b9770aabb317d2e123a26b9c642a72759de836f1/
    mips64el |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/1efca09d28f3724abe6973016d654af6c594752e/
         arm |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/21e30bcb6df9b2b6170ecf0dc9d0ed157fd5e018/
        i686 |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/0e993cab4b2923631909ad47eb11ca50e23f6bcd/
microblazeel |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/fcb0cf4bf8e8e739162877a9ba74ce8df8ea4ba6/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/d58de379451a175b9eeda63535c17d6f2034639a/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/ad7bff258854f11a0921a583e2f756f75f512f48/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/5955a3415ecf1c420249ac02b86321221463a43c/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/0c0ff63aef4d92c57d203e32740b48f971870785/
    mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/4b3a5246a02fcfe0971698cc33248e4f62c25556/
     powerpc |                    wvdial-1.61 | TIM | http://autobuild.buildroot.net/results/27189e551008f4fe10bd029b1058e1fd2d70865f/
        sh4a |                 yaml-cpp-0.5.1 | TIM | http://autobuild.buildroot.net/results/94555403981dad96ceab660f681a0ae069becc7b/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/1a85103724ccb7d2b5a4a39dd054b8491d6bc077/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/fefe865edebf4627e92a8bca3ac0b3c8dbac6cd6/


-- 
http://autobuild.buildroot.net
