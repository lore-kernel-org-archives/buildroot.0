From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 09:00:24 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/go: bump to go 1.14.8
In-Reply-To: <CA+h8R2rKrawRbA8bdqL68FhwuUwD1ExnvPEv92fY0XvVwx_1Ug@mail.gmail.com>
References: <20200906055710.754782-1-christian@paral.in>
 <20200906143302.38f5a5bd@windsurf.home>
 <CA+h8R2rKrawRbA8bdqL68FhwuUwD1ExnvPEv92fY0XvVwx_1Ug@mail.gmail.com>
Message-ID: <20200907090024.2a0a1c5f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 6 Sep 2020 16:22:15 -0700
Christian Stewart <christian@paral.in> wrote:

> I submitted two versions: 1.14.x (for master) and 1.15.x (for next),
> given that 1.14 is still maintained and we usually upgrade by 1 major
> version at a time.

As I replied to another e-mail of you, we don't have master/next
currently. We only have a "next" branch when "master" is frozen because
we are approaching a Buildroot release.

And even if we had master/next, then we wouldn't merge the 1.14.x bump
in master, as we don't merge any version bump in master when we're
approaching a release, unless there are security implications.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
