From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 22:17:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/exfatprogs: add patch fixing
 missing <sys/types.h>
In-Reply-To: <20200424202959.77348-1-james.hilliard1@gmail.com>
References: <20200424202959.77348-1-james.hilliard1@gmail.com>
Message-ID: <20200425221735.0c7071e6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Apr 2020 14:29:59 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This patch had been merged by upstream but appears to have been
> accidentially overwritten with a force push. Let's add back the
> rebased version until fixed by upstream.
> 
> Fixes:
> http://autobuild.buildroot.net/results/667/667409f1d44a3f9be43aaff3f9a3426fe1386de2/build-end.log
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...rogs-add-missing-include-sys-types.h.patch | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/exfatprogs/0001-exfatprogs-add-missing-include-sys-types.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
