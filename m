From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 22 Feb 2018 16:41:12 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-02-21
In-Reply-To: <20180222070010.882C22071A@mail.free-electrons.com>
References: <20180222070010.882C22071A@mail.free-electrons.com>
Message-ID: <CANQCQpZ4LfgTJakUKquxknPxepYKmoXoGGAztFwMEuBiw1nY7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas/Fabrice,

On Thu, Feb 22, 2018 at 1:00 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> Build statistics for 2018-02-21
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>       master | 172 |  28 |   0 | 200 |
>    2017.11.x |  23 |   0 |   0 |  23 |
>         next |  32 |  28 |   0 |  60 |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>                   boost-1.66.0 | 6

>         bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/ffa5f21d7e7c38ea7adebc84f1cc8ee4cff74f1b |
> microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/2879576eaa870eecd31af1ff9261df1b86966542 |
>          arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/a89df3195b44f125ba1797cf866f4a266909ec05 |
>      powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/c947986e4f460c1733c81585302f58baca84f01a |
>          arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/679a12c04e9954947dd51df2017af561c362f8ec |
>         or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/4e901a97ad1c21f21e508eab8268374220f2eba3 |

Similar to (https://patchwork.ozlabs.org/patch/871696/).  Feels like a
similar patch is needed for Boost?  I don't have the history on the
discussion for the domoticz pkg.

Matt
