From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 22:36:55 +0200
Subject: [Buildroot] [PATCH] python-validators: bump version to 0.15.0
In-Reply-To: <20200609063010.16673-1-peter@korsgaard.com>
References: <20200609063010.16673-1-peter@korsgaard.com>
Message-ID: <20200610223655.4182b0ea@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Jun 2020 08:30:10 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Upstream dropped python 2.x support, so add a dependency on python3:
> https://github.com/kvesteri/validators/commit/f8608f45378bd465072176772887c685d1d7c300
> 
> License is MIT, not BSD:
> https://github.com/kvesteri/validators/commit/669129a3d3eb106e1b2d82bd9911faebb3287db6

This problem is already there in 2020.05.. and probably in 2020.02, so
this license fix is really a fix, which is independent from the 0.15.0
bump. Could you send two separate patches.

> And adjust the .hash spacing for the new agreements.

I'm not sure about the "for the new agreements" wording.

Also the "package/" prefix is missing in the commit title.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
