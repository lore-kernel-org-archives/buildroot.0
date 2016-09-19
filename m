From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 19 Sep 2016 11:48:19 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-09-18
In-Reply-To: <CAGm1_kv+dJGG1z9Uj=-njXzJfVKyGWs-wRG_UwQ2tgy27jW9sg@mail.gmail.com>
References: <20160919063029.C1AD5103A10@stock.ovh.net>
 <CAGm1_kv+dJGG1z9Uj=-njXzJfVKyGWs-wRG_UwQ2tgy27jW9sg@mail.gmail.com>
Message-ID: <CAGm1_ksU7-Hk697crn=J0zACDUSoHO0CBJ6JWCAOra8_MatzMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 19, 2016 at 8:45 AM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Mon, Sep 19, 2016 at 8:30 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> Build statistics for 2016-09-18
>> ================================
>>
>>       successes : 231
>>        failures : 69
>>        timeouts : 4
>>           TOTAL : 304
>>
>> Classification of failures by reason
>> ====================================
>>
>>              util-linux-2.28.2 | 8
>>                      xen-4.7.0 | 7
>>                     mpv-0.20.0 | 6
>>                 coreutils-8.25 | 3
>>               e2fsprogs-1.43.3 | 3
>> filemq-e59951489045825d6fc5... | 2
>>                   fio-fio-2.13 | 2
>>                     lftp-4.7.3 | 2
>>                 libxslt-1.1.29 | 2
>>                  lvm2-2.02.165 | 2
>> make[1]: *** [libavfilter/s... | 2
>>                     mpfr-3.1.4 | 2
>>            python-daemon-2.1.1 | 2
>>           sane-backends-1.0.25 | 2
>>                wvstreams-4.6.1 | 2
>> zyre-1d949e4bf79b694ea883c3... | 2
>>                     cups-2.1.4 | 1
>>                    fwup-v0.8.2 | 1
>>              fxload-2008_10_13 | 1
>>                   hwloc-1.10.1 | 1
>>                  jack2-v1.9.10 | 1
>>               libarchive-3.2.1 | 1
>> make[2]: *** Waiting for un... | 1
>> make[2]: *** [libavfilter/a... | 1
>>                  mesa3d-12.0.3 | 1
>>                  mplayer-1.3.0 | 1
>>                  opencv-2.4.13 | 1
>>                  opencv3-3.1.0 | 1
>>                 oprofile-1.1.0 | 1
>>                    perl-5.22.2 | 1
>>                   prboom-2.5.0 | 1
>>            python-psutil-4.3.0 | 1
>>                     qemu-2.7.0 | 1
>>                     quota-4.01 | 1
>>              rabbitmq-c-v0.8.0 | 1
>>                      rpm-5.2.0 | 1
>>                   squid-3.5.21 | 1
>>                tcpreplay-4.1.1 | 1
>>                   trinity-v1.6 | 1
>>                 xfsprogs-4.7.0 | 1
>>
>>
>> Detail of failures
>> ===================
>>
>>          arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/5d65900617fb00e14fc7c6c4f192a0841263caa0
>>          arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/0c7d5665982d749048c904b0dce83ace08d8f5cf
>>          arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/fea3f51cb9b5991fcc6f2cceddff7006be7840ed
>>         i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/bc71b35641542b11074cf831c0ce9380de737ad8
>>         sh4a |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/5485384798193c83b43513f7d77d7ed01622ff25
>>         sh4a |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/b6bfc8c197934e271350eacd5eabab86e775e905
>>         i686 |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/5d6ebd615be724d3cbf316f1f9301541fb0c3984
>>         m68k | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/a28b42d51fb040dbd3b9f7682c7ed25c43e99d57
>>      powerpc | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/ad80b833cbf6aee80bdde0bcb029dc4d6562ad28
>>          arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/9544738fb39aaf47f2c47e12fae940fb792ee103
>>          arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/c4d04517e1abfdadc47dc98222c4f7fdfbbd30db
>>          arm |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/d70498adda1547ad36da3642a7e11e1c497d23d3
>> microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/aa3535da7e7b97fd918dbf35c978aad50683c10f
>>          arm |                   hwloc-1.10.1 | NOK | http://autobuild.buildroot.net/results/de5faab2fadd67cdd0bbf8eb62ee4c21f8a4d99b
>>          arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/44630c8248262198d8dd717f1345dcb41828d9fe
>>          arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/4732cdd04ab78c9822b6f4620318ba0b207e1aaf
>>          arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/0921af03ce6e54708d3f9e5e3818b20b79a0fc0e
>>         bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/323fdaac70b8862d80ffad515c4813bb4ab608fc
>>         bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/16ac477d06bdf032afd8a7e151f7b31b31bfbf97
>>         bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/fbd294a4dadf2d3b11fb44967cd90903b32d1811
>>       x86_64 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/35c46dafb9463cf0a4f5bc558257b17311b24e05
>>       x86_64 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/f3cf36e2d44e5a098b176be5ce473dc6e5e8b2e7
>> microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/cbb75bcde0bc253041c9f05c7160e21de0ebcf30
>> microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/1d78c6ad962f21ad252d9ee69de109820614c8c5
>> microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/723c6cd1988644c68363967e2cf83156a8818385
>> microblazeel | make[2]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/56cbc40bb8897eba01129892ba02ba5f85177f79
>>          arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/1ed6f30e2d0947f59c35334fef0ee62df362b946
>>          arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/a4855cbaa6abdd70248bb3614c341e3fa4d73612
>>          arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/13c2937766d42887afbedc994e29c6110a7189d4
>>         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/10f43b0afe441eb41cb30fa310a903c8a7b576c9
>>          arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/1fd666ec251a60a8a7ed26375a8204a960389231
>>      powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/bb8870e2d105a1fd055291a4a78d18fd9d9b48e0
>>          arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/ef9ee38e11bd41d899dc750110a6d976f79841da
>>      powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/8391cccd2699267e120c2ceb7b24f59119d663cd
>>          arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/c3074e56f50e8dc3572e86f5268a5a18889f177f
>>         sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/f4246e2301dd9136584b3e1592c4e42a713fcfad
>>         i586 |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/14d6f3951db0856ef8422d4b15c1d9ea6a968df5
>>       xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/61fb3adf47dd0d6a21c177b4f42ecc08c0418ba3
>>          arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/3b69f0674270c62d82024aaf5d1aad2ac727189d
>>       mipsel |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/2bd97a0cdaaed59ee3e94935a48578e307d9cc30
>>          arm |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/2bcee635166faddc8d7ef685a2259f0341c1b1ce
>>          arc |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/ef9bcbd28ef22c14e82ab71156b1b4c205d4491e
>>       xtensa |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/8a4687941d7bdd57154cc3fcbe316ebc8262d151
>
> Looks as we need a host python-docutils package or setup.py must be
> patched to provide synopsis and long_description without docutils.

Actually we need both host and target variants. Because some Python
programs like circus will check the dependencies at run-time and fail,
if docutils is not installed on the target.

Danomi could you provide such a patch?

Yegor
