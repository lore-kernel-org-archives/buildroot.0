From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 18:02:19 +0200
Subject: [Buildroot] [PATCH] Revert "manual: Add notes about GitHub and
 hashes"
In-Reply-To: <CAGduivxzeH25hzV6Zd-pmm8wyMG-TgCkh88WTwCEaKZJw4NQ=Q@mail.gmail.com>
References: <1445181974-19619-1-git-send-email-s.martin49@gmail.com>
 <CAGduivxzeH25hzV6Zd-pmm8wyMG-TgCkh88WTwCEaKZJw4NQ=Q@mail.gmail.com>
Message-ID: <20151018180219.037bcae1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 18 Oct 2015 17:32:23 +0200, Maxime Hadjinlian wrote:

> Should we wait FOSDEM where we said that if there was not any problem we
> would simply add all the missing hashes for GitHub packages ? Or we go back
> on what we said and we do it now ?
> And so, should we apply this now, or wait a bit ?

We are now requesting people adding new packages fetched from Github to
use the hash file, so our documentation should reflect that.

Adding "all" the missing hashes is not necessarily something we have to
do right now. We can wait to gain a bit of knowledge/experience using
the hashes on newly added packages (or existing packages when they are
bumped), and if it continues to work fine, we'll add all hashes at some
point in the future.

I.e, please don't send a 200 patches patch series adding hashes for all
github downloaded packages.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
