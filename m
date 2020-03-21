From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 21 Mar 2020 14:43:29 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-03-19
In-Reply-To: <20200320072540.7317287447@fraxinus.osuosl.org>
References: <20200320072540.7317287447@fraxinus.osuosl.org>
Message-ID: <20200321144329.1e780a5e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 20 Mar 2020 07:25:34 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:


> Results for branch 'master'
> ===========================

>     arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/7d2385e710b79d71fd9fe7b480e279161aa91e20 |
>     arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/04f8aca18586e83d5e8a0f92a8cfbe0205c460d9 |
>     arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/317a8550e15ccca157c53ce8b7f992623127954c |

Should be fixed with 'package/libevdev: fix static compile' ([1])...

Regards,
Peter

[1] https://patchwork.ozlabs.org/patch/1252031/
