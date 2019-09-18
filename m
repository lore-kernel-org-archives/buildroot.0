From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Sep 2019 17:53:51 +0200
Subject: [Buildroot] [PATCH] package/bc: remove default value of _SOURCE
 var
In-Reply-To: <20190918013506.21430-1-matthew.weber@rockwellcollins.com>
References: <20190918013506.21430-1-matthew.weber@rockwellcollins.com>
Message-ID: <20190918175351.7d1e1168@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 17 Sep 2019 20:35:06 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> check-package output:
> package/bc/bc.mk:8: remove default value of _SOURCE variable
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/295683825
> 
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/bc/bc.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
