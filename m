From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 1 Apr 2018 15:07:27 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-03-31
In-Reply-To: <20180401060019.002D520764@mail.bootlin.com>
References: <20180401060019.002D520764@mail.bootlin.com>
Message-ID: <20180401150727.GB18124@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun,  1 Apr 2018 08:00:18 +0200 (CEST), Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

>          arm |                   brotli-1.0.3 | NOK | http://autobuild.buildroot.net/results/c2d7ef28b3af3b680ba62a5557ecf5b1f3915ad3 |     
>          arm |                   brotli-1.0.3 | NOK | http://autobuild.buildroot.net/results/ca2a9770f64a10fd1b54ecdd08d292dfd67d7918 |     
>         m68k |                   brotli-1.0.3 | NOK | http://autobuild.buildroot.net/results/0215539bf726532b464e2a527140b6a06dd0091d |     

The two failures in ARM should be fixed by this recent commit:

  https://git.busybox.net/buildroot/commit/?id=557cd845b216de8bfe7bb8d2ebf61bf020026f90

I suspect that the build failure on m68k might be fixed by this one as well,
right now I'm running a local build with that configuration to check.

Cheers,


--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180401/dffc11f3/attachment.asc>
