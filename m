From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 16 Nov 2012 09:53:55 +0100
Subject: [Buildroot] Xtensa updates
In-Reply-To: <201211152304.37056.yann.morin.1998@free.fr>
References: <87bofdvg25.fsf@dell.be.48ers.dk> <20121112123519.228f7544@skate>
 <CAC1BbcRQ1ecodzDHFCwemK8DkP7t5wD08FRKJ_qbP_jOGi+sOA@mail.gmail.com>
 <201211152304.37056.yann.morin.1998@free.fr>
Message-ID: <CAC1BbcTvCC3O_edGmRgNXCPXRn2uq-sA4gs5_Sx=mvLf9XkQ=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15 November 2012 23:04, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> Bernhard, All,
>
> On Monday 12 November 2012 Bernhard Reutner-Fischer wrote:
> > On 12 November 2012 12:35, Thomas Petazzoni <
> > thomas.petazzoni at free-electrons.com> wrote:
> > > In the process, would you mind changing the irker configuration so that
> > > the updates made on the Buildroot Git repository get notified on
> > > #buildroot instead of #uclibc?
> > done.
>
> Would it be possible for you to change the commit notifications to be
> shorter, please?
>

The default was
self.template = '%(bold)s%(project)s:%(reset)s %(green)s%(author)s%(reset)s
%(repo)s:%(yellow)s%(branch)s%(reset)s * %(bold)s%(rev)s%(reset)s /
%(bold)s%(files)s%(reset)s: %(logmsg)s %(brown)s%(url)s%(reset)s'


> Something like:
>   project:branch short-hash author subject
>

 I have changed this to
--template="%(repo)s:%(branch)s %(author)s * %(rev)s %(logmsg)s" \
now.
buildroot: s.martin49 buildroot:master * 2012.08-735-gb04a6d7 /
docs/manual/contribute.txt: manual: contribute.txt: do not use --summary
option with 'git format-patch'
http://git.buildroot.org/buildroot/commit/?id=b04a6d7bda0a0241003a79d026569d6e81e07105
vs.
buildroot:master s.martin49 * 2012.08-735-gb04a6d7 manual: contribute.txt:
do not use --summary option with 'git format-patch'

I still liked the url though.
Ok?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121116/d461992f/attachment.html>
