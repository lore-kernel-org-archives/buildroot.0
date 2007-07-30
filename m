From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Mon, 30 Jul 2007 14:02:32 -0500
Subject: [Buildroot] --includedir=/usr/include vs
	--includedir=$(STAGING_DIR)/usr/include
In-Reply-To: <0707302043450.17391@somehost>
References: <0707302043450.17391@somehost>
Message-ID: <20070730190231.GA5834@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Noticed that some .mk files use different --includedir= configure options.
> Shouldn't --includedir=/usr/include be used everywhere?
> 
With the recent changes that buildroot has undergone, I actually think
this is a good idea. Any objections to getting rid of 'include' in the
staging directory all together and going to 'usr/include'?

-Steve
