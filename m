From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 21:41:30 +0200
Subject: [Buildroot] [PATCH v8 1/1] mosh: new package
In-Reply-To: <CA+h8R2qyYPpyNpASpjg1+8ivxhX2x8yvD4pdzhSn3W=ypphqQg@mail.gmail.com>
References: <1437928447-26907-1-git-send-email-christian@paral.in>
 <20150726193517.40776cc8@free-electrons.com>
 <CA+h8R2qyYPpyNpASpjg1+8ivxhX2x8yvD4pdzhSn3W=ypphqQg@mail.gmail.com>
Message-ID: <20150726214130.196b8cbf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christian Stewart,

Please don't top-post, thanks!

On Sun, 26 Jul 2015 18:02:29 +0000, Christian Stewart wrote:

> No, they will reject it regardless of how it is coded. Checking a global
> POSIX command exists is not worth it to them as it exists on most systems
> anyway. They requested I make a patch for BR that outputs a special debug
> line for buildroot users so they know what they're dealing with if someone
> submits a log.

Can you try anyway? Because what I'm proposing is significantly
different from what you proposed in your pull request. My proposal has
the advantage of keeping the locale output when 'locale' is available
*and* warn that locale is not available otherwise. Basically it exactly
matches the requirements of the upstream mosh developers.

We don't like to keep patches in Buildroot forever, so having an
upstreamable solution is important.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
