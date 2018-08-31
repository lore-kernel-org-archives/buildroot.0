From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Aug 2018 23:54:25 +0200
Subject: [Buildroot] [PATCH 1/1] expat: disable docbook
In-Reply-To: <20180830164616.6288-1-fontaine.fabrice@gmail.com>
References: <20180830164616.6288-1-fontaine.fabrice@gmail.com>
Message-ID: <20180831235425.7cd44b09@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 30 Aug 2018 18:46:16 +0200, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.net/results/3a351ddd9b42b090e4a69ac480b7a16397699f6c
>  - http://autobuild.buildroot.net/results/41402af8bd102b35083e34c53c5f2e8a266dc63e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/expat/expat.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to next, thanks. However, for your next patches, and when we
have both master and next branches open, it would be nice if you could
specify in the prefix if the patch is for master or next (see on the
mailing list how others are doing this). Otherwise, for each fix, I
have to find out whether it's a fix intended for master or for next.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
