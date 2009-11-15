From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sun, 15 Nov 2009 16:38:23 +0100
Subject: [Buildroot] [PATCH 4/8] flex: add flex-host package (required
 by webkit)
In-Reply-To: <20091115123925.0649e537@surf>
References: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
	<1258279977-1482-5-git-send-email-llandwerlin@gmail.com>
	<20091115123925.0649e537@surf>
Message-ID: <1258299503.24296.88.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dimanche 15 novembre 2009 ? 12:39 +0100, Thomas Petazzoni a ?crit :
> Hi Lionel,
> 
> Le Sun, 15 Nov 2009 11:12:53 +0100,
> llandwerlin at gmail.com a ?crit :
> 
> >  $(eval $(call AUTOTARGETS,package,flex))
> > +$(eval $(call AUTOTARGETS,package,flex,host))
> 
> Thanks for using so quickly the new autotools infrastructure! Have you
> been able to use it with success ?

No problem with a few packages.

> 
> However, please note that if you depend on this new infrastructure,
> your patches will not be integrated in the upcoming 2009.11 release,
> because the new infrastructure is post-2009.11 material.

Ok no problem.
