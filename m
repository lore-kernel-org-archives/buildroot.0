From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:15:31 +0200
Subject: [Buildroot] [git commit] libnspr: fix Microblaze patch
In-Reply-To: <20170406141359.754828271B@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 6 Apr 2017 16:13:52 +0200")
References: <20170406141359.754828271B@busybox.osuosl.org>
Message-ID: <87efwhzkfg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=7039c4d456259ca2c2708be16ebea98a82adee3f
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Due to a mistake, the Microblaze patch was adding another #elif
 > defined(nios2), which doesn't make any sense. This commit gets rid of
 > it.

 > The rest of the noise in the change is due to the use of quilt to
 > generate the patches.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
