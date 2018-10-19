From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 19 Oct 2018 10:08:51 +0200
Subject: [Buildroot] [PATCH] meson: bump version to 0.48.1
In-Reply-To: <20181018204431.29117-1-eric.le.bihan.dev@free.fr>
References: <20181018204431.29117-1-eric.le.bihan.dev@free.fr>
Message-ID: <20181019100851.1ac7074e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello ?ric,

On Thu, 18 Oct 2018 22:44:31 +0200, Eric Le Bihan wrote:
> Bump version to 0.48.1 and re-add the RPATH patch.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

There was another thread on the mailing list saying that the RPATH
patch was in fact needed for host meson packages, and it seems
therefore independent from the version bump.

Would it be possible to have two separate patches, one re-adding the
RPATH fix first, one doing the bump? Indeed we may need to backport the
former to one of our stable branches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
