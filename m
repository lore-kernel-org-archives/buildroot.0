From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 18 Apr 2008 11:45:37 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/package:  axel
In-Reply-To: <1208409106.17959.28.camel@nigel-x60>
References: <20080417045258.41B6D3C61D@busybox.net>
	<1208409106.17959.28.camel@nigel-x60>
Message-ID: <20080418014537.GA18960@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 17, 2008 at 05:11:46AM +0000, Nigel Kukard wrote:
> > Log:
> > Added package for axel download accelerator
> > 
> 
> > +$(AXEL_DIR)/Makefile.settings: $(AXEL_DIR)/.unpacked
> > +	(cd $(AXEL_DIR); \
> > +		./configure --enable-i18n=0 --prefix=/usr \
> > +	)
> > +	touch $@
> 
> Can you not use autotools?

Despite having a script called configure, the package does not use
autoconf. It may still be possible to use the autotools macros though.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
