From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 22:46:31 +0100
Subject: [Buildroot] [PATCH] package/apitrace: Fix build under
 uClibc/musl
In-Reply-To: <20191208185822.163008-1-paul@crapouillou.net>
References: <20191208185822.163008-1-paul@crapouillou.net>
Message-ID: <20191208224631.237890b5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Dec 2019 19:58:22 +0100
Paul Cercueil <paul@crapouillou.net> wrote:

> Add a patch which has been merged upstream
> (PR: https://github.com/apitrace/apitrace/pull/644) which allows

instead of a reference to the PR in the commit log, I've added a
reference to the upstream commit inside the patch itself.

Applied with this change. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
