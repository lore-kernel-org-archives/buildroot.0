From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 23 Mar 2018 08:18:29 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-03-22
In-Reply-To: <20180323070009.1FD66208B0@mail.bootlin.com>
References: <20180323070009.1FD66208B0@mail.bootlin.com>
Message-ID: <CANQCQpYHhR+SF3VH_FB_khp0My6G5gjMPthXB73=qB7kyQbfUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, Carlos,

On Fri, Mar 23, 2018 at 2:00 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> Build statistics for 2018-03-22

[snip]

>         bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/70e1f78ed1bc49791b70594ba4135a4fb7c61219 |
>         bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/75e547c648aa060eb0ffd1c73d98f544968bbab4 |
>          arm |                        unknown | NOK | http://autobuild.buildroot.net/results/6c9c695e5e7b5c3bac705be3926a43539b8a3a42 |
>          arm |                        unknown | NOK | http://autobuild.buildroot.net/results/2e03eecb0f076f7d516f1389b5d2c492e31295d8 |
>         bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/698c6e5d3fa8f2a1dd268bbd0b2ffe83084c4c41 |

These all look like they're related to building TPM2 tools and a new
circular dependency?  I noticed a few patchsets that looked related
but I don't believe cover this case yet, right?

Matt
