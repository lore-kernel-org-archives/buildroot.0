From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 18:55:48 +0200
Subject: [Buildroot] [PATCH] package/musl: Make scheduler functions
 Linux-compatible
In-Reply-To: <a03605e62a3879a0fffcbd14be04907cc3e54d3c.camel@gmail.com>
References: <509e7dab95b95c040af26c842e94777b069d6ba5.camel@gmail.com>
 <20190513221341.4150ab0c@windsurf.home>
 <071f102e7135306dfdba3203fbd35bdc07aa185f.camel@gmail.com>
 <20190514183356.50c06a52@windsurf>
 <a03605e62a3879a0fffcbd14be04907cc3e54d3c.camel@gmail.com>
Message-ID: <20190514185548.13b23569@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please keep the mailing list Cc'ed. Thanks!

On Tue, 14 May 2019 18:51:05 +0200
stefan.nickl at gmail.com wrote:

> Should I move the text all out from the patch to the commit log, or can
> I just duplicate the text inside and outside the patch?
> Or should one be more detailed and the other shorter?

The text can be similar, but it has a different target.

The commit log is meant to be useful to Buildroot, so it should explain
why in Buildroot we would want this change.

The description of the musl patch itself should theoretically be
unrelated to Buildroot: it should ideally be an upstreamable patch, and
musl doesn't care about Buildroot specifically.

So the patch description should really describe the change in terms of
the upstream project, while the commit log should describe the change
in the context of Buildroot.

Does this helps?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
