From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Feb 2017 14:55:57 +0100
Subject: [Buildroot] [PATCH 1/1] docs/website: Feed API and gmane fix
In-Reply-To: <CA+TH9VkC93CiJefDnUM6NxLpMGQYZCes5e6F3BySnyaK+YkxdA@mail.gmail.com>
References: <1486247694-7324-1-git-send-email-angelo.compagnucci@gmail.com>
 <20170204235131.7332d861@free-electrons.com>
 <CA+TH9VkC93CiJefDnUM6NxLpMGQYZCes5e6F3BySnyaK+YkxdA@mail.gmail.com>
Message-ID: <20170205145557.0e88713a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Feb 2017 09:52:00 +0100, Angelo Compagnucci wrote:

> Honestly, I cannot see your point here. I really cannot understand why
> I should submit a patch that fixes the gogole feed API but leaves the
> site broken because gmane is out of service. The rest of things are
> functional to these fixings, so again cannot be splitted.
> This patch makes the minimal set of changes to fix the currently
> broken website. If not interested, please discard it.

You're doing a few completely independent things in here:
 - Bumping the jquery/bootstrap versions
 - Switching to the Yahoo feed API and fixing to using a non GMane RSS
   feed
 - Fixing the search engine to not use GMane

I don't understand why you suddenly get mad, while all I'm asking is
exactly what we ask for all other Buildroot patches: one patch does
just one logical change. We ask this to all contributors. Why should
your contributions be handled with different rules?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
