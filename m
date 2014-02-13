From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 22:08:54 +0100
Subject: [Buildroot] [PATCH] python: fix to ensure libpython is stripped
In-Reply-To: <1390448438-13114-1-git-send-email-przemyslaw.wrzos@calyptech.com>
References: <1390448438-13114-1-git-send-email-przemyslaw.wrzos@calyptech.com>
Message-ID: <20140213220854.0db94a08@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Przemyslaw Wrzos,

On Thu, 23 Jan 2014 14:40:38 +1100, Przemyslaw Wrzos wrote:
> The python and python3 builds mark libpython as read-only which
> prevents it from being stripped out correctly for the target.
> 
> Signed-off-by: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
> ---
>  package/python/python.mk   | 9 +++++++++
>  package/python3/python3.mk | 9 +++++++++
>  2 files changed, 18 insertions(+)
> 
>  NOTE: Resubmitting as part of patchwork cleanup #6.

I have integrated this patch into the large set of Python patches I've
posted at
http://lists.busybox.net/pipermail/buildroot/2014-February/089309.html.

However, I agree with Thomas De Schampheleire that this specific patch
should be merged for 2014.02, as it fixes a real problem, and gives a
nice size reduction.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
