From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Aug 2020 16:16:21 +0200
Subject: [Buildroot] [PATCH] package/pulseview: fix build with recent Qt
 versions
In-Reply-To: <20200814191258.984535-1-thomas.petazzoni@bootlin.com>
References: <20200814191258.984535-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200815161621.3bc75f6a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Aug 2020 21:12:58 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> This commit backports an upstream commit to fix the build of pulseview
> with recent Qt versions.
> 
> Note that pulseview has a 0.4.2 version (newer than our 0.4.1) but it
> doesn't have the fix we need. And 0.4.2 now requires additional Qt
> translation tools, so the update to 0.4.2 is anyway not
> straightforward.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/c9e27a91905dfda0ba1ddb12c7910316d3ee82ef/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...place-obsolete-deprecated-Qt-methods.patch | 133 ++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 package/pulseview/0002-Replace-obsolete-deprecated-Qt-methods.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
