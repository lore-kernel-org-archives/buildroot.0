From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 25 May 2017 13:29:53 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-05-23
In-Reply-To: <20170524063115.3596E20835@mail.free-electrons.com>
References: <20170524063115.3596E20835@mail.free-electrons.com>
Message-ID: <CANQCQpa+ekxMumg=Pjh10=ijAuTmVy8fsGFESsEUzCZaahf28Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, May 24, 2017 at 1:31 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Build statistics for 2017-05-23
> ================================
>
>       successes : 270
>        failures : 10
>        timeouts : 4
>           TOTAL : 284
>
> Classification of failures by reason
> ====================================
>
>                   ffmpeg-3.3.1 | 3
>        host-erlang-rebar-2.6.4 | 1
>                   libcec-4.0.2 | 1
> libsvgtiny-ea9d99fc8b231c22... | 1
> make[1]: *** wait: No child... | 1
>  make[2]: *** [all] Terminated | 1

For these two and the host-erlang, I've restarted my server to see if
that helps.  The failure timelines over the course of the last few
years are very hit and miss.  Wondering if it's a uptime issue of the
environment......

>                     mpd-0.20.6 | 1
>                  mplayer-1.3.0 | 1
>                      php-7.1.5 | 1
>                  qt5base-5.8.0 | 1
>                    taskd-1.1.0 | 1
>                      xen-4.8.1 | 1
>
>
> Detail of failures
> ===================
>
>          arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/94f725b25e27ca56a58a632c371fdf176cf15c79 |
>         m68k |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/91c1dbc4648803ae4dab9053a4615fae6ad8b8be |
>          arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/8926d319d6d1cd1ee72239ad7d9ca869d2355628 |
>      aarch64 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/3f2c265fa35074bf893afb69ff3301334cf55745 |
>       x86_64 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/7165e5dc3e5f3aa3d5f36b335ae2411d526acaf9 |
>          sh4 | libsvgtiny-ea9d99fc8b231c22... | TIM | http://autobuild.buildroot.net/results/18e0ddfe06d6ccb62c7f50368a4b433bbf7f7fc3 |
>       mipsel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/22dcaadc1415eff2ae189a13ca65a40599de5481 |
>       x86_64 |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/32b929966e8843ec4947cea0941f14d977742467 |
>         i686 |                     mpd-0.20.6 | NOK | http://autobuild.buildroot.net/results/ced22540ce3ea739f1dd8dc6701d8b87ddb3f295 |
>       xtensa |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/3f40fbb5589530221850ede794f50184f11627d2 |
>          arm |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/a6ce47b57c882f3fe30f15983f79a6cb9024c43b | ORPH
>        sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/6f509497427846f9539da7a1e63a7e67c398b306 |
>       x86_64 |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/c2dd5c1c9dc87d2943c15e58ee56e67d7375368c |
>          arm |                      xen-4.8.1 | NOK | http://autobuild.buildroot.net/results/552e66d764885341b2fe208a0e4382b5fe05ea9d |
>
> --
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
