From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Apr 2020 16:35:59 +0200
Subject: [Buildroot] Suggestion: consider tzdata updates for LTS
Message-ID: <20200402163559.27bd922a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'd like to propose that updates to the tzdata package are made to the
active LTS branch. Indeed, even "old" systems that are in production
want to stay up-to-date with timezone information changes. Some country
or geographic areas once in a while change their time zone rules, and
it makes sense to keep systems in the field update with that.

As I believe tzdata updates are pretty low risk, I would suggest that
we systematically backport updates to this package to the currently
maintained LTS branch.

What do you think ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
