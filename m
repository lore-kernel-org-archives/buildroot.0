From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Wed, 17 Aug 2011 19:32:11 +0200
Subject: [Buildroot] [PATCH 2/2] package: add openocd support
In-Reply-To: <20110817125710.3191fd49@skate>
References: <1312911561-23942-1-git-send-email-plagnioj@jcrosoft.com>
 <1312911561-23942-2-git-send-email-plagnioj@jcrosoft.com>
 <20110817125710.3191fd49@skate>
Message-ID: <20110817173211.GA30330@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12:57 Wed 17 Aug     , Thomas Petazzoni wrote:
> Hello,
> 
> Le Tue,  9 Aug 2011 19:39:21 +0200,
> Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> a ?crit :
> 
> > +	--oldincludedir=$(STAGING_DIR)/usr/include \
> > +	--includedir=$(STAGING_DIR)/usr/include \
> 
> Why are those options needed?
without openocd looks for /usr/include

Best Regards,
J.
