From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Oct 2020 17:38:21 +0200
Subject: [Buildroot] [PATCH 1/4] package/libabseil-cpp: bump version to
 20200923.2
In-Reply-To: <331c90d0-8c60-c973-88bc-eafb74e4ca64@heine.tech>
References: <20201021151839.31731-1-buildroot@heine.tech>
 <331c90d0-8c60-c973-88bc-eafb74e4ca64@heine.tech>
Message-ID: <20201021173821.42b3318a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 21 Oct 2020 17:28:37 +0200
Michael Nosthoff <buildroot@heine.tech> wrote:

> I decided to remove the patch after following your discussion with
> upstream [0] and the change that followed it [1].
> 
> It now relies on __has_include which, as pointed out in the discussion,
> works from gcc 4.9.2. And if __has_include isn't available it uses the
> fallback.
> 
> Do you think this is sufficient? Or should we add a dependency on GCC >
> 4.9.2?

If as you say when __has_include isn't available it uses the fallback,
we're good to go without a gcc >= 4.9.x dependency.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
