From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Aug 2016 16:49:17 +0200
Subject: [Buildroot] [git commit branch/next] package/docker-engine:
 bump to v1.12.0
In-Reply-To: <20160816110755.6DEEB82132@busybox.osuosl.org>
References: <20160816110755.6DEEB82132@busybox.osuosl.org>
Message-ID: <20160817164917.01972edc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Aug 2016 12:58:47 +0200, Peter Korsgaard wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=f892015d78eb0f2cc7ddd754beabcf41bfa6da6b
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next
> 
> Bump docker-engine to the latest stable v1.12.0 from v1.12.0-rc3.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

I believe this should have been committed to master. Indeed, we
packaged the -rc4 version, waiting for the final release, and this
patch precisely bumps to the final release. So it should have landed in
master IMO.

BTW, the patch description is wrong: it states that we're bumping from
-rc3 to final, but it's really bumping from -rc4 to final.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
