From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 22:59:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: drop python 2
 support
In-Reply-To: <20200408000948.52194-1-james.hilliard1@gmail.com>
References: <20200408000948.52194-1-james.hilliard1@gmail.com>
Message-ID: <20200408225927.6521d4f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  7 Apr 2020 18:09:48 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Upstream removed python 2 support so we need to depend on python 3.
> 
> Removed python 2 autobahn tests.
> 
> Removed python-six dependency which is no longer used by autobahn.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I agree with Romain: this commit log was not sufficiently documented.
References to the appropriate upstream commits + indication of what was
the first upstream release to drop Python 2.x support and to drop
python-six usage would have been relevant.

So I have extended the commit log with all those details, and applied.
For future patches, it would be nice if you could document the commit
log a bit more.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
