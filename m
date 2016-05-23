From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 17:08:47 +0200
Subject: [Buildroot] [PATCH v2] python-backports-abc: depend on Python
 2.x
In-Reply-To: <1463641229-6426-1-git-send-email-yegorslists@googlemail.com>
References: <1463641229-6426-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160523170847.0c25beb7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 May 2016 09:00:29 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> This package is a backport from Python 3.5, so it is not needed
> for Python 3.5.x environment.
> 
> Fix python-tornado dependecies, so that python-backports-abc
> is only selected for Python 2.x.
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes:
> 	v2: sqaush both commits into one (Arnout Vandecappelle)

I've applied to next, because Python 3.5 is only in next. Let me know
if I misunderstood something.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
