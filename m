From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 8 Oct 2019 22:09:40 +0200
Subject: [Buildroot] [PATCH v1] package/collectd: needs host-bison
In-Reply-To: <20191007225846.75e2f751@windsurf>
References: <20191003152922.21881-1-ps.report@gmx.net>
 <20191005232144.4974bac8@windsurf.home>
 <20191006151851.739c4baf@gmx.net> <20191006152909.5113de2f@gmx.net>
 <07da742a-3473-5f30-140b-795386731f9e@mind.be>
 <20191007225846.75e2f751@windsurf>
Message-ID: <20191008220940.0224bdac@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 7 Oct 2019 22:58:46 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Mon, 7 Oct 2019 22:55:11 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
>
> >  Given the following comment [3] I think it might be better to revert collectd
> > to 5.9.0:
> >
> > "All these issues are bugs, because release process done by another person than
> > before. All that is done w/o explicit permission from project "owner", so
> > results are expected."
> >
> >  Or, of course, we can wait a bit to see if a proper 5.9.3 gets released...
>
> Let's do a revert for now ?
>
> Thomas

According to [4] 'So, I've updated the tarball on the release page here on github.' but
I believe only the collectd-5.9.2.tar.bz2 one (and not the collectd-5.9.2.tar.gz one
used by buildroot), but the bz2 one contains now the missing parser.c file...

Regards,
Peter

[4] https://github.com/collectd/collectd/issues/3293#issuecomment-539468049
