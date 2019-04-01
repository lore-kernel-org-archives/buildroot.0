From: Vadym Kochan <vadim4j@gmail.com>
Date: Mon, 1 Apr 2019 13:49:23 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-03-31
In-Reply-To: <20190401060047.F38C78756C@hemlock.osuosl.org>
References: <20190401060047.F38C78756C@hemlock.osuosl.org>
Message-ID: <20190401104923.GA11724@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On Mon, Apr 01, 2019 at 06:00:41AM -0000, Thomas Petazzoni wrote:
> Hello,
> 
> Build statistics for 2019-03-31
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>    2019.02.x |  48 |   3 |   0 |  51 |
>       master | 211 | 318 |   2 | 531 |
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
>             host-python-2.7.15 | 87
>       host-gettext-tiny-v0.3.1 | 54
>             host-python3-3.7.2 | 45
>   host-gettext-tiny-legal-info | 42
>              alljoyn-16.04.00a | 18
>          alljoyn-tcl-16.04.00a | 10
>             host-vim-v8.1.0133 | 9 
>                   rygel-0.36.2 | 8 
>        gettext-tiny-legal-info | 4 
>                   linuxptp-2.0 | 4 
>                   ffmpeg-4.1.2 | 3 
>                 host-go-1.12.1 | 3 
> lua-gd-e60b13b7977bb3424d70... | 3 
>                    netsurf-3.8 | 3 
>                wireshark-2.6.7 | 3 
>       host-uboot-tools-2019.01 | 2 
> package/gettext-tiny/gettex... | 2 
> package/gettext-tiny/gettex... | 2 
>            uboot-tools-2019.01 | 2 
>                 benejson-0.9.7 | 1 
>                 chocolate-doom | 1 
>                 cutelyst-2.7.0 | 1 
>              dbus-python-1.2.8 | 1 
>                      gdb-8.1.1 | 1 
>            host-nodejs-10.15.3 | 1 
>                   libssh-0.8.7 | 1 
>                    mimic-1.1.0 | 1 
>              netsniff-ng-0.6.5 | 1 
>                      ngircd-25 | 1 
>                     ofono-1.28 | 1 
>              openjdk-jdk-12+33 | 1 
>                     postgresql | 1 
>                 qt5base-5.12.2 | 1 
>               webkitgtk-2.22.6 | 1 
>           wpebackend-fdo-1.0.1 | 1 
> 
> 
> Detail of failures
> ------------------
> 
>       x86_64 |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/11735637db730a323d9648b80bf50a7a55a4a7c0 |     
>          arm |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/e2f3fe7b16c5c863f1dfa984b8cc00506b359c2b |     
>  powerpc64le |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/c5f302fd9a4d0a8a9c20df1b6e435d84469a863f |     
>      riscv32 |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/b45f9fb69615b80758adeff4571e170c3bd9356b |     
>          arm |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/b5ab0b3db45853e7c2409a4c9c56003c957117d6 |     
>       xtensa |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/14c0c884f1c0f11055ca3843951572a7293455cd |     
>          arm |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/fa808881ad5d21f7294336f716edb7c02fda7e72 |     
>      powerpc |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/aaddafd7e39b1e8075292f3bfc27d24c0640f705 |     
>    powerpc64 |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/955c0e914e4dc01d6360b0ac174c7ee1c13b33c8 |     
>       xtensa |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/f7aed08c098ba0b465a47ad8e758514f424eb03f |     
>         mips |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/8c3b83a44ad847ae5edbb902db1f1f50d23efa1d |     
>          arm |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/569a013f22df5533ac8c57b49818f70639df38df |     
>       mipsel |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/8bc36eafe249186c6418fce3ac76ffd2e7c7ce00 |     
>       xtensa |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/d689af21a35ade28f2d8d883b1c861a2c03ab330 |     
>         mips |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/b7173d0a86feca96d07a62b4a52b6b06b43f41a6 |     
>         i686 |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/c356a6b4f911c97a419d5c018d5da3f1589d1520 |     
>         m68k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/4dd0a13d863c4dc740248586860c8bcd45227e39 |     
>       x86_64 |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/1fc748fd203abb94a79117632871b2d47b4b3837 |     
>         or1k |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/13144a7ebd64ef7889312053f06a14047eea232d |     
>        nios2 |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/e9b162183a293e6e304530d0e85282773bb03349 |     
>   aarch64_be |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/6f25529f4941c92fd87e424485cc8f5c017e65a2 |     
>     mips64el |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/05a7f4846955df096bcd57856e62c6cdffd5f805 |     
>       x86_64 |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/a552317f5184ee4c45860922e5fbfdd89d3ef3c3 |     
>     mips64el |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/064d8e03941219e571b5b13dfb54d21d075b2a92 |     
>         or1k |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/932767c81062e73cf356b08e8a5287aacbe8d4fe |     
>      riscv32 |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/4406da28621bfca123099e07d8a95d83e1c778b4 |     
>       xtensa |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/1338114a3c594648062badd1a255f6585f02978f |     
>     mips64el |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/129d45c4422158d375b5250aa866145d4fd42fff |     

It looks like the problem happens because these builds has only python3
and scons fails when runs SConstruct file which looks like python2
script (at least by using print '') ?

Regards,
Vadim Kochan
