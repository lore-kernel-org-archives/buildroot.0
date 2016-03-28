From: Matt Fornero <Matt.Fornero@mathworks.com>
Date: Mon, 28 Mar 2016 18:52:34 +0000
Subject: [Buildroot] [PATCH v2] toolchain-external: Commonize
 /lib/<tuple> symlinks
In-Reply-To: <20160328175120.GN2637@tarshish>
References: <1459186584-4229-1-git-send-email-matt.fornero@mathworks.com>
 <20160328175120.GN2637@tarshish>
Message-ID: <830ebbcd639f465d97600a3128665c3e@ex13amer-00-ah.ad.mathworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: Baruch Siach [mailto:baruch at tkos.co.il]
...
> 
> On Mon, Mar 28, 2016 at 01:36:24PM -0400, Matthew Fornero wrote:
> > +config BR2_TOOLCHAIN_EXTERNAL_PREFIX_SYMLINK
> > +	bool "Symlink /lib/<tuple>"
> > +	help
> > +	  Select this option if your external toolchain needs a symlink
> > +	  from the /lib directory to the /lib/<tuple> directory. This is
> > +	  may be required if your toolchain is based on one from Linaro.
> 
> Redundant 'is'.
> 

Thanks Baruch-- will fix in v3 and send tomorrow in case of additional
comments

-Matt
