From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Mon, 30 Jul 2007 21:06:34 +0200 (CEST)
Subject: [Buildroot] --includedir=/usr/include vs
	--includedir=(STAGING_DIR)/usr/include
In-Reply-To: <20070730190231.GA5834@real.realitydiluted.com>
References: <0707302043450.17391@somehost>
	<20070730190231.GA5834@real.realitydiluted.com>
Message-ID: <0707302103451.17391@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Jul 2007, Steven J. Hill wrote:

> > Noticed that some .mk files use different --includedir= configure options.
> > Shouldn't --includedir=/usr/include be used everywhere?
> >
> With the recent changes that buildroot has undergone, I actually think
> this is a good idea. Any objections to getting rid of 'include' in the
> staging directory all together and going to 'usr/include'?

That's fine with me. But my question was:

  --includedir=/usr/include vs --includedir=$(STAGING_DIR)/usr/include
                                            ^^^^^^^^^^^^^^

Cheers,

-- 
Cristian
