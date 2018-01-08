From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 8 Jan 2018 01:55:54 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-01-06
In-Reply-To: <20180107070006.3886D207B4@mail.free-electrons.com>
References: <20180107070006.3886D207B4@mail.free-electrons.com>
Message-ID: <CAMRc=MeF+VTsFC-O8M3wdbwLf-No5NALimddaVyN3=w=M2TR7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-01-07 8:00 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> Build statistics for 2018-01-06
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>       master | 189 |  42 |   4 | 235 |
>    2017.11.x |  24 |   0 |   0 |  24 |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>              libzip-legal-info | 16

Hi Baruch,

I believe this has something to do with the recent bump to 1.4.0 you
submitted. Could you take a look? I'm travelling this week and don't
have the bandwidth.

Thanks,
Bartosz

> package/libzip/libzip.mk:23... | 3
>                tcf-agent-1.6.0 | 3
>               host-erlang-20.0 | 2
>                  libdrm-2.4.89 | 2
>              libostree-2017.15 | 2
>                     php-7.1.12 | 2
>                        unknown | 2
>                      daq-2.0.6 | 1
>             ecryptfs-utils-111 | 1
>     ext/date/lib/parse_date.lo | 1
>                    gconf-3.2.6 | 1
>                      gpsd-3.16 | 1
>            host-mono-5.4.0.201 | 1
> kvm-unit-tests-kvm-unit-tes... | 1
>               lynx-2.8.9dev.16 | 1
>                  mesa3d-17.3.1 | 1
> package/python-xlib/python-... | 1
>                      pound-2.7 | 1
>         python-xlib-legal-info | 1
>              qt5location-5.9.3 | 1
>            udpxy-1.0.23-9-prod | 1
>
>
> Detail of failures
> ------------------
>
>         mips |                      daq-2.0.6 | NOK | http://autobuild.buildroot.net/results/08d0202faa4e42f1bdeef117a4ef9470d521315c |
>          arm |             ecryptfs-utils-111 | NOK | http://autobuild.buildroot.net/results/a416a579c12b04c885fb89c5e5bc7e7e469b990d |
>      powerpc |     ext/date/lib/parse_date.lo | TIM | http://autobuild.buildroot.net/results/9e205bc632c05adbb887817f8a7e0ef12e7ea9ca |
>          arc |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/b4566fec1eec76d5af3a3a21ee9489bb1bb2c865 |
>          arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/a80224ae1ac17c01d6e1d84ec672b289fc2ca50c | ORPH
>          arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/9dcb464ce100c51094795e41dbfa41214e8b80d5 |
>       x86_64 |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/06b422ebcefc565420721a1edf9e62a0e4343fb0 |
>          arm |            host-mono-5.4.0.201 | TIM | http://autobuild.buildroot.net/results/806998aa88f2575efc0b6320f6949b2e11de5291 |
>       x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/a40f3ba3f5b76dccce60e24cb082334b04d41d09 |
>        sparc |                  libdrm-2.4.89 | NOK | http://autobuild.buildroot.net/results/deb77de40ec476c431d877ddc42ec4bc513cfea4 |
>         m68k |                  libdrm-2.4.89 | NOK | http://autobuild.buildroot.net/results/a5c974406621036c319ff317e43b3a43b0245563 |
>          arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/103575ebeec2ccc25ad3e97a10726fb28cd659a3 |
>         mips |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/4e33c02ac1b78a5d6c6985aed98c9e6db168fb6e |
>      sparc64 |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/757bb3fab2e04df2e6cf16fa05eb2aebd9fa5481 |
>     mips64el |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/91ec8cc4f6b8f1968eaac1c397afcecd79cf3a73 |
>    powerpc64 |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/1c5f7791e3457e7df31653fda48bc6da209d619f |
>          arm |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/60fbb39eb505313dfdd7e9dc9b79a0f2b005b06e |
>     mips64el |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/5a9f4e7a7e8f5ac0c9cc61f17a5153a5d1e98042 |
>         or1k |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/af18b1616d3032eb043a86850b470c305d6c10b6 |
>       xtensa |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/2031d97b5e17dbbb1d622b6d958e72a9f8de9f4c |
>        sparc |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/f6a69b6e37d8911a293b42ef5e7e1bddc7b22430 |
>      sparc64 |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/f8ec0ab6bbf54bbf0a8e865a3f85ee4a01ffb023 |
>          arc |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/c85c6a8870115423feeb1459e7af2be9a49ac5a1 |
>         i686 |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/629b84a48d6ee38eb0616c41c3537ab618d216cd |
>       mipsel |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/2ef77ef85aff689b419731b5773b60bb017d60ed |
>          arm |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/8d5a578037512df05c160372754e4160bb7502f4 |
>        nios2 |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/f417a2171cadcb41992f7ce89e0610b9c081db04 |
>          arm |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/a64ddf630aa44c7b0353f5a6818beffd20712615 |
>          arm |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/4395637bb6e6557b593c9356c443783f075d4e53 |
>          arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/656ff8e5bebaf6e60060f16858f1273fac3e4fdc |
>      powerpc |                  mesa3d-17.3.1 | NOK | http://autobuild.buildroot.net/results/423629d1a4462aa2919a0d37a01ae37a94889bfa |
>        nios2 | package/libzip/libzip.mk:23... | NOK | http://autobuild.buildroot.net/results/c519b01cf2b08964679a9ccf45cf2fb8ab5cfa0c |
>          arm | package/libzip/libzip.mk:23... | NOK | http://autobuild.buildroot.net/results/d68bd46c87a90859c3759e577e3c30a04f4f7e3a |
>     mips64el | package/libzip/libzip.mk:23... | NOK | http://autobuild.buildroot.net/results/552dae7efd86b9a8b5f301cbc17d460d1a2a3408 |
>      powerpc | package/python-xlib/python-... | NOK | http://autobuild.buildroot.net/results/773444d7bd1f7802920ce9ef9794c6e7c32ae61f |
>          arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/9c7e0e458cb340d3c5dd6e1362ea11d8a78065a5 | ORPH
>          arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/89b7469d743b84435bbad7488a25f98cfad211b6 | ORPH
>         mips |                      pound-2.7 | NOK | http://autobuild.buildroot.net/results/5be1082dee8387b1140d802ac3c788896a4bf980 |
>       mipsel |         python-xlib-legal-info | NOK | http://autobuild.buildroot.net/results/7627e9da786852d6b08e2fc6092a5ce3ba2f4ea0 |
>       x86_64 |              qt5location-5.9.3 | NOK | http://autobuild.buildroot.net/results/6626e25c519216cc5f59da1377414b464f5ececf |
> microblazeel |                tcf-agent-1.6.0 | NOK | http://autobuild.buildroot.net/results/176c8576a244ecfa90d17f8e8d536cf6f93e60e3 |
> microblazeel |                tcf-agent-1.6.0 | NOK | http://autobuild.buildroot.net/results/72554c9c70c1a068e4ed6612e65ea294e678bb0c |
> microblazeel |                tcf-agent-1.6.0 | NOK | http://autobuild.buildroot.net/results/98154ab5f11ecd626975ec887d781291467d200b |
>       x86_64 |            udpxy-1.0.23-9-prod | NOK | http://autobuild.buildroot.net/results/e35277431ed461b8e2800f8825e5fcaafef6b5c1 |
>          arm |                        unknown | TIM | http://autobuild.buildroot.net/results/3f8275ca37bb5c1eabefff19ed28781f9f5c1164 |
>          arm |                        unknown | TIM | http://autobuild.buildroot.net/results/ca70ce7cdbdb834bf448bcb168de9d5bba9f9178 |
>
>
> --
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
