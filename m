From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 27 May 2020 22:46:29 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-05-26
In-Reply-To: <20200527062707.DEB5386AB3@fraxinus.osuosl.org>
References: <20200527062707.DEB5386AB3@fraxinus.osuosl.org>
Message-ID: <20200527224629.43e5a24b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

On Wed, 27 May 2020 06:27:01 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> Autobuild statistics for 2020-05-26
> ===============================
[...]
> Results for branch 'master'
> ===========================
[...]
>     arc      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/629649a81fef2be611edf227b059c0d3dc389e99 |
>     arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/e6ac4bf3fe6c9b96bb50c94b1139c05a46c3ec67 |

Can be fixed by [1] (is in state 'accepted' but I can not find the patch in git master/next)...

Regards,
Peter

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20200510194344.13852-1-ps.report at gmx.net/
