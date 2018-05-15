From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 15 May 2018 07:50:17 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-05-14
In-Reply-To: <20180515060017.B486F208A6@mail.bootlin.com>
References: <20180515060017.B486F208A6@mail.bootlin.com>
Message-ID: <CANQCQpZLNLi7ousx0vJPL1vU4Q-2seisCws1ExO51gpaviMuLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, May 15, 2018 at 1:00 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> Build statistics for 2018-05-14
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  24 |   0 |   0 |  24 |
>       master | 261 |   4 |   1 | 266 |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>                     efl-1.20.7 | 1
>                   flare-engine | 1
>                      php-7.2.5 | 1
>                 qt5base-5.10.1 | 1
>            uboot-tools-2018.03 | 1
>
>
> Detail of failures
> ------------------
>
>       x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/115fa4552d0bbac159baa9c6bfe127a5c241f3a3 |
> microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/d93d51270e100bc01ca652f7bf2d4cbb0c9d9601 |
>         i686 |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/5fbd965d206377cb37e8cd4f731b265c0cfcdeb1 | ORPH
>         or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/5168ce8759ac763acfebad86dbf5730a44a834d8 |
>          arm |            uboot-tools-2018.03 | NOK | http://autobuild.buildroot.net/results/7702d5df36a6532aafdbe6e9e62709bbfa058b54 |

I've been looking at this one the last few days.  Looks like includes
aren't working as expected with a generated header.  I'm guessing it
is a flags issue at this point but at this point I'm still trying to
establish the first failing commit (may just be an artifact of now
defaulting to the kconfig based type of build).

Matt
